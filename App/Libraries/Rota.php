<?php
class Rota
{
    private string $controlador = "Paginas";
    private string $metodo = 'index';
    private array $parametros = [];

    public function __construct()
    {
        $url = $this->getUrl() ?? [0];

        if (file_exists('../app/Controllers/' . ucwords($url[0]) . '.php')) {
            $this->controlador = ucwords($url[0]);
            unset($url[0]);
        }

        require_once '../app/Controllers/' . $this->controlador . '.php';
        $this->controlador = new $this->controlador;

        if (isset($url[1])) {
            if (method_exists($this->controlador, $url[1])) {
                $this->metodo = $url[1];
                unset($url[1]);
            }
        }

        $this->parametros = $url ? array_values($url) : [];
        call_user_func_array([$this->controlador, $this->metodo], $this->parametros);
    }

    private function getUrl(): ?array
    {
        $url = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);

        if (isset($url)) {
            $url = trim(rtrim($url, '/'));
            return explode('/', $url);
        }

        return null;
    }
}
