<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Attendance;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class USSDController extends Controller
{
    public function handle(Request $request)
    {
        $text = $request->input('text');
        $phone = $request->input('phoneNumber');

        $student = Student::where('phone_number', $phone)->first();
        $textArray = explode('*', $text);

        $response = "";

        if (!$student) {
            $response = "END You are not registered in the attendance system.";
        } else {
            if (empty($text)) {
                $response = "CON Welcome to the Class Attendance System\n";
                $response .= "1. Mark Attendance\n";
                $response .= "2. Check Attendance Status\n";
                $response .= "3. Exit";
            } elseif ($text === "1") {
                $today = Carbon::today();
                $alreadyMarked = Attendance::where('student_id', $student->id)
                    ->whereDate('date', $today)->exists();

                if ($alreadyMarked) {
                    $response = "END You already marked attendance today.";
                } else {
                    Attendance::create([
                        'student_id' => $student->id,
                        'date' => $today,
                        'status' => 'present'
                    ]);
                    $response = "END Attendance marked successfully!";
                }
            } elseif ($text === "2") {
                $today = Carbon::today();
                $marked = Attendance::where('student_id', $student->id)
                    ->whereDate('date', $today)->exists();

                if ($marked) {
                    $response = "END You are marked present today.";
                } else {
                    $response = "END You have not marked attendance today.";
                }
            } elseif ($text === "3") {
                $response = "END Goodbye! Thank you for using the Attendance System.";
            } else {
                $response = "END Invalid option.";
            }
        }

        return response($response)->header('Content-Type', 'text/plain');
    }
}