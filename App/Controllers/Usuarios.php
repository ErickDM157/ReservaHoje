<?php

class Usuarios extends Controller
{
    private $usuarioModel;

    public function __construct()
    {
        $this->usuarioModel = $this->model('Usuario');
    }

    public function cadastrar()
    {
        $formulario = filter_input_array(INPUT_POST, FILTER_SANITIZE_SPECIAL_CHARS);

        if (isset($formulario)) :
            $dados = [
                'nome' => trim($formulario['nome']),
                'email' => trim($formulario['email']),
                'senha' => trim($formulario['senha']),
                'confirma_senha' => trim($formulario['confirma_senha']),
                'idade' => trim($formulario['idade']),
                'genero' => trim($formulario['genero']),
                'nome_erro' => '',
                'email_erro' => '',
                'senha_erro' => '',
                'confirma_senha_erro' => '',
                'idade_erro' => '',
                'genero_erro' => ''
            ];

            if (in_array("", $formulario)) :

                if (empty($formulario['nome'])) :
                    $dados['nome_erro'] = 'Preencha o campo nome';
                endif;

                if (empty($formulario['email'])) :
                    $dados['email_erro'] = 'Preencha o campo e-mail';
                endif;

                if (empty($formulario['senha'])) :
                    $dados['senha_erro'] = 'Preencha o campo senha';
                endif;

                if (empty($formulario['confirma_senha'])) :
                    $dados['confirma_senha_erro'] = 'Confirme a senha';
                endif;

                if (empty($formulario['idade'])) :
                    $dados['idade_erro'] = 'Informe sua idade';
                endif;

                if (empty($formulario['genero'])) :
                    $dados['genero_erro'] = 'Selecione o gênero';
                endif;

            else :
                if (Checa::checarNome($formulario['nome'])) :
                    $dados['nome_erro'] = 'O nome informado é inválido.';
                elseif (Checa::checarEmail($formulario['email'])) :
                    $dados['email_erro'] = 'O e-mail informado é inválido.';
                elseif (!filter_var($formulario['idade'], FILTER_VALIDATE_INT) || $formulario['idade'] <= 0) :
                    $dados['idade_erro'] = 'A idade deve ser um número positivo válido.';
                elseif (strlen($formulario['senha']) < 6) :
                    $dados['senha_erro'] = 'A senha deve ter no mínimo 6 caracteres.';
                elseif ($formulario['senha'] != $formulario['confirma_senha']) :
                    $dados['confirma_senha_erro'] = 'As senhas são diferentes.';
                else :
                    $dados['senha'] = password_hash($formulario['senha'], PASSWORD_DEFAULT);

                    if ($this->usuarioModel->armazenar($dados)) :
                        Sessao::mensagem('usuario', 'Cadastro realizado com sucesso');
                        Url::redirecionar('usuarios/logar');
                    else :
                        die("Erro ao armazenar o usuário no banco de dados");
                    endif;
                endif;
            endif;
        else :
            $dados = [
                'nome' => '',
                'email' => '',
                'senha' => '',
                'confirma_senha' => '',
                'idade' => '',
                'genero' => '',
                'nome_erro' => '',
                'email_erro' => '',
                'senha_erro' => '',
                'confirma_senha_erro' => '',
                'idade_erro' => '',
                'genero_erro' => ''
            ];
        endif;

        $this->view('usuarios/cadastrar', $dados);
    }
}
