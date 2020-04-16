<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Buku extends Model
{
    protected $table = 'peralatan';
    protected $fillable = ['alat', 'kode_alat', 'merek', 'jenis_alat', 'tahun_beli', 'jumlah_alat', 'lokasi', 'deskripsi', 'cover'];

    /**
     * Method One To Many 
     */
    public function transaksi()
    {
    	return $this->hasMany(Transaksi::class);
    }
}
