<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Buku;
use App\Anggota;
use App\Transaksi;
use Carbon\Carbon;
use Session;
use Illuminate\Support\Facades\Redirect;
use Auth;
use DB;
use RealRashid\SweetAlert\Facades\Alert;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        if(Auth::user()->level == 'user')
        {
            $datas = Transaksi::where('anggota_nama', Auth::user()->name)
                                ->get();
        } else {
            $datas = Transaksi::get();
        }
        return view('transaksi.index', compact('datas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        $getRow = Transaksi::orderBy('id', 'DESC')->get();
        $rowCount = $getRow->count();
        
        $lastId = $getRow->first();

        $kode = "TR00001";
        
        if ($rowCount > 0) {
            if ($lastId->id < 9) {
                    $kode = "TR0000".''.($lastId->id + 1);
            } else if ($lastId->id < 99) {
                    $kode = "TR000".''.($lastId->id + 1);
            } else if ($lastId->id < 999) {
                    $kode = "TR00".''.($lastId->id + 1);
            } else if ($lastId->id < 9999) {
                    $kode = "TR0".''.($lastId->id + 1);
            } else {
                    $kode = "TR".''.($lastId->id + 1);
            }
        }

        $bukus = Buku::where('jumlah_alat', '>', 0)->get();
        $anggotas = Anggota::get();
        return view('transaksi.create', compact('bukus', 'kode', 'anggotas'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return response()->json($request);  
        $this->validate($request, [
            'kode_transaksi' => 'required|string|max:255',
            'anggota_nama' => 'required',
            'kode_alat' => 'required',
            'alat' => 'required',
            'lokasi' => 'required',
            'tgl_pinjam' => 'required',
            'tgl_kembali' => 'required',
            'ket' => 'required',

        ]);

        $transaksi = Transaksi::create([
                'kode_transaksi' => $request->get('kode_transaksi'),
                'anggota_nama' => $request->get('anggota_nama'),
                'alat' => $request->get('alat'),
                'kode_alat' => $request->get('kode_alat'),
                'alat' => $request->get('alat'),
                'lokasi' => $request->get('lokasi'),
                'tgl_pinjam' => $request->get('tgl_pinjam'),
                'tgl_kembali' => $request->get('tgl_kembali'),
                'ket' => $request->get('ket'),
                'status' => 'pinjam'
            ]);

        $alat = Buku::where('kode_alat', $transaksi->kode_alat);

        $jumlah_alat = $alat->first()->jumlah_alat;

                        $alat->update([
                            'jumlah_alat' => ($jumlah_alat - 1),
                            ]); 

        alert()->success('Berhasil.','Data telah ditambahkan!');
        return redirect()->route('transaksi.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($nama)
    {

        $data = Transaksi::findOrFail($nama);


        if((Auth::user()->level == 'user') && (Auth::user()->anggota->nama != $data->anggota_nama)) {
                Alert::info('Oopss..', 'Anda dilarang masuk ke area ini.');
                return redirect()->to('/');
        }


        return view('transaksi.show', compact('data'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($nama)
    {   
        $data = Transaksi::findOrFail($nama);

        if((Auth::user()->level == 'user') && (Auth::user()->anggota->nama != $data->anggota_nama)) {
                Alert::info('Oopss..', 'Anda dilarang masuk ke area ini.');
                return redirect()->to('/');
        }

        return view('buku.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id_transaksi)
    {
        $transaksi = Transaksi::find($id_transaksi);

        $alat = Buku::where('kode_alat', $transaksi->kode_alat);

        $jumlah_alat = $alat->first()->jumlah_alat;
                
        $alat->update([
                'jumlah_alat' => ($jumlah_alat + 1)
            ]);

        $transaksi->update([
                'status' => 'kembali'
                ]);


        alert()->success('Berhasil.','Data telah diubah!');
        return redirect()->route('transaksi.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($kode_alat)
    {
        Transaksi::find($kode_alat)  ->delete();
        alert()->success('Berhasil.','Data telah dihapus!');
        return redirect()->route('transaksi.index');
    }
}
