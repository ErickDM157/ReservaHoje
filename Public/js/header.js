// quando ocorrer um evento de click na classe, atribuo o nav a uma variavel e adiciono ou tiro a classe opened com toggle
document.querySelector('.menu-aberto').addEventListener('click', () => {
    let header_nav = document.querySelector('.header nav');
    let header_span = document.getElementById('header-span');
    
    header_nav.classList.toggle('aberto');

    // exibição do span
    if (header_span.style.display === 'none') {
        header_span.style.display = 'block'; // Mostrar
    } else {
        header_span.style.display = 'none'; // Esconder
    }
});
