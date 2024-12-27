<?php
class Database{
    private string $host = "localhost";
    private string $usuario = "root";
    private string $senha = "";
    private string $banco = "blogaula";
    private string $porta = "3306"; // Verificar a porta do seu banco
    private PDO $dbh;
    private PDOStatement $stmt;

    public function __construct(){
        // Fonte de dados ou DNS que contém as informações para conectar ao banco de dados.
        $dns = 'mysql:host=' . $this->host . ';port=' . $this->porta . ';dbname=' . $this->banco;

        $opcoes = [
            // Armazenar em cache a conexão para ser reutilizada, evitando sobrecarga de uma nova conexão.
            PDO::ATTR_PERSISTENT => true,
            // Lança um PDOException se ocorrer um erro
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ];

        try {
            // Cria a instância do PDO
            $this->dbh = new PDO($dns, $this->usuario, $this->senha, $opcoes);
        } catch (PDOException $error) {
            echo "Erro: " . $error->getMessage() . "<br/>";
            die();
        }
    }

    // Prepara o statement com query
    public function query(string $sql): void {
        // Prepara a consulta SQL
        $this->stmt = $this->dbh->prepare($sql);
    }

    // Vincula um valor a um parâmetro
    public function bind(string $parametro, mixed $valor, ?int $tipo = null): void {
        if (is_null($tipo)) {
            switch (true) {
                case is_int($valor):
                    $tipo = PDO::PARAM_INT;
                    break;
                case is_bool($valor):
                    $tipo = PDO::PARAM_BOOL;
                    break;
                case is_null($valor):
                    $tipo = PDO::PARAM_NULL;
                    break;
                default:
                    $tipo = PDO::PARAM_STR;
            }
        }
        $this->stmt->bindValue($parametro, $valor, $tipo);
    }

    // Executa o prepared statement
    public function executa(): bool {
        return $this->stmt->execute();
    }

    // Obtém um único registro
    public function resultado(): object|false {
        $this->executa();
        return $this->stmt->fetch(PDO::FETCH_OBJ);
    }

    // Obtém um conjunto de registros
    public function resultados(): array {
        $this->executa();
        return $this->stmt->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna o número de linhas afetadas pela última instrução SQL
    public function totalResultados(): int {
        return $this->stmt->rowCount();
    }

    // Retorna o último ID inserido no banco de dados
    public function ultimoIdInserido(): string {
        return $this->dbh->lastInsertId();
    }
}
