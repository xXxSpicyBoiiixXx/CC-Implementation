# 19 "tsl_lexer.mll"
 
open Tsl_parser

let comment_start_pos = ref []

let lexer_error message =
  failwith (Printf.sprintf "Tsl lexer: %s" message)

# 11 "tsl_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\239\255\240\255\241\255\084\000\244\255\001\000\247\255\
    \016\000\084\000\017\000\254\255\001\000\006\000\006\000\198\000\
    \022\000\009\000\009\000\001\000\028\000\055\000\051\000\049\000\
    \055\000\013\000\101\000\199\000\165\000\097\000\129\000\016\000\
    \022\000\248\255\251\255\205\000\076\000\206\000\063\000\063\000\
    \080\000\111\000\109\000\133\000\137\000\132\000\001\000\180\000\
    \212\000\185\000\183\000\186\000\187\000\245\255\194\000\252\255\
    \007\000\195\000\223\000\011\000\227\000\254\255\200\000\252\255\
    \253\255\192\000\199\000\255\255\254\255\037\001\252\255\182\000\
    \001\000\165\001\249\001\184\000\002\000\224\000\227\000\003\000\
    \228\000\229\000\077\002";
  Lexing.lex_backtrk =
   "\000\000\255\255\255\255\255\255\012\000\255\255\015\000\255\255\
    \015\000\009\000\015\000\255\255\015\000\000\000\255\255\255\255\
    \255\255\255\255\255\255\002\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\003\000\
    \009\000\255\255\255\255\013\000\255\255\255\255\255\255\255\255\
    \005\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\006\000\255\255\255\255\255\255\
    \002\000\000\000\001\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\003\000\003\000\255\255\255\255\255\255\255\255\003\000\
    \003\000\003\000\000\000\255\255\255\255\255\255\001\000\255\255\
    \255\255\002\000\255\255";
  Lexing.lex_default =
   "\002\000\000\000\000\000\000\000\255\255\000\000\255\255\000\000\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\000\000\057\000\000\000\
    \255\255\057\000\255\255\255\255\255\255\000\000\063\000\000\000\
    \000\000\255\255\255\255\000\000\000\000\070\000\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\077\000\077\000\255\255\
    \080\000\080\000\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\013\000\011\000\011\000\013\000\012\000\014\000\013\000\
    \011\000\058\000\013\000\014\000\059\000\058\000\000\000\000\000\
    \059\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \013\000\000\000\003\000\077\000\077\000\080\000\013\000\004\000\
    \008\000\047\000\009\000\006\000\007\000\004\000\004\000\010\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\035\000\015\000\026\000\005\000\053\000\026\000\
    \032\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\017\000\018\000\019\000\021\000\004\000\
    \020\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\022\000\033\000\032\000\023\000\
    \024\000\004\000\004\000\034\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\025\000\027\000\
    \026\000\038\000\039\000\040\000\026\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\041\000\
    \026\000\042\000\043\000\004\000\030\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\015\000\
    \027\000\044\000\015\000\027\000\026\000\031\000\037\000\037\000\
    \045\000\037\000\037\000\046\000\047\000\048\000\048\000\047\000\
    \048\000\047\000\047\000\047\000\055\000\255\255\015\000\027\000\
    \058\000\068\000\029\000\058\000\061\000\037\000\037\000\061\000\
    \066\000\067\000\065\000\079\000\048\000\079\000\026\000\000\000\
    \000\000\000\000\000\000\000\000\047\000\000\000\050\000\058\000\
    \001\000\255\255\078\000\061\000\000\000\078\000\081\000\081\000\
    \000\000\000\000\051\000\000\000\000\000\255\255\052\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\016\000\028\000\000\000\000\000\056\000\255\255\
    \000\000\036\000\036\000\000\000\000\000\000\000\000\000\000\000\
    \049\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\060\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\073\000\000\000\000\000\000\000\
    \071\000\000\000\074\000\073\000\000\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\000\000\
    \000\000\255\255\072\000\000\000\000\000\255\255\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \000\000\255\255\000\000\000\000\073\000\000\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\255\255\
    \000\000\255\255\255\255\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\255\255\000\000\000\000\000\000\255\255\
    \064\000\000\000\000\000\000\000\082\000\000\000\000\000\000\000\
    \075\000\000\000\082\000\082\000\255\255\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\000\000\
    \255\255\000\000\076\000\255\255\255\255\255\255\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \000\000\000\000\000\000\000\000\082\000\000\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \074\000\000\000\000\000\000\000\075\000\255\255\074\000\074\000\
    \000\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\000\000\000\000\000\000\076\000\000\000\
    \000\000\000\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\000\000\000\000\000\000\000\000\
    \074\000\000\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\082\000\000\000\000\000\000\000\
    \075\000\000\000\082\000\082\000\000\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\000\000\
    \000\000\000\000\076\000\000\000\000\000\000\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \000\000\000\000\000\000\000\000\082\000\000\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\012\000\000\000\000\000\012\000\013\000\
    \014\000\056\000\013\000\014\000\056\000\059\000\255\255\255\255\
    \059\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\072\000\076\000\079\000\013\000\000\000\
    \000\000\046\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\008\000\010\000\025\000\000\000\006\000\031\000\
    \032\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\016\000\017\000\018\000\020\000\000\000\
    \019\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\004\000\021\000\009\000\009\000\022\000\
    \023\000\004\000\004\000\009\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\024\000\026\000\
    \029\000\036\000\038\000\039\000\026\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\040\000\
    \030\000\041\000\042\000\004\000\029\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\015\000\
    \027\000\043\000\015\000\027\000\028\000\030\000\035\000\037\000\
    \044\000\035\000\037\000\045\000\047\000\048\000\047\000\050\000\
    \048\000\049\000\051\000\052\000\054\000\057\000\015\000\027\000\
    \058\000\065\000\028\000\058\000\060\000\035\000\037\000\060\000\
    \062\000\066\000\062\000\071\000\048\000\075\000\027\000\255\255\
    \255\255\255\255\255\255\255\255\048\000\255\255\049\000\058\000\
    \000\000\046\000\077\000\060\000\255\255\078\000\080\000\081\000\
    \255\255\255\255\050\000\255\255\255\255\025\000\051\000\255\255\
    \031\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\015\000\027\000\255\255\255\255\054\000\057\000\
    \255\255\035\000\037\000\255\255\255\255\255\255\255\255\255\255\
    \048\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\058\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\069\000\255\255\255\255\255\255\
    \069\000\255\255\069\000\069\000\255\255\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\255\255\
    \255\255\029\000\069\000\255\255\255\255\026\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \255\255\030\000\255\255\255\255\069\000\255\255\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \255\255\255\255\255\255\255\255\255\255\028\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\047\000\255\255\255\255\050\000\
    \255\255\049\000\051\000\052\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\054\000\057\000\255\255\255\255\255\255\027\000\
    \062\000\255\255\255\255\255\255\073\000\255\255\255\255\255\255\
    \073\000\255\255\073\000\073\000\048\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\255\255\
    \077\000\255\255\073\000\078\000\080\000\081\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \255\255\255\255\255\255\255\255\073\000\255\255\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \074\000\255\255\255\255\255\255\074\000\069\000\074\000\074\000\
    \255\255\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\255\255\255\255\255\255\074\000\255\255\
    \255\255\255\255\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\255\255\255\255\255\255\255\255\
    \074\000\255\255\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\082\000\255\255\255\255\255\255\
    \082\000\255\255\082\000\082\000\255\255\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\255\255\
    \255\255\255\255\082\000\255\255\255\255\255\255\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \255\255\255\255\255\255\255\255\082\000\255\255\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\007\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\084\000\168\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\252\000";
  Lexing.lex_backtrk_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\
    \000\000\015\000\000\000";
  Lexing.lex_default_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000";
  Lexing.lex_trans_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
    \000\000\000\000\000\000\000\000\000\000\010\000\010\000\000\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\000\000\004\000\000\000\000\000\010\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\010\000\000\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\000\000\
    \000\000\000\000\000\000\010\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \000\000\000\000\000\000\000\000\000\000\010\000\010\000\000\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\000\000\000\000\000\000\000\000\010\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\010\000\000\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\000\000\
    \000\000\000\000\000\000\010\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check_code =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\069\000\
    \255\255\255\255\255\255\255\255\255\255\069\000\069\000\255\255\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\255\255\058\000\255\255\255\255\069\000\
    \255\255\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\069\000\069\000\069\000\069\000\069\000\
    \069\000\069\000\069\000\073\000\255\255\255\255\255\255\255\255\
    \255\255\073\000\073\000\255\255\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\255\255\
    \255\255\255\255\255\255\073\000\255\255\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\074\000\
    \255\255\255\255\255\255\255\255\255\255\074\000\074\000\255\255\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\255\255\255\255\255\255\255\255\074\000\
    \255\255\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\082\000\255\255\255\255\255\255\255\255\
    \255\255\082\000\082\000\255\255\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\255\255\
    \255\255\255\255\255\255\082\000\255\255\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_code =
   "\255\000\255\255\001\255\255\000\001\255\002\255\001\255\255\000\
    \002\255";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 33 "tsl_lexer.mll"
            ( token lexbuf )
