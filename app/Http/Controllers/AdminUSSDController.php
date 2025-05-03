<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Attendance;
use App\Models\Student;
use Carbon\Carbon;

class AdminUSSDController extends Controller
{
    public function handle(Request $request)
    {
        $text = $request->input('text');
        $phone = $request->input('phoneNumber');
        $admins = explode(',', env('ADMIN_PHONES'));

        // Check if the phone is authorized (admin check)
        if (!in_array($phone, $admins)) {
            return response("END You are not authorized.", 200)
                ->header('Content-Type', 'text/plain');
        }

        // Handle empty text case (first entry point)
        if (empty($text)) {
            return response("CON Welcome Admin\n1. View Today's Attendance\n2. View Attendance by Date\n3. Exit", 200)
                ->header('Content-Type', 'text/plain');
        }

        // Split user input by *
        $textArray = explode('*', $text);
        $level = count($textArray);
        $response = "";

        // Check the user's current level in the USSD menu
        switch ($level) {
            case 1:
                // User has selected an option from the main menu
                switch ($textArray[0]) {
                    case "1":
                        // View today's attendance
                        $today = Carbon::today()->toDateString();
                        $attendance = Attendance::with('student')->whereDate('date', $today)->get();

                        if ($attendance->isEmpty()) {
                            $response = "END No attendance records today.";
                        } else {
                            $names = $attendance->pluck('student.name')->implode(", ");
                            $response = "END Present today: " . $names;
                        }
                        break;

                    case "2":
                        // Ask for date to view attendance
                        $response = "CON Enter date (YYYY-MM-DD):";
                        break;

                    case "3":
                        // Exit
                        $response = "END Goodbye!";
                        break;

                    default:
                        $response = "END Invalid option.";
                        break;
                }
                break;

            case 2:
                // User has entered a date after selecting option 2
                if ($textArray[0] == "2") {
                    $date = $textArray[1];

                    // Validate date format
                    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date)) {
                        $response = "END Invalid date format. Please use YYYY-MM-DD.";
                        break;
                    }

                    try {
                        $carbonDate = Carbon::parse($date);
                        $attendance = Attendance::with('student')->whereDate('date', $date)->get();

                        if ($attendance->isEmpty()) {
                            $response = "END No attendance records on $date.";
                        } else {
                            $names = $attendance->pluck('student.name')->implode(", ");
                            $response = "END Present on $date: " . $names;
                        }
                    } catch (\Exception $e) {
                        $response = "END Invalid date. Please use YYYY-MM-DD format.";
                    }
                } else {
                    $response = "END Invalid sequence.";
                }
                break;

            default:
                $response = "END Invalid input.";
                break;
        }

        return response($response, 200)->header('Content-Type', 'text/plain');
    }
}