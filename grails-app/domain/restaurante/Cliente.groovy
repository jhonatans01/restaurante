package restaurante

class Cliente {

    String nome;
    String email;
    String senha;
    String classeSocial;

    static hasMany = [produtosPreferidos: Produto]

    static constraints = {
    }

    static mapping = {
        produtosPreferidos joinTable:[name:"preferencias_clientes", key:"cliente_id", collum:"produto_id"]
    }
}
