<?php

class Url {
    public static function redirecionar($url) {
        header("Location:" . URL . DIRECTORY_SEPARATOR . $url);
        exit; // Adicionado para garantir que o script seja interrompido após o redirecionamento
    } // fim da função URL
}
