<script src="/Project/js/sweetalert.min.js"> </script>
<script src="/Project/js/jquery-3.6.0"></script>
<script src="/Project/js/DataTables/datatables.js"></script>
<script type="text/javascript">
<%
if(!msg.equals("")){
%>
	swal("Furniture Shop", "<%=msg%>",  "success" );
<%
}
%>

</script>

</body>
</html>