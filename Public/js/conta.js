function toggleVisibility() {
    let elementos = document.querySelectorAll(""); // Seleciona todos os elementos com a classe .bg-img
    elementos.forEach((elemento) => {
        if (window.matchMedia("(max-width: 800px)").matches) {
            elemento.style.display = "none";
        } else {
            elemento.style.display = "block"; // Volta a exibir quando for maior que 800px
        }
    });
}

// Executa quando a tela é redimensionada
window.addEventListener("resize", toggleVisibility);

// Executa quando a página carrega
toggleVisibility();

