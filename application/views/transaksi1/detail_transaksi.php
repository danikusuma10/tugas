<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <?php foreach ($siswa as $u) { ?>
                <div class="row">
                    <div class="col">
                        <h6 class="m-0 font-weight-bold text-primary">Transaksi Pembayaran SPP</h6>
                    </div>
                    <!-- <div class="col text-right">
                        <h6 class="m-0 font-weight-bold text-primary">Tunggakan :
                            <?php
                            foreach ($this->db->query('SELECT SUM(tunggakan) as besar_tunggakan FROM tunggakan WHERE id_bayar=' . $u->id_bayar . '')->result() as $tung); {
                                echo  "Rp. " . number_format($tung->besar_tunggakan, 0, ',', '.');
                            } ?>
                        </h6>
                    </div> -->
                </div>
        </div>

        <div class="card-body">

            <form class="form-inline" method="post" action="<?= base_url('transaksi1/tambah_aksi'); ?>" enctype="multipart/form-data">

                <input name="id" class="form-control" type="text" value="<?= $user['id']; ?>" hidden>
                <input name="id_bayar" class="form-control" type="text" value="<?php echo $u->id_bayar ?>" hidden>



                <input name="id_transaksi" class="form-control" type="text" value="<?php echo $id_transaksi; ?>" hidden>

                <input name="tgl_bayar" class="form-control" type="text" value="<?php echo $tgl_bayar; ?>" hidden>

                <div class="form-group col-4">
                    <label">Bayar Bulan</label>
                        <select name="bulan" class="form-control" style="margin-left: 10px;">
                            <?php
                            foreach ($this->m_transaksi->tampil_databulan()->result() as $bulan) {
                            ?>
                                <option value="<?php echo $bulan->id_bulan ?>"> <?php echo $bulan->bulan ?> </option>
                            <?php } ?>
                        </select>
                </div>

                <div class="form-group col-6">
                    <label>Tahun Ajaran</label>
                    <select name="tahun_masuk" id="tahun_masuk" class="form-control" style="margin-left: 10px;">
                        <?php
                        foreach ($this->db->query('SELECT tahun_masuk.id_tahun, tahun_masuk.tahun_masuk, tahun_masuk.besar_spp FROM tahun_masuk JOIN tahun_aktif ON tahun_masuk.id_tahun=tahun_aktif.id_tahun WHERE id_bayar=\'' . $u->id_bayar . '\'')->result() as $tahun) { /*$this->m_transaksi->tampil_datatahun()->result() */
                        ?>
                            <option value="<?php echo $tahun->id_tahun ?>"> <?php echo $tahun->tahun_masuk . ' | Rp. ' . number_format($tahun->besar_spp, 0, ',', '.'); ?> </option>

                        <?php } ?>
                    </select>
                </div>

            <?php } ?>
            <?php if ($_SESSION["role_id"] == "1") { ?>


                <div class="form-group col-2">
                    <a class="btn btn-secondary mb-3" href="<?= base_url('transaksi1'); ?>">KEMBALI</a>
                    <input type="submit" name="bayar" value="BAYAR" class="btn btn-primary mb-3">
                </div>
            <?php } ?>

            </form>

            <div class="container">


            </div>

            <div class="table-responsive" style="margin-top: 30px">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>ID Transaksi</th>
                            <th>Bulan</th>
                            <th>Tahun Ajaran</th>
                            <th>Tanggal Bayar</th>
                            <th>Besar SPP</th>
                            <th>Admin</th>
                            <th>AKSI</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php
                        $id = 1;
                        foreach ($trans as $u) {
                        ?>
                            <tr>
                                <td><?php echo $id++ ?></td>
                                <td><?php echo $u->id_transaksi ?></td>
                                <?php
                                if ($u->id_bulan <= 07) {
                                    $tahun = substr($u->tahun_masuk, 0, 4);
                                } else {
                                    $tahun = substr($u->tahun_masuk, 5);
                                }
                                ?>
                                <td><?php echo $u->bulan . ' ' . $tahun ?></td>
                                <td><?php echo $u->tahun_masuk ?></td>
                                <td><?php echo date('d-m-Y', strtotime($u->tanggal_bayar)); ?></td>
                                <td><?php echo 'Rp. ' . number_format($u->besar_spp, 0, ',', '.'); ?></td>
                                <td><?php echo $u->name ?></td>
                                <?php if ($u->id == $user['id']) { ?>

                                    <td>
                                        <?php echo anchor('transaksi1/hapus/' . $u->id_transaksi . '/' . $u->id_bayar . '/' . $u->id_tahun, '<input type=reset class="btn btn-danger" value=\'Hapus\'>'); ?> <br>

                                    </td>
                                <?php } else { ?>
                                    <td>

                                    </td>
                                <?php } ?>
                            </tr>
                        <?php } ?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->