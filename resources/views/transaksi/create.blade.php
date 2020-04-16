@section('js')
 <script type="text/javascript">
            $(document).on('click', '.pilih', function (e) {
              console.log(this);
                document.getElementById("alat").value = $(this).attr('data-alat');
                document.getElementById("kode_alat").value = $(this).attr('data-kode_alat');
                document.getElementById("lokasi").value = $(this).attr('data-lokasi');
                $('#myModal').modal('hide');
            });


            $(document).on('click', '.pilih_anggota', function (e) {
                document.getElementById("anggota_nama").value = $(this).attr('data-anggota_nama');
                document.getElementById("anggota_id").value = $(this).attr('data-anggota_id');
                $('#myModal2').modal('hide');
            });
          
             $(function () {
                $("#lookup, #lookup2").dataTable();
            });

             $(document).ready(function() {
              var temp = null;
              var action = 0;
              $('#kode_alat').on('change input', function(e){
                e.preventDefault();
                var data_peralatan = JSON.parse($('#data-peralatan').val());
                var finded = false;

                $.each(data_peralatan, function(index, item){
                  if(item.kode_alat == $('#kode_alat').val()){
                    $('#alat').val(item.alat)
                    $('#lokasi').val(item.lokasi)
                    finded = true;
                  }
                })

                if(!finded){
                  $('#alat').val('');
                  $('#lokasi').val('');
                }
              });
             });

        </script>

@stop
@section('css')

@stop
@extends('layouts.app')

@section('content')
<textarea id="data-peralatan" style="display:none;">{{ json_encode($bukus) }}</textarea>
<form method="POST" action="{{ route('transaksi.store') }}" id="submit-form" enctype="multipart/form-data">
    {{ csrf_field() }}
