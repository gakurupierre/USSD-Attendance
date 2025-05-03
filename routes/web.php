<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\USSDController;
use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Attendance;
use App\Http\Controllers\AdminUSSDController;

Route::post('/ussd', [USSDController::class, 'handle']);

Route::post('/admin-ussd', [AdminUSSDController::class, 'handle']);