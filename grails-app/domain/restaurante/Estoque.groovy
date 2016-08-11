package restaurante

class Estoque {

    Integer quantidade;
    Integer qtdMinima;
    Produto produto;

    static belongsTo = [Produto]

    static constraints = {
    }
}
