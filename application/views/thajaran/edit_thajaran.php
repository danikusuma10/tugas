<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 mx-auto">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Edit <?= $title; ?></h1>
                        </div>
                        <?php foreach ($tahun_masuk as $t) { ?>
                            <form class="user" method="post" action="<?= base_url('th_ajaran/update'); ?>" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="hidden" name="id_tahun" value="<?php echo $t->id_tahun ?>">
                                    <input type="text" readonly class="form-control form-control-user" id="tahun_masuk" name="tahun_masuk" value="<?php echo $t->tahun_masuk ?>">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="besar_spp" name="besar_spp" value="<?php echo $t->besar_spp ?>">
                                </div>

                                <hr>
                                <input type="submit" name="update" value="EDIT DATA" class="btn btn-success btn-user btn-block">

                            </form>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->