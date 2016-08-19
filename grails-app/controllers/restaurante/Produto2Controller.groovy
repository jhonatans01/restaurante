package restaurante

import grails.converters.JSON

class Produto2Controller {

    def index() {
        def lista = Produto.list()
        render (view: "/produto2/index", model: [produtos: lista])
    }

    def salvarProduto() {
        def retorno = [:]
        Produto p

        if (params.id){
            p = Produto.get(params.id)
        } else {
            p = new Produto()
            p.estoque = new Estoque()
        }

        p.nome = params.nome
        p.preco = params.preco.toInteger()
        p.estoque = new Estoque()
        p.estoque.quantidade = 0
        p.estoque.quantidade = params.qtde.toInteger()
        p.estoque.qtdMinima = 0
        p.estoque.qtdMinima = params.qtdeMin.toInteger()
        p.validate()
        if(!p.hasErrors()){
            p.save(flush: true)
            retorno["mensagem"]="OK"
        } else{
            retorno["mensagem"]="erro"
        }
        render retorno as JSON
    }

    def carregarListaCont(){
        def lista = Produto.list()
        render (template: "/produto2/lista2", model: [produtos: lista])
    }

    def getProduto(){
        Produto p = Produto.get(params.id)
        render p as JSON
    }

    def excluirProduto(){
        def retorno = [:]
        Produto p = Produto.get(params.id)

        try {
            p.delete(flush: true)
            retorno["mensagem"]="OK"
        }catch (Exception e){
            retorno["mensagem"]="OK"
        }

        render retorno as JSON
    }
}