<div class="row">
            <div class="col-md-12 d-flex align-items-stretch grid-margin">
              <div class="row flex-grow">
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Tambah Transaksi baru</h4>
                        <div class="form-group{{ $errors->has('kode_transaksi') ? ' has-error' : '' }}">
                            <label for="kode_transaksi" class="col-md-4 control-label">Kode Transaksi</label>
                            <div class="col-md-6">
                                <input id="kode_transaksi" type="text" class="form-control" name="kode_transaksi" value="{{ $kode }}" required readonly="">
                                @if ($errors->has('kode_transaksi'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('kode_transaksi') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                         <div class="form-group{{ $errors->has('tgl_pinjam') ? ' has-error' : '' }}">
                            <label for="tgl_pinjam" class="col-md-4 control-label">Tanggal Pinjam</label>
                            <div class="col-md-3">
                                <input id="tgl_pinjam" type="date" class="form-control" name="tgl_pinjam" value="{{ date('Y-m-d', strtotime(Carbon\Carbon::today()->toDateString())) }}" required @if(Auth::user()->level == 'user') readonly @endif>
                                @if ($errors->has('tgl_pinjam'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('tgl_pinjam') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                         <div class="form-group{{ $errors->has('tgl_kembali') ? ' has-error' : '' }}">
                            <label for="tgl_kembali" class="col-md-4 control-label">Tanggal Kembali</label>
                            <div class="col-md-3">
                                <input id="tgl_kembali" type="date"  class="form-control" name="tgl_kembali" value="{{ date('Y-m-d', strtotime(Carbon\Carbon::today()->addDays(5)->toDateString())) }}" required="" @if(Auth::user()->level == 'user') readonly @endif>
                                @if ($errors->has('tgl_kembali'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('tgl_kembali') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('kode_alat') ? ' has-error' : '' }}">
                            <label for="kode_alat" class="col-md-4 control-label">Nama Alat</label>
                            <div class="col-md-6">
                                <div class="input-group">
                                <input id="kode_alat" type="input" name="kode_alat" value="{{ old('kode_alat') }}" required autofocus>
                                <div>
                                <input id="alat" type="input" name="alat" value="{{ old('alat') }}" class="form-control" enable>
                                </div>
                                <input id="lokasi" type="input" name="lokasi" value="{{ old('lokasi') }}" class="form-control" required >
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-info btn-secondary" data-toggle="modal" data-target="#myModal"><b>Cari Alat</b> <span class="fa fa-search"></span></button>
                                </span>
                                </div>
                                @if ($errors->has('kode_alat'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('kode_alat') }}</strong>
                                    </span>
                                @endif
                                 
                            </div>
                        </div>
                        
                        @if(Auth::user()->level == 'admin')
                        <div class="form-group{{ $errors->has('anggota_nama') ? ' has-error' : '' }}">
                            <label for="anggota_nama" class="col-md-4 control-label">Anggota</label>
                            <div class="col-md-6">
                                <div class="input-group">
                                <input id="anggota_nama" type="text" name="anggota_nama" value="{{ old('anggota_nama') }}" class="form-control" readonly="" >
                                <input id="anggota_id" type="hidden" name="anggota_id" value="{{ old('anggota_id') }}" readonly="">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-warning btn-secondary" data-toggle="modal" data-target="#myModal2"><b>Cari Anggota</b> <span class="fa fa-search"></span></button>
                                </span>
                                </div>
                                @if ($errors->has('anggota_nama'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('anggota_nama') }}</strong>
                                    </span>
                                @endif
                                 
                            </div>
                        </div>
                        @else
                        <div class="form-group{{ $errors->has('anggota_nama') ? ' has-error' : '' }}">
                            <label for="anggota_nama" class="col-md-4 control-label">Anggota</label>
                            <div class="col-md-6">
                                <input id="anggota_nama" type="text" class="form-control" readonly="" value="{{Auth::user()->anggota->nama}}" required>
                                <input id="anggota_nama" type="hidden" name="anggota_nama" value="{{ Auth::user()->anggota->nama }}" required readonly="">
                              
                                @if ($errors->has('anggota_nama'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('anggota_nama') }}</strong>
                                    </span>
                                @endif
                                 
                            </div>
                        </div>
                        @endif

                        <div class="form-group{{ $errors->has('ket') ? ' has-error' : '' }}">
                            <label for="ket" class="col-md-4 control-label">Keterangan</label>
                            <div class="col-md-6">
                                <input id="ket" type="text" class="form-control" name="ket" value="{{ old('ket') }}" required>
                                @if ($errors->has('ket'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('ket') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary" id="submit">
                                    Submit
                        </button>
                        <button type="reset" class="btn btn-danger">
                                    Reset
                        </button>
                        <a href="{{route('transaksi.index')}}" class="btn btn-light pull-right">Back</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

</div>
</form>


  <!-- Modal -->
        <div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document" >
    <div class="modal-content" style="background: #fff;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cari Alat</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                        <table id="lookup" class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>Alat</th>
                                    <th>Kode Alat</th>
                                    <th>Merek</th>
                                    <th>Tahun Beli</th>
                                    <th>Lokasi Barang</th>
                                    <th>Stok</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($bukus as $data)
                                <tr class="pilih" data-kode_alat="<?php echo $data->kode_alat; ?>" data-alat="<?php echo $data->alat; ?>" data-lokasi="<?php echo $data->lokasi; ?>" >
                                    <td>{{$data->alat}}</td>
                                    <td>{{$data->kode_alat}}</td>
                                    <td>{{$data->merek}}</td>
                                    <td>{{$data->tahun_beli}}</td>
                                    <td>{{$data->lokasi}}</td>
                                    <td>{{$data->jumlah_alat}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>  
                    </div>
                </div>
            </div>
        </div>


  <!-- Modal -->
        <div class="modal fade bd-example-modal-lg" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document" >
    <div class="modal-content" style="background: #fff;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cari Anggota</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                        <table id="lookup" class="table table-bordered table-hover table-striped">
                            <thead>
                        <tr>
                          <th>
                            Nama
                          </th>
                          <th>
                            No Card
                          </th>
                          <th>
                            Jabatan
                          </th>
                          <th>
                            Jenis Kelamin
                          </th>
                        </tr>
                      </thead>
                            <tbody>
                                @foreach($anggotas as $data)
                                <tr class="pilih_anggota" data-anggota_id="<?php echo $data->id; ?>" data-anggota_nama="<?php echo $data->nama; ?>" >
                                    <td class="py-1">
                          @if($data->user->gambar)
                            <img src="{{url('images/user', $data->user->gambar)}}" alt="image" style="margin-right: 10px;" />
                          @else
                            <img src="{{url('images/user/default.png')}}" alt="image" style="margin-right: 10px;" />
                          @endif

                            {{$data->nama}}
                          </td>
                          <td>
                            {{$data->no_card}}
                          </td>

                          <td>
                          @if($data->jabatan == 'PM')
                            Programmer
                          @elseif($data->jabatan == 'SC')
                            Security
                          @else
                            Karyawan
                          @endif
                          </td>
                          <td>
                            {{$data->jk === "L" ? "Laki - Laki" : "Perempuan"}}
                          </td>
                        </tr>
                                @endforeach
                            </tbody>
                        </table>  
                    </div>
                </div>
            </div>
        </div>
@endsection