<html>
<head>
    <meta name="layout" content="main">
    <title>Controle de produtos</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <style>
        #divProdutos
    </style>
    <script type="text/javascript">

       /* $(document).ready(function(){
            carregarLista()
            })*/

       $(document).ready(function(){
           carregarLista()
               })

        function carregarLista2(){
            <g:remoteFunction update="divLista" action="carregarListaCont" controller="produto2"/>
        }

        function carregarLista(){
            $.ajax({
                method: "POST",
                url: "/restaurante/produto2/carregarListaCont",
                data: {},
                success: function (data) {
                    $("#divLista").html(data)
                }
            })
        }

       function alterarProduto(id) {
           $.ajax({
               method: "POST",
               url: "/restaurante/produto2/getProduto",
               data: {"id": id},
               success: function (data) {
                   console.log(data)
                   $("#formUsuario input[name=id]").val(data.id)
                   $("#formUsuario input[name=nome]").val(data.nome)
                   $("#formUsuario input[name=preco]").val(data.preco)
                   $("#formUsuario input[name=qtde]").val(data.estoque.quantidade)
                   $("#formUsuario input[name=qtdeMin]").val(data.estoque.qtdeMin)
                   //$("#divLista").html(data)
               }
           })
       }


       function excluirProduto(id){
           if(confirm("Deseja realmente excluir?")) {
               $.ajax({
                   method: "POST",
                   url: "/restaurante/produto2/excluirProduto",
                   data: {"id": id},
                   success: function (data) {

                       if (data.mensagem == "OK") {
                           carregarLista()
                       } else {
                           $("#divMensagem").html("Nao foi possivel excluir")
                       }
                   }
               })
           }
       }

        function retornoSalvarProduto(data) {
            if(data.mensagem=="OK"){
                $("#divMensagem").html("Produto salvo")
                $("#formUsuario input[name=id]").val("")
                $("#formUsuario input[name=nome]").val("")
                $("#formUsuario input[name=preco]").val("")
                $("#formUsuario input[name=qtde]").val("")
                $("#formUsuario input[name=qtdeMin]").val("")
                carregarLista()
            } else {
                $("#divMensagem").html("Erro ao salvar")
            }
        }
    </script>
</head>

<body>
    <div id="divProdutos">
        <div>
            <g:formRemote if="formUsuario" name="formUsuario" url="[controller: 'produto2', action: 'salvarProduto']"
            onSuccess="retornoSalvarProduto(data)">
                <input type="hidden" name="id">
                Nome: <input type="text" name="nome"/><br/>
                Preço: <input type="number" name="preco"/><br/>
                Qtde: <input type="number" name="qtde"/><br/>
                Qtde Min: <input type="number" name="qtdeMin">
                <input type="submit" name="salvar" value="Salvar"/><br/>
            </g:formRemote>
        </div>

        <div id="divMensagem">

        </div>

        <div id="divLista">

        </div>
    </div>
</body>
</html>