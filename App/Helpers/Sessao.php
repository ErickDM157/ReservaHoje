<?php

class Sessao {

    public static function mensagem($nome, $texto = null, $classe = null) {
        if (!empty($nome)) :
            if (!empty($texto) && empty($_SESSION[$nome])) :
                $_SESSION[$nome] = $texto;
                $_SESSION[$nome . 'classe'] = $classe;

            elseif (!empty($_SESSION[$nome]) && empty($texto)) :
                $classe = !empty($_SESSION[$nome . 'classe']) ? $_SESSION[$nome . 'classe'] : 'alert alert-success';
                echo '<div class="' . $classe . '">' . $_SESSION[$nome] . '</div>';
                unset($_SESSION[$nome]);
                unset($_SESSION[$nome . 'classe']);
            endif;
        endif;
    } // fim da função mensagem

    public static function estaLogado() {
        return isset($_SESSION['usuario_id']);
    } // fim da função estaLogado

} // fim da classe Sessao