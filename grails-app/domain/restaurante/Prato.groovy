package restaurante

class Prato extends Produto{

    Integer qtdPessoas;

    static constraints = {
    }

    static mapping = {
        discriminator value: "PRATO"
    }
}
