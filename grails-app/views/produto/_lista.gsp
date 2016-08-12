<g:if test="${produtos.size() > 0}">
    <table>
        <tr>
            <td>Nome</td>
            <td>Preço</td>
            <td>Qtde. Atual</td>
            <td>Qtde. Minima</td>
            <td></td>
        </tr>

        <g:each var="produto" in="${produtos}">
            <tr>
                <td>${produto?.nome}</td>
                <td>${produto?.preco}</td>
                <td>${produto?.estoque?.quantidade}</td>
                <td>${produto?.estoque?.qtdMinima}</td>
                <td>
                    <g:remoteLink controller="produto" action="alterar" update="divForm"
                    id="${produto.id}">Alterar</g:remoteLink>
                    <a href="#" onclick="excluir('${produto.id}')">Excluir</a>
                </td>
            </tr>
        </g:each>
    </table>
</g:if>
<g:else>
    Não há produtos
</g:else>
