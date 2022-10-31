<?php

namespace App\Http\Controllers;

use App\Models\Rig;
use Illuminate\Http\Request;

class SpyController extends Controller
{

    public function report(Request $request)
    {
        $rig_name =$request->query('n');

        $rig = Rig::firstOrCreate(['name' => $rig_name]);
        $rig->touch();
        $start_hssh = $rig->start_hssh;
        $rig->start_hssh = false;
        $rig->save();

        return $start_hssh ? $rig->id : 0;
    }

    public function hssh(Request $request, $rig_id)
    {
        //$rig_name =$request->query('n');

        //$rig = Rig::firstOrCreate(['name' => $rig_name]);

        $rig= Rig::findOrFail($rig_id);

        $rig->hssh_result = $request->input('hssh');
        $rig->save();



    }
}
