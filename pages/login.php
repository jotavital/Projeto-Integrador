<?php
    session_start();
    include_once("../connections/conexao.php");
    $key = uniqid(md5(rand()));
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style/bulma.css">
    <link rel="stylesheet" href="/style/main.css">
    <title>Controle de Despesas - Login</title>
</head>
<body>
    <div id="container">
        <div class="divForm">
            <form action="#" method="" class="box" id="formulario">
                <?php 
                    // para teste de conexão ao banco
                    // if(isset($_SESSION['msg'])){
                    //     echo $_SESSION['msg'];
                    //     unset($_SESSION['msg']);
                    // }
                    // if(!$conn){
                    //     die("<div class='notification is-danger'>" . "Falha na conexão com a base de dados: " . mysqli_connect_error() . ", verifique o arquivo de conexão e tente novamente</div>");
                    // }else{
                    //     echo "<div class='notification is-success'>" . "Conexão ao banco de dados realizada com sucesso!" . "<button class='delete' aria-label='Close'></button></div>";
                    // }
                ?>
                <h1 class="title">Entrar</h1>
                <div class="field">
                    <label class="label" for="usuario">Nome de usuário:</label>
                    <div class="control">
                        <input class="input is-rounded" id="usuario" type="text" placeholder="Seu nome de usuário">
                    </div>
                </div>
                <div class="field">
                    <label class="label" for="senha">Senha:</label>
                    <div class="control">
                        <input class="input is-rounded" id="senha" type="password" placeholder="Sua senha">
                    </div>
                </div>
                <p>Ainda não é um usuário? <a href="register.php">Cadastre-se!</a></p>
                <div class="block">

                </div>
                <div class="buttons is-centered">
                    <button class="button is-success">
                        <span class="icon is-small">
                            <i class="fas fa-check-circle"></i>
                        </span>
                        <span>Entrar</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <?php 
        mysqli_close($conn);
    ?>
    <script src="https://kit.fontawesome.com/2ecaa7524c.js" crossorigin="anonymous"></script>
</body>

</html>