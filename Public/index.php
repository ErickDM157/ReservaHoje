<!DOCTYPE html>
<html lang="pt-be">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HEADER</title>
    <meta name="description"
        content="Reserve sua estadia com facilidade e segurança em nosso site. Encontre os melhores hotéis, resorts e acomodações, com opções para todos os gostos e orçamentos. Faça sua reserva agora e garanta a melhor experiência para sua viagem." />
    <link rel="icon" href="/Public/logo.svg" type="image/svg+xml" />

    <link rel="preload" href=".//css/style.css" as="style" />
    <link rel="stylesheet" href="./css/style.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Roboto:ital,wght@0,400;0,500;1,400;1,500&display=swap"
        rel="stylesheet">

</head>
<body>
    <header class="header-bg">
        <div class="header container">
            <div class="navbar">
                <div class="logo">
                    <a href=""><img src=".//logo.svg" alt="logo"></a>
                </div>
                <div class="menu-aberto">
                    <span></span>
                    <span id="header-span"></span>
                    <span></span>
                </div>
            </div>
            <!--Usado para abrir o menu com (oppened)-->
            <nav class="font-2-p cor-0">
                <a href=""><img src="./img/icones/header/notificacao.svg" alt="Ícone de Notificações">Notificações</a>
                <a class="botao" href="./Views/cadastro.php">Cadastre-se</a>
                <a class="botao" href="./Views/login.php">Login</a>
            </nav>
        </div>
    </header>


    <main class="start-bg">
        <div class="start container">
            <h1 class="title font-1-tt-bold">Encontre o Destino Perfeito no Brasil!</h1>
            <p class="subtitle font-1-st">Preencha para uma experencia personalizada e única </p>
            <div class="buscar">
                <button class="buscar-botao">
                    <img src="./img/icones/localizacao.svg" alt="ícone de localização">
                    <div class="botao-box">
                        <span class="texto-principal font-2-p-bold">Para onde você vai?</span>
                        <span class="texto-conteudo font-2-t">São Paulo</span>
                    </div>
                </button>
                <button class="buscar-botao">
                    <img src="./img/icones/localizacao.svg" alt="">
                    <div class="botao-box">
                        <span class="texto-principal font-2-p-bold">Datas</span>
                        <span class="texto-conteudo font-2-t">01 de jan. - 07 de jan.</span>
                    </div>
                </button>
                <button class="buscar-botao">
                    <img src="./img/icones/localizacao.svg" alt="">
                    <div class="botao-box">
                        <span class="texto-principal font-2-p-bold">viajantes</span>
                        <span class="texto-conteudo font-2-t">2 viajantes, 1 quarto</span>
                    </div>
                </button>
                <a href="" class="botao font-2-t">Buscar</a>
            </div>
        </div>
        
    </main>
    <script src="./js/header.js"></script>
</body>