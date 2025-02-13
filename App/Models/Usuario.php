<?php

class Usuario{
    private $db;

    public function __construct(){
        $this->db = new Database();
    }  //fim do construtor
    public function armazenar($dados){
        $this->db->query("INSERT INTO cliente(clie_id, clie_nome, clie_email, clie_senha, clie_idade, clie_sexo, tele_id) VALUES (:nome, :email, :senha, :idade, :genero, :telefone  )");

        $this->db->bind('clie_nome', $dados['nome']);
        $this->db->bind('clie_email', $dados['email']);
        $this->db->bind('clie_senha', $dados['senha']);
        $this->db->bind('clie_idade', $dados['idade']);
        $this->db->bind('clie_genero', $dados['genero']);
        $this->db->bind('tele_id', $dados['telefone']);
        if($this->db->executa()):
            return true;
        else:
            return false;
        endif;
    }//fim da funcão armazenar
    public function checarEmail($email){
        $this->db->query("SELECT email FROM usuarios WHERE email = :e");
        $this->db->bind(":e", $email);
        if($this->db->resultado()):
            return true;
        else:
            return false;
        endif;

    }//fim da função checarEmail
    public function checarLogin($email, $senha){
        $this->db->query("SELECT * FROM usuarios WHERE email = :e");
        $this->db->bind(":e", $email);
       if($this->db->resultado()):
            $resultado = $this->db->resultado();
            if(password_verify($senha, $resultado->senha)):
                return $resultado;
            else:
                return false;
            endif;
        else:
            return false;
        endif;

    }
}//fim da classe Usuario