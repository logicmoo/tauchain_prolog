
:- use_module(library(logicmoo_common)).


:- op(500,fx,'~').
:- op(1050,xfx,('==>')).
:- op(1050,xfx,'<==>').
:- op(1050,xfx,('<-')).
:- op(1100,fx,('==>')).
:- op(1150,xfx,('::::')).



show_tml_read_and_do(ExprsVs):- is_list(ExprsVs),!, maplist(show_tml_read_and_do,ExprsVs).
show_tml_read_and_do(ExprsVs):- 
  must(show_tml_read(ExprsVs)),  
  must(show_tml_do(ExprsVs)).

show_tml_do(H):-
  must(tml_unnumbervars(H,HH)),
  must_or_rtrace(tml_to_pfc(HH,HHH)),
  must(ain(HHH)).

% must_or_rtrace(G):-  G*-> true ; rtrace(G).


ain_test(Name:Data):- !, ain_test(Name,Data,_).
ain_test(Data):- gensym(tml_sample,Name),ain_test(Name,``,Data).

ain_test(Name,String,ExprsVs):- 
  into_codes_list_s(String, Data),
  text_to_string(Data,SData),
  assert(tml_sample_name_data(Name,SData)),
  pfcReset,
  upcase_atom(Name,UNAME),
   %cls,
   format("~N~n# TEST ~w~n", UNAME),
   format('~N````~n~s~N````~n',SData),
   writeln('````'),
   dmsg("===PROCESS===================="),
   (var(ExprsVs) -> parse_tml(SData, ExprsVs) ; true),
   nop((pfcWatch,mpred_trace)),
   maplist(show_tml_read_and_do,ExprsVs),
   pfcPrintDB,
   writeln('````'),!,
   nop(break).

:- ensure_loaded(tml_reader).
:- ensure_loaded(tml_fwdchaing).

