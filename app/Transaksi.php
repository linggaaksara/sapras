<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'transaksi';
    protected $fillable = ['kode_transaksi', 'anggota_nama', 'alat', 'kode_alat', 'lokasi', 'tgl_pinjam', 'tgl_kembali', 'status', 'ket'];

    public function anggota()
    {
    	return $this->belongsTo(Anggota::class, 'anggota_nama', 'id');
    }

    public function buku()
    {
    	return $this->belongsTo(Buku::class);
    }
}
