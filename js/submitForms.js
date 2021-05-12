$(document).ready(function () {
    $('#formAddContas').submit(function () {
        var x = $('#saldoInput').val();
        x = x.replace(/[.]/gim, "");
        x = x.replace(/[,]/gim, ".");
        document.getElementById('saldoInput').value = x;
        var dados = jQuery(this).serialize();

        $.ajax({
            url: '../connections/inserts/insertConta.php',
            method: 'POST',
            data: dados,
            success: function (msg) {
                window.location.href = "../pages/contas.php";
            },
            error: function (msg) {
                alert("Erro ao cadastrar a conta!");
            }
        });

        return false;
    });

    $('#formAddDespesas').submit(function () {
        var x = $('#valorInput').val();
        x = x.replace(/[.]/gim, "");
        x = x.replace(/[,]/gim, ".");
        document.getElementById('valorInput').value = x;
        var dados = new FormData(this);

        $.ajax({
            url: '../connections/inserts/insertDespesa.php',
            method: 'POST',
            data: dados,
            processData: false,
            contentType: false,
            complete: function (msg) {
                window.location.href = "../pages/despesas.php";
            },
            error: function (msg) {
                alert("Erro ao cadastrar a despesa!");
            }
        });
        
        return false;
    });
    
    $('#formAddCategoriaDespesa').submit(function (e) {
        e.preventDefault();
        var dados = new FormData(this);

        $.ajax({
            url: '../connections/inserts/insertCategoriaDespesa.php',
            method: 'POST',
            data: dados,
            processData: false,
            contentType: false,
            complete: function (msg) {
                window.location.href = "../pages/despesas.php";
            },
            error: function (msg) {
                alert("Erro ao cadastrar a categoria!");
            }
        });
        
        return false;
    });
});