<?php

class Checa {
    public static function checarNome($nome) {
        if (!preg_match('/^([\u00C0-\u017Fa-zA-Z]+)+(\s[\u00C0-\u017Fa-zA-Z]+)*$/', $nome)) :
            return true;
        else :
            return false;
        endif;
    } // fim da função checarNome

    public static function checarEmail($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) :
            return true;
        else :
            return false;
        endif;
    } // fim da função checarEmail

    public static function dataBr($data) {
        if (isset($data)) :
            return date('d/m/Y H:i', strtotime($data));
        else :
            return false;
        endif;
    }
} // fim da classe Checa