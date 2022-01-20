<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Support\Facades\DB;
use Laravel\Lumen\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->call(function () {
            file_put_contents(uniqid() . '_EVERY_ONE_MINUTE', 'Hello World!');
        })->everyMinute();

        $schedule->call(function () {
            file_put_contents(uniqid() . '_EVERY_TWO_MINUTE', 'Hello World!');
        })->everyTwoMinutes();
    }
}
