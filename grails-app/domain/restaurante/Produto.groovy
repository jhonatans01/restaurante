package restaurante

class Produto {

    String nome;
    Double preco;
    Estoque estoque;

    static hasMany = [clientes: Cliente]

    static belongsTo = [Cliente]

    static constraints = {
    }

    static mapping = {
        discriminator column: "tipo", value: "GERAL"
        produtosPreferidos joinTable:[name:"preferencias_clientes", key:"produto_id", collum:"cliente_id"]
    }
}
