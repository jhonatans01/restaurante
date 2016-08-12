package restaurante
class ProdutoController {

    def index() {

        def lista = Produto.list()

        render(view: "/produto/index", model: [produtos:lista])
    }

    def adicionar() {
        Produto novoProduto = new Produto()
        novoProduto.preco = 0
        novoProduto.estoque = new Estoque()
        novoProduto.estoque.quantidade = 0
        novoProduto.estoque.qtdMinima = 0
        render(template: "/produto/form", model: [produto:novoProduto])
    }
    def salvar() {
        Produto produto = null
        if (params.id){
            produto = Produto.get(params.id)
        } else {
            produto = new Produto()
            produto.estoque = new Estoque()
        }
        produto.nome = params.nome
        produto.preco = params.preco.toInteger()
        produto.estoque.quantidade = params.qtd.toInteger()
        produto.estoque.qtdMinima = params.qtdMin.toInteger()

        produto.validate()
        if(!produto.hasErrors()){
            produto.save(flush: true)
            render("Salvou")
        } else {
            render("Erro ao salvar")

        }
    }

    def lista(){
        def lista = Produto.list()
        render(template:"/produto/lista", model: [produtos : lista])
    }

    def alterar(){
        Produto produto = Produto.get(params.id)
        render(template: "/produto/form", model: [produto: produto])
    }

    def excluir(){
        Produto produto = Produto.get(params.id)
        produto.delete(flush: true)
        def lista = Produto.list()
        render(template: "/produto/form", model: [produtos: lista])
    }
}
