<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <meta name="description"
        content="Reserve sua estadia com facilidade e segurança em nosso site. Encontre os melhores hotéis, resorts e acomodações, com opções para todos os gostos e orçamentos. Faça sua reserva agora e garanta a melhor experiência para sua viagem." />
    <link rel="icon" href="/Public/logo.svg" type="image/svg+xml" />

    <link rel="preload" href=".//css/style.css" as="style" />
    <link rel="stylesheet" href="../css/style.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Roboto:ital,wght@0,400;0,500;1,400;1,500&display=swap"
        rel="stylesheet">

</head>

<body>
    <main class="formulario-wrapper">
        <form class="formulario cadastro">
            <h2 class="font-1-tt-bold">Cadastro</h2>
            <div class="campo-wrapper">
                <div class="input-box">
                    <input type="text" name="name" placeholder="Insira seu nome" />
                    <p class="alert">Nome inválido</p>
                </div>
                <div class="input-box">
                    <input type="email" name="email" placeholder="Insira seu email" />
                    <p class="alert">Email incorreto ou não cadastrado.</p>
                </div>

                <div class="input-box">
                    <input type="number" name="telefone" placeholder="Telefone" />
                    <p class="alert">Telefone inválido</p>
                </div>

                <div class="input-box">
                    <input type="password" name="senha" placeholder="Insira sua senha" />
                    <p class="alert"></p>
                </div>

                <div class="input-box">
                    <input type="password" name="confirmar_senha" placeholder="Confirme sua senha" />
                    <p class="alert">As senhas não coincidem</p>
                </div>
                <br>
                <div class="input-box">
                    <input type="number" name="idade" placeholder="Insira sua idade" />
                    <p class="alert">Informe uma idade válida</p>
                </div>
                <div class="input-box">
                    <select name="genero">
                        <option value="" disabled selected>Sexo</option>
                        <option value="male">Masculino</option>
                        <option value="female">Feminino</option>
                    </select>
                </div>
                <button type="submit">Cadastrar</button>
            </div>
            <p>ou</p>
            <a href="/">Google</a>
        </form>
        <div class="form-coluna">
            <div class="text-box">
                <h2 class="text1 font-1-tt-bold">Já tem uma conta?</h2>
                <p class="text2 font-2-t">Faça login para gerenciar suas reservas e garantir sua próxima estadia com facilidade.</p>
                <a href="./login.html" class="botao font-2-t">Faça o Login</a>
            </div>
        </div>
    </main>    
</body>

</html>