package restaurante

class Bebida extends Produto{

    Double liquido;
    String unidade;

    static constraints = {
        liquido inList: ["250mL", "350mL", "500mL", "1L"]
    }

    static mapping = {
        discriminator value: "BEBIDA"
    }
}
