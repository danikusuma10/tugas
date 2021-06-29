<!-- Begin Page Content -->
<div class="container-fluid">


    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">


        <div class="card-body">
            <?php if ($_SESSION["role_id"] == "1") { ?>
                <a class="btn btn-primary mb-3" href="<?= base_url('th_aktif'); ?>">Add Tahun Aktif</a>
                <a class="btn btn-success mb-3" href="<?= base_url('th_ajaran'); ?>">Add Tahun Ajaran</a>
            <?php } ?>
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>ID Bayar</th>
                            <th>Nama Siswa</th>
                            <th>AKSI</th>
                        </tr>
                    </thead>

                    <tbody>

                        <?php
                        $id = 1;
                        foreach ($siswa as $u) {
                        ?>
                            <tr>
                                <td><?php echo $id++ ?></td>
                                <td><?php echo $u->id_bayar ?></td>
                                <td><?php echo $u->nama_siswa ?></td>
                                <td>

                                    <?php echo anchor('transaksi1/detail/' . $u->id_bayar, '<input type=reset class="btn btn-info" value=\'Detail\'>'); ?>

                                </td>
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