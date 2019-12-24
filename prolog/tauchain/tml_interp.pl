
:- use_module(library(logicmoo_common)).

:- ensure_loaded(tml_reader).
:- writeln('````').
:- ensure_loaded(tml_fwdchaing).
:- ensure_loaded(tml_testing).
:- writeln('````').

run_tml(String):-
 into_codes_list(String, Chars),
 parse_tml(Chars, ExprsVs),
 pfcReset,
 show_tml_read_and_do(ExprsVs),!,
 dmsg("===SUCESSS===================="),!,
 pfcPrintDB.

run_tml(_):- 
 dmsg(failed("===FAILED====================")),!.

tml_unnumbervars(ExprsVs,ExprsNA):-
  unnumbervars(ExprsVs,Exprs),
  copy_term(Exprs,ExprsNA,_),!.


show_tml_read_and_do(ExprsVs):- is_list(ExprsVs),!,maplist(show_tml_read_and_do,ExprsVs).
show_tml_read_and_do(ExprsVs):- show_tml_read(ExprsVs),
  tml_unnumbervars(ExprsVs,Exprs),
  show_tml_do(Exprs).

show_tml_do(H:-B):- !,ain(B==>H).
show_tml_do(H):- ain(H).

check_tml_sample(Name:Data):-
  text_to_string(Data,SData),
  assert(tml_sample_name_data(Name,SData)),
  upcase_atom(Name,UNAME),
  format("~N~n== TEST: ~w ~n````", UNAME),
   format('~N~s~n',SData),
   writeln('````'),
   dmsg("===PROCESS===================="),
   writeln('````'),
   run_tml(SData),
   writeln('````'),!.


:- tml_examples(List), 
   maplist(check_tml_sample,List).