# 441 "tsl_lexer.ml"

  | 1 ->
# 34 "tsl_lexer.mll"
            ( Lexing.new_line lexbuf; token lexbuf )
# 446 "tsl_lexer.ml"

  | 2 ->
# 35 "tsl_lexer.mll"
                       ( TSL_BEGIN_C_STYLE )
# 451 "tsl_lexer.ml"

  | 3 ->
# 36 "tsl_lexer.mll"
                                                    ( TSL_BEGIN_C_STYLE )
# 456 "tsl_lexer.ml"

  | 4 ->
# 37 "tsl_lexer.mll"
         ( TSL_END_C_STYLE )
# 461 "tsl_lexer.ml"

  | 5 ->
# 38 "tsl_lexer.mll"
                       ( TSL_BEGIN_OCAML_STYLE )
# 466 "tsl_lexer.ml"

  | 6 ->
# 39 "tsl_lexer.mll"
                                                    ( TSL_BEGIN_OCAML_STYLE )
# 471 "tsl_lexer.ml"

  | 7 ->
# 40 "tsl_lexer.mll"
         ( TSL_END_OCAML_STYLE )
# 476 "tsl_lexer.ml"

  | 8 ->
# 41 "tsl_lexer.mll"
        ( COMMA )
# 481 "tsl_lexer.ml"

  | 9 ->
# 42 "tsl_lexer.mll"
         ( TEST_DEPTH (String.length (Lexing.lexeme lexbuf)) )
# 486 "tsl_lexer.ml"

  | 10 ->
# 43 "tsl_lexer.mll"
         ( PLUSEQUAL )
# 491 "tsl_lexer.ml"

  | 11 ->
# 44 "tsl_lexer.mll"
        ( EQUAL )
# 496 "tsl_lexer.ml"

  | 12 ->
# 46 "tsl_lexer.mll"
    ( let s = Lexing.lexeme lexbuf in
      match s with
        | "include" -> INCLUDE
        | "set" -> SET
        | "unset" -> UNSET
        | "with" -> WITH
        | _ -> IDENTIFIER s
    )
# 508 "tsl_lexer.ml"

  | 13 ->
# 55 "tsl_lexer.mll"
    (
      comment_start_pos := [Lexing.lexeme_start_p lexbuf];
      comment lexbuf
    )
# 516 "tsl_lexer.ml"

  | 14 ->
# 60 "tsl_lexer.mll"
    ( STRING (string "" lexbuf) )
# 521 "tsl_lexer.ml"

  | 15 ->
# 62 "tsl_lexer.mll"
    (
      let pos = Lexing.lexeme_start_p lexbuf in
      let file = pos.Lexing.pos_fname in
      let line = pos.Lexing.pos_lnum in
      let column = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
      let message = Printf.sprintf "%s:%d:%d: unexpected character %s"
        file line column (Lexing.lexeme lexbuf) in
      lexer_error message
    )
