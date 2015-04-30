fun chkInput (v : string) = if v = ""
  then <xml><span><p>Field is required!</p></span></xml>
  else <xml><span><p>You entered: {[v]}</p></span></xml>

fun isEmpty (a : string) = a = ""
                               
fun rTxt (s : source string) = <xml>
    <ctextbox source={s}/> <br/>
    <dyn signal={a <- signal s; return (chkInput a)}/> <br/>
  </xml>

type myR = { A : string, B : string}
val show_myR = mkShow (fn (a : myR) => "{ A = " ^ a.A ^ ", B = " ^ a.B ^ " }")


fun main () = 
    let
        val m = { A = "", B = "" }
    in
    i <- source m;
    s <- source m.A;
    k <- source m.B;
    let
        fun faff () =
            a <- get s;
            b <- get k;
            set i { A = a, B = b };
            return ()
        fun showButton (a : string) (f : string -> bool) =
            if not (f a)
            then <xml><button value="Clicky" onclick={fn _ => faff ()}/></xml>
            else <xml/>
    in
    return <xml>
      <body>
        <form>
          {rTxt s}
          {rTxt k}
          <dyn signal={a <- signal s; return (showButton a isEmpty)}/>
        </form>
          <dyn signal={a <- signal i; return <xml><h2>{[show a]}</h2></xml>}/>
      </body>
    </xml>
    end
    end
