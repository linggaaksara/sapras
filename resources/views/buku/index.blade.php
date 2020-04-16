@section('js')
<script type="text/javascript">
  $(document).ready(function() {
    $('#table').DataTable({
      "iDisplayLength": 50
    });

} );
</script>
@stop
@extends('layouts.app')

@section('content')
<div class="row">

  <div class="col-lg-2">
    <a href="{{ route('buku.create') }}" class="btn btn-primary btn-rounded btn-fw"><i class="fa fa-plus"></i> Tambah Alat</a>
  </div>
  <div class="col-lg-1">
    <a href="{{url('laporan/buku')}}" class="btn btn-primary btn-rounded btn-fw"><i class="fa fa-print" style="position: right"></i> Laporan Alat</a>
  </div>
  <div class="col-lg-1"></div>
  <div class="col-lg-3">
    <a href="{{url('laporan/trs')}}" class="btn btn-primary btn-rounded btn-fw"><i class="fa fa-print" style="position: right"></i> Laporan Transaksi</a>
  </div>
    <div class="col-lg-12">
                  @if (Session::has('message'))
                  <div class="alert alert-{{ Session::get('message_type') }}" id="waktu2" style="margin-top:10px;">{{ Session::get('message') }}</div>
                  @endif
                  </div>
</div>
<div class="row" style="margin-top: 20px;">
<div class="col-lg-12 grid-margin stretch-card">
              <div class="card">

                <div class="card-body">
                  <h4 class="card-title pull-left" style="font-size: 20px;">Data Alat</h4>
                  <a href="{{url('format_buku')}}" class="btn btn-xs btn-info pull-right">Format Alat</a>
                  <div class="table-responsive">
                    <table class="table table-striped" id="table">
                      <thead>
                        <tr>
                          <th>
                            Nama Alat
                          </th>
                          <th>
                            Kode Alat
                          </th>
                          <th>
                            Merek
                          </th>
                          <th>
                            Tahun Beli
                          </th>
                          <th>
                            Stok
                          </th>
                          <th>
                            Baris
                          </th>
                          <th>
                            Action
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                      @foreach($datas as $data)
                        <tr>
                          <td class="py-1">
                          @if($data->cover)
                            <img src="{{url('images/buku/'. $data->cover)}}" alt="image" style="margin-right: 10px;" />
                          @else
                            <img src="{{url('images/buku/default.png')}}" alt="image" style="margin-right: 10px;" />
                          @endif
                          <a href="{{route('buku.show', $data->id)}}"> 
                            {{$data->alat}}
                          </a>
                          </td>
                          <td>
                          
                            {{$data->kode_alat}}
                          
                          </td>

                          <td>
                            {{$data->merek}}
                          </td>
                          <td>
                            {{$data->tahun_beli}}
                          </td>
                          <td>
                            {{$data->jumlah_alat}}
                          </td>
                          <td>
                            {{$data->lokasi}}
                          </td>
                          <td>
                          <div class="btn-group dropdown">
                          <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Action
                          </button>
                          <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 30px, 0px);">
                            <a class="dropdown-item" href="{{route('buku.edit', $data->id)}}"> Edit </a>
                            <form action="{{ route('buku.destroy', $data->id) }}" class="pull-left"  method="post">
                            {{ csrf_field() }}
                            {{ method_field('delete') }}
                            <button class="dropdown-item" onclick="return confirm('Anda yakin ingin menghapus data ini?')"> Delete
                            </button>
                          </form>
                           
                          </div>
                        </div>
                          </td>
                        </tr>
                      @endforeach
                      </tbody>
                    </table>
                  </div>
               {{--  {!! $datas->links() !!} --}}
                </div>
              </div>
            </div>
          </div>
@endsection