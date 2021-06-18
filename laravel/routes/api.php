<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', 'App\Http\Controllers\UserController@register');
Route::post('/login', 'App\Http\Controllers\UserController@login');
Route::get('/user', 'App\Http\Controllers\UserController@getCurrentUser');
Route::post('/update', 'App\Http\Controllers\UserController@update');
Route::get('/logout', 'App\Http\Controllers\UserController@logout');




//get type_ie=3 articles where are welcome info
Route::get('/welcomeinfo/', 'App\Http\Controllers\ArticlesController@welcomeInfo');
