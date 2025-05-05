<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('students')->insert([
            [
                'name' => 'GAKURU Pierre',
                'phone_number' => '+250785145289',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'UWASE Alice',
                'phone_number' => '+250783456789',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'MFITUMUKIZA Bliss',
                'phone_number' => '+250791625007',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'IRARUTA Prince',
                'phone_number' => '+250787160872',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'MUSABE Kizito',
                'phone_number' => '+250789386400',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'IGIRANEZA Celestin',
                'phone_number' => '+250785962001',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'name' => 'NDAYISHIMIYE Theophile',
                'phone_number' => '+250791749231',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'NDUWIMANA John',
                'phone_number' => '+250788123456',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'IMANISHIMWE Jean Claude',
                'phone_number' => '+250787770456',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'IRAGUHA Emmanuel',
                'phone_number' => '+250783801752',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'HARAMBINEZA Protogène',
                'phone_number' => '+250792389510',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Add more records here
        ]);
    }
}