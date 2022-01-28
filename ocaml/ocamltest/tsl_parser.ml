type token =
  | TSL_BEGIN_C_STYLE
  | TSL_END_C_STYLE
  | TSL_BEGIN_OCAML_STYLE
  | TSL_END_OCAML_STYLE
  | COMMA
  | TEST_DEPTH of (int)
  | EQUAL
  | PLUSEQUAL
  | INCLUDE
  | SET
  | UNSET
  | WITH
  | IDENTIFIER of (string)
  | STRING of (string)

open Parsing;;
let _ = parse_error;;
# 19 "tsl_parser.mly"

open Location
open Tsl_ast

let mkstring s = make_string ~loc:(symbol_rloc()) s

let mkidentifier id = make_identifier ~loc:(symbol_rloc()) id

let mkenvstmt envstmt =
  let located_env_statement =
    make_environment_statement ~loc:(symbol_rloc()) envstmt in
  Environment_statement located_env_statement

# 34 "tsl_parser.ml"
let yytransl_const = [|
  257 (* TSL_BEGIN_C_STYLE *);
  258 (* TSL_END_C_STYLE *);
  259 (* TSL_BEGIN_OCAML_STYLE *);
  260 (* TSL_END_OCAML_STYLE *);
  261 (* COMMA *);
  263 (* EQUAL *);
  264 (* PLUSEQUAL *);
  265 (* INCLUDE *);
  266 (* SET *);
  267 (* UNSET *);
  268 (* WITH *);
    0|]

let yytransl_block = [|
  262 (* TEST_DEPTH *);
  269 (* IDENTIFIER *);
  270 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\003\000\004\000\007\000\
\007\000\008\000\008\000\005\000\005\000\005\000\005\000\005\000\
\006\000\009\000\000\000"

let yylen = "\002\000\
\003\000\003\000\000\000\002\000\001\000\001\000\003\000\000\000\
\003\000\000\000\003\000\003\000\003\000\004\000\002\000\002\000\
\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\019\000\000\000\000\000\000\000\
\000\000\017\000\000\000\000\000\005\000\006\000\000\000\000\000\
\000\000\016\000\000\000\015\000\001\000\004\000\000\000\000\000\
\002\000\000\000\007\000\000\000\018\000\012\000\013\000\010\000\
\014\000\000\000\000\000\011\000"

let yydgoto = "\002\000\
\005\000\011\000\012\000\013\000\014\000\015\000\027\000\034\000\
\030\000"

let yysindex = "\018\000\
\004\255\000\000\021\255\021\255\000\000\253\254\253\254\253\254\
\253\254\000\000\026\255\021\255\000\000\000\000\028\255\034\255\
\027\255\000\000\033\255\000\000\000\000\000\000\029\255\029\255\
\000\000\253\254\000\000\029\255\000\000\000\000\000\000\000\000\
\000\000\036\255\253\254\000\000"

let yyrindex = "\000\000\
\000\000\000\000\040\255\041\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\022\255\000\000\000\000\000\000\000\000\
\002\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\012\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\005\000\000\000\000\000\000\000\250\255\000\000\000\000\
\009\000"

let yytablesize = 45
let yytable = "\017\000\
\018\000\019\000\020\000\008\000\003\000\008\000\004\000\008\000\
\016\000\010\000\008\000\008\000\008\000\009\000\008\000\009\000\
\022\000\009\000\001\000\032\000\009\000\009\000\009\000\003\000\
\009\000\003\000\006\000\021\000\036\000\007\000\008\000\009\000\
\031\000\010\000\023\000\024\000\033\000\025\000\026\000\028\000\
\035\000\003\000\029\000\000\000\003\000"

let yycheck = "\006\000\
\007\000\008\000\009\000\002\001\001\001\004\001\003\001\006\001\
\004\000\013\001\009\001\010\001\011\001\002\001\013\001\004\001\
\012\000\006\001\001\000\026\000\009\001\010\001\011\001\002\001\
\013\001\004\001\006\001\002\001\035\000\009\001\010\001\011\001\
\024\000\013\001\007\001\008\001\028\000\004\001\012\001\007\001\
\005\001\002\001\014\001\255\255\004\001"

let yynames_const = "\
  TSL_BEGIN_C_STYLE\000\
  TSL_END_C_STYLE\000\
  TSL_BEGIN_OCAML_STYLE\000\
  TSL_END_OCAML_STYLE\000\
  COMMA\000\
  EQUAL\000\
  PLUSEQUAL\000\
  INCLUDE\000\
  SET\000\
  UNSET\000\
  WITH\000\
  "

let yynames_block = "\
  TEST_DEPTH\000\
  IDENTIFIER\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'tsl_items) in
    Obj.repr(
# 50 "tsl_parser.mly"
                                              ( _2 )
# 138 "tsl_parser.ml"
               : Tsl_ast.tsl_block))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'tsl_items) in
    Obj.repr(
# 51 "tsl_parser.mly"
                                                      ( _2 )
# 145 "tsl_parser.ml"
               : Tsl_ast.tsl_block))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "tsl_parser.mly"
  ( [] )
