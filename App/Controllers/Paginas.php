<?php
class Paginas extends Controller{
    public function index(){
      if(Sessao::estaLogado()):
        Url::redirecionar('posts');
      endif;
      $dados = ['titulo'=>'Pagina Inicial',
                 'descricao'=> 'Site Reservas'
               ];
        $this->view('pagina/home', $dados);
    }
    public function sobre(){
      $dados = ['titulo'=>'Sobre nós...',
                'descricao'=>'Esta aula é sobre PHP 
                 orientado a objetos com MVC'];
     $this->view('pagina/sobre', $dados);
    }

}//fim da classe Paginas

?>