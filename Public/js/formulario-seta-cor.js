window.addEventListener("resize", function () {
    let seta = document.querySelector(".cadastro-login-voltar img");
    if (window.innerWidth <= 750) {
        seta.src = "../img/icones/cadastro-login/seta.svg";
    } else {
        seta.src = "../img/icones/cadastro-login/seta-white.svg";
    }
});

// Garante que o ícone correto seja carregado ao iniciar a página
window.dispatchEvent(new Event("resize"));
