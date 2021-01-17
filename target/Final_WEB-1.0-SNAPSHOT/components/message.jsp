
<%
    String message =(String)session.getAttribute("message");
    if(message!=null)
    {
        
        //prints
        
        //out.print(message);
 %>
 <style>
.alert {
  padding: 12px;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}


.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
 <div class="alert">
     <div class="alert success">
        <span class="closebtn">&times;</span>  
        <strong><%=message%></strong>
     </div>
 </div>
<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>

 <%
        session.removeAttribute("message");
    }
%>