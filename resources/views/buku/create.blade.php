@section('js')

<script type="text/javascript">

$(document).ready(function() {
    $(".users").select2();
});

</script>

<script type="text/javascript">
        function readURL() {
            var input = this;
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $(input).prev().attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $(function () {
            $(".uploads").change(readURL)
            $("#f").submit(function(){
                // do ajax submit or just classic form submit
              //  alert("fake subminting")
                return false
            })
        })
        </script>
@stop

@extends('layouts.app')

@section('content')

<form method="POST" action="{{ route('buku.store') }}" enctype="multipart/form-data">
    {{ csrf_field() }}
<div class="row">
            <div class="col-md-12 d-flex align-items-stretch grid-margin">
              <div class="row flex-grow">
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Tambah Alat baru</h4>
                      
                        <div class="form-group{{ $errors->has('alat') ? ' has-error' : '' }}">
                            <label for="alat" class="col-md-4 control-label">Alat</label>
                            <div class="col-md-6">
                                <input id="alat" type="text" class="form-control" name="alat" value="{{ old('alat') }}" required>
                                @if ($errors->has('alat'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('alat') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('kode_alat') ? ' has-error' : '' }}">
                            <label for="kode_alat" class="col-md-4 control-label">Kode Alat</label>
                            <div class="col-md-6">
                                <input id="kode_alat" type="text" class="form-control" name="kode_alat" value="{{ old('kode_alat') }}" required>
                                @if ($errors->has('kode_alat'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('kode_alat') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('merek') ? ' has-error' : '' }}">
                            <label for="merek" class="col-md-4 control-label">Merek</label>
                            <div class="col-md-6">
                                <input id="merek" type="text" class="form-control" name="merek" value="{{ old('merek') }}" required>
                                @if ($errors->has('merek'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('merek') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('jenis_alat') ? ' has-error' : '' }}">
                            <label for="jenis_alat" class="col-md-4 control-label">Jenis Alat</label>
                            <div class="col-md-6">
                                <input id="jenis_alat" type="text" class="form-control" name="jenis_alat" value="{{ old('jenis_alat') }}" required>
                                @if ($errors->has('jenis_alat'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('jenis_alat') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('tahun_beli') ? ' has-error' : '' }}">
                            <label for="tahun_beli" class="col-md-4 control-label">Tahun Beli</label>
                            <div class="col-md-6">
                                <input id="tahun_beli" type="number" maxlength="4" class="form-control" name="tahun_beli" value="{{ old('tahun_beli') }}" required>
                                @if ($errors->has('tahun_beli'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('tahun_beli') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('jumlah_alat') ? ' has-error' : '' }}">
                            <label for="jumlah_alat" class="col-md-4 control-label">Jumlah Alat</label>
                            <div class="col-md-6">
                                <input id="jumlah_alat" type="number" maxlength="4" class="form-control" name="jumlah_alat" value="{{ old('jumlah_alat') }}" required>
                                @if ($errors->has('jumlah_alat'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('jumlah_alat') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('deskripsi') ? ' has-error' : '' }}">
                            <label for="deskripsi" class="col-md-4 control-label">Deskripsi</label>
                            <div class="col-md-12">
                                <input id="deskripsi" type="text" class="form-control" name="deskripsi" value="{{ old('deskripsi') }}" >
                                @if ($errors->has('deskripsi'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('deskripsi') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('lokasi') ? ' has-error' : '' }}">
                            <label for="lokasi" class="col-md-4 control-label">Lokasi</label>
                            <div class="col-md-6">
                            <select class="form-control" name="lokasi" required="">
                                <option value=""></option>
                                <option value="baris1">Baris 1</option>
                                <option value="baris2">Baris 2</option>
                                <option value="baris3">Baris 3</option>
                            </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-4 control-label">Cover</label>
                            <div class="col-md-6">
                                <img width="200" height="200" />
                                <input type="file" class="uploads form-control" style="margin-top: 20px;" name="cover">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary" id="submit">
                                    Submit
                        </button>
                        <button type="reset" class="btn btn-danger">
                                    Reset
                        </button>
                        <a href="{{route('buku.index')}}" class="btn btn-light pull-right">Back</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

</div>
</form>
@endsection