<div id="divMensagem"></div>
<g:formRemote name="formProduto" url="[controller: 'produto', action: 'salvar']" update="divMensagem" onSuccess="carregarLista()">
    Nome: <input type="text" name="nome" value="${produto.nome}"></br>
    Preço: <input type="text" name="preco" value="${produto.preco}"></br>
    Quantidade: <input type="number" name="qtd" value="${produto.estoque.quantidade}"></br>
    Qtd. Minima: <input type="number" name="qtdMin" value="${produto.estoque.qtdMinima}"></br>
    <input type="submit" name="btnSalvar" value="Salvar">
    <input type="button" name="btnCancelar" value="Cancelar">
    <input type="hidden" name="id" value="${produto.id}">
</g:formRemote>