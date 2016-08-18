<table>
    <tr>
        <th>Nome</th>
        <th>Preço</th>
        <th>Qtde</th>
        <th>Qtde min</th>
        <th></th>
    </tr>

    <g:each in="${produtos}" var="produto">
        <tr>
            <td>${produto.nome}</td>
            <td>${produto.preco}</td>
            <td>${produto.estoque.quantidade}</td>
            <td>${produto.estoque.qtdMinima}</td>
            <td><a href="javascript: alterarProduto(${produto.id})">Alterar</a></td>
        </tr>
    </g:each>
</table>