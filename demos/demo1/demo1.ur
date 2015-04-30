fun isEmpty (v : string) = if v = ""
  then <xml><p>Field is required!</p></xml>
  else <xml/>
 
fun main () = 
  s <- source "";
  return <xml><body>
      <ctextbox source={s}/> <br/>
     <dyn signal={a <- signal s; return <xml>You entered: {[a]}</xml>}/> <br/>
     <dyn signal={a <- signal s; return (isEmpty a)}/> <br/>
     
    </body></xml>
