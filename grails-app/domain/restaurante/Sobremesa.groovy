package restaurante

class Sobremesa extends Produto{

    Integer calorias;

    static constraints = {
    }

    static mapping = {
        discriminator value: "SOBREMESA"
    }
}