# 534 "tsl_lexer.ml"

  | 16 ->
# 72 "tsl_lexer.mll"
    ( lexer_error "unexpected eof" )
# 539 "tsl_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and string acc lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 2 (-1); __ocaml_lex_string_rec acc lexbuf 54
and __ocaml_lex_string_rec acc lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 85 "tsl_lexer.mll"
    ( string (acc ^ Lexing.lexeme lexbuf) lexbuf )
# 551 "tsl_lexer.ml"

  | 1 ->
let
# 86 "tsl_lexer.mll"
                                        blank
# 557 "tsl_lexer.ml"
= Lexing.sub_lexeme_char_opt lexbuf lexbuf.Lexing.lex_mem.(0) in
# 87 "tsl_lexer.mll"
    ( let space =
        match blank with None -> "" | Some blank -> String.make 1 blank
      in
      string (acc ^ space) lexbuf )
# 564 "tsl_lexer.ml"

  | 2 ->
# 92 "tsl_lexer.mll"
    (string (acc ^ "\\") lexbuf)
# 569 "tsl_lexer.ml"

  | 3 ->
# 94 "tsl_lexer.mll"
    (acc)
# 574 "tsl_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_string_rec acc lexbuf __ocaml_lex_state

and comment lexbuf =
   __ocaml_lex_comment_rec lexbuf 62
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 97 "tsl_lexer.mll"
    (
      comment_start_pos :=
        (Lexing.lexeme_start_p lexbuf) :: !comment_start_pos;
      comment lexbuf
    )
# 590 "tsl_lexer.ml"

  | 1 ->
# 103 "tsl_lexer.mll"
    (
      comment_start_pos := List.tl !comment_start_pos;
      if !comment_start_pos = [] then token lexbuf else comment lexbuf
    )
# 598 "tsl_lexer.ml"

  | 2 ->
# 108 "tsl_lexer.mll"
    (
      let pos = List.hd !comment_start_pos in
      let file = pos.Lexing.pos_fname in
      let line = pos.Lexing.pos_lnum in
      let column = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
      let message = Printf.sprintf "%s:%d:%d: unterminated comment"
        file line column in
      lexer_error message
    )
# 611 "tsl_lexer.ml"

  | 3 ->
# 118 "tsl_lexer.mll"
    (
      comment lexbuf
    )
# 618 "tsl_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

and modifier lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 3 (-1);(* L=2 [2] <- p ; [1] <- p ;  *)
  lexbuf.Lexing.lex_mem.(2) <- lexbuf.Lexing.lex_curr_pos ;
  lexbuf.Lexing.lex_mem.(1) <- lexbuf.Lexing.lex_curr_pos ;
 __ocaml_lex_modifier_rec lexbuf 69
and __ocaml_lex_modifier_rec lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 124 "tsl_lexer.mll"
                       variable
# 634 "tsl_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 125 "tsl_lexer.mll"
    ( variable, `Remove )
# 638 "tsl_lexer.ml"

  | 1 ->
let
# 126 "tsl_lexer.mll"
                   variable
# 644 "tsl_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0)
and
# 126 "tsl_lexer.mll"
                                          str
# 649 "tsl_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_mem.(0) + 2) (lexbuf.Lexing.lex_curr_pos + -1) in
# 127 "tsl_lexer.mll"
    ( variable, `Add str )
# 653 "tsl_lexer.ml"

  | 2 ->
let
# 128 "tsl_lexer.mll"
                   variable
# 659 "tsl_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0)
and
# 128 "tsl_lexer.mll"
                                           str
# 664 "tsl_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_mem.(0) + 3) (lexbuf.Lexing.lex_curr_pos + -1) in
# 129 "tsl_lexer.mll"
    ( variable, `Append str )
# 668 "tsl_lexer.ml"

  | 3 ->
# 131 "tsl_lexer.mll"
    ( failwith "syntax error in script response file" )
# 673 "tsl_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_modifier_rec lexbuf __ocaml_lex_state

;;