# 151 "tsl_parser.ml"
               : 'tsl_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'tsl_item) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'tsl_items) in
    Obj.repr(
# 55 "tsl_parser.mly"
                     ( _1 :: _2 )
# 159 "tsl_parser.ml"
               : 'tsl_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'test_item) in
    Obj.repr(
# 58 "tsl_parser.mly"
            ( _1 )
# 166 "tsl_parser.ml"
               : 'tsl_item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'env_item) in
    Obj.repr(
# 59 "tsl_parser.mly"
           ( _1 )
# 173 "tsl_parser.ml"
               : 'tsl_item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'identifier) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'with_environment_modifiers) in
    Obj.repr(
# 62 "tsl_parser.mly"
                                                   ( (Test (_1, _2, _3)) )
# 182 "tsl_parser.ml"
               : 'test_item))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "tsl_parser.mly"
  ( [] )
# 188 "tsl_parser.ml"
               : 'with_environment_modifiers))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'identifier) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'opt_environment_modifiers) in
    Obj.repr(
# 66 "tsl_parser.mly"
                                            ( _2::(List.rev _3) )
# 196 "tsl_parser.ml"
               : 'with_environment_modifiers))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "tsl_parser.mly"
  ( [] )
# 202 "tsl_parser.ml"
               : 'opt_environment_modifiers))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'opt_environment_modifiers) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'identifier) in
    Obj.repr(
# 70 "tsl_parser.mly"
                                             ( _3::_1 )
# 210 "tsl_parser.ml"
               : 'opt_environment_modifiers))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'identifier) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'string) in
    Obj.repr(
# 74 "tsl_parser.mly"
    ( mkenvstmt (Assignment (false, _1, _3)) )
# 218 "tsl_parser.ml"
               : 'env_item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'identifier) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'string) in
    Obj.repr(
# 76 "tsl_parser.mly"
    ( mkenvstmt (Append (_1, _3)) )
# 226 "tsl_parser.ml"
               : 'env_item))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'identifier) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'string) in
    Obj.repr(
# 78 "tsl_parser.mly"
    ( mkenvstmt (Assignment (true, _2, _4)) )
# 234 "tsl_parser.ml"
               : 'env_item))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'identifier) in
    Obj.repr(
# 80 "tsl_parser.mly"
    ( mkenvstmt (Unset _2) )
# 241 "tsl_parser.ml"
               : 'env_item))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'identifier) in
    Obj.repr(
# 83 "tsl_parser.mly"
  ( mkenvstmt (Include _2) )
# 248 "tsl_parser.ml"
               : 'env_item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "tsl_parser.mly"
                       ( mkidentifier _1 )
# 255 "tsl_parser.ml"
               : 'identifier))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 87 "tsl_parser.mly"
               ( mkstring _1 )
# 262 "tsl_parser.ml"
               : 'string))
(* Entry tsl_block *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let tsl_block (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Tsl_ast.tsl_block)
;;
