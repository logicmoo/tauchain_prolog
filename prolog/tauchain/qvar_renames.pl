   	 

%% remove_incompletes( :TermN, :TermCBefore) is det.
%
% Remove Incompletes.
%
remove_incompletes([],[]).
remove_incompletes([N=_|Before],CBefore):-var(N),!,
 remove_incompletes(Before,CBefore).
remove_incompletes([NV|Before],[NV|CBefore]):-
 remove_incompletes(Before,CBefore).

:- export(extract_lvars/3).

%= 	 	 

%% extract_lvars( ?A, ?B, ?After) is det.
%
% Extract Lvars.
%
extract_lvars(A,B,After):-
     (get_varname_list(Before)->true;Before=[]),
     remove_incompletes(Before,CBefore),!,
     copy_lvars(A,CBefore,B,After),!.

% copy_lvars( VAR,Vars,VAR,Vars):- var(VAR),!.

%= 	 	 

%% copy_lvars( :TermVAR, ?Vars, :TermNV, ?NVars) is det.
%                        
% Copy Lvars.
%
copy_lvars(Term,Vars,Out,VarsO):- Term ==[],!,always((Out=Term,VarsO=Vars)).
copy_lvars( VAR,Vars,Out,VarsO):- var(VAR),!,always((Out=VAR,VarsO=Vars)).
copy_lvars([H|T],Vars,[NH|NT],VarsO):- !, copy_lvars(H,Vars,NH,SVars),!, copy_lvars(T,SVars,NT,VarsO).
copy_lvars('?'(Inner),Vars,Out,VarsO):- !, copy_lvars(Inner,Vars,NInner,VarsO), always((atom(NInner) -> atom_concat_or_rtrace('?',NInner,Out) ; Out = '?'(NInner))),!.
copy_lvars( VAR,Vars,Out,VarsO):- svar(VAR,Name)->always(atom(Name)),!,always(register_var(Name=Out,Vars,VarsO)).
copy_lvars( VAR,Vars,Out,VarsO):- \+ compound(VAR),!,always((Out=VAR,VarsO=Vars)).
copy_lvars(Term,Vars,NTerm,VarsO):-    
    Term=..[F|Args],    % decompose term
    (svar(F,_)-> copy_lvars( [F|Args],Vars,NTerm,VarsO);
    % construct copy term
       (copy_lvars(Args,Vars,NArgs,VarsO), NTerm=..[F|NArgs])),!.  


%= 	 	 

%% svar( ?Var, ?NameU) is det.
%
% If this is a KIF var, convert to a name for prolog
%
svar(SVAR,UP):- nonvar(UP),!,trace_or_throw(nonvar_svar(SVAR,UP)).
svar(Var,Name):- var(Var),!,always(svar_fixvarname(Var,Name)).
svar('$VAR'(Var),Name):-number(Var),Var > -1, !, always(format(atom(Name),'~w',['$VAR'(Var)])),!.
svar('$VAR'(Name),VarName):-!,always(svar_fixvarname(Name,VarName)).
svar(_,_):- \+ kif_ok,!,fail.
svar([],_):-!,fail.
svar('#'(Name),NameU):-!,svar(Name,NameU),!.

svar('?'(Name),NameU):-svar_fixvarname(Name,NameU),!.
svar('@'(Name),NameU):-svar_fixvarname(Name,NameU),!.
% svar(VAR,Name):-atom(VAR),atom_concat_or_rtrace('_',_,VAR),svar_fixvarname(VAR,Name),!.
svar(VAR,Name):-atom(VAR),atom_concat_or_rtrace('@',A,VAR),non_empty_atom(A),svar_fixvarname(VAR,Name),!.
svar(VAR,Name):-atom(VAR),atom_concat_or_rtrace('?',A,VAR),non_empty_atom(A),svar_fixvarname(VAR,Name),!.


:- export(svar_fixvarname/2).

%= 	 	 

%% svar_fixvarname( ?SVARIN, ?UP) is det.
%
% Svar Fixvarname.
%

svar_fixvarname(SVAR,UP):- nonvar(UP),!,trace_or_throw(nonvar_svar_fixvarname(SVAR,UP)).
svar_fixvarname(SVAR,UP):- svar_fixname(SVAR,UP),!.
svar_fixvarname(SVAR,UP):- trace_or_throw(svar_fixname(SVAR,UP)).

svar_fixname(Var,NameO):-var(Var),variable_name_or_ref(Var,Name),sanity(nonvar(Name)),!,svar_fixvarname(Name,NameO).
svar_fixname('$VAR'(Name),UP):- !,svar_fixvarname(Name,UP).
svar_fixname('@'(Name),UP):- !,svar_fixvarname(Name,UP).
svar_fixname('?'(Name),UP):- !,svar_fixvarname(Name,UP).
svar_fixname(SVAR,SVARO):- ok_var_name(SVAR),!,SVARO=SVAR.
svar_fixname('??','_'):-!.
svar_fixname(QA,AU):-atom_concat_or_rtrace('??',A,QA),non_empty_atom(A),!,svar_fixvarname(A,AO),atom_concat_or_rtrace('_',AO,AU).
svar_fixname(QA,AO):-atom_concat_or_rtrace('?',A,QA),non_empty_atom(A),!,svar_fixvarname(A,AO).
svar_fixname(QA,AO):-atom_concat_or_rtrace('@',A,QA),non_empty_atom(A),!,svar_fixvarname(A,AO).
svar_fixname(NameU,NameU):-atom_concat_or_rtrace('_',Name,NameU),non_empty_atom(Name),atom_number(Name,_),!.
svar_fixname(NameU,NameUO):-atom_concat_or_rtrace('_',Name,NameU),non_empty_atom(Name), \+ atom_number(Name,_),!,svar_fixvarname(Name,NameO),atom_concat_or_rtrace('_',NameO,NameUO).
svar_fixname(I,O):-  
 always((
  fix_varcase(I,M0),
  atom_subst(M0,'@','_AT_',M1),
  atom_subst(M1,'?','_Q_',M2),
  atom_subst(M2,':','_C_',M3),
  atom_subst(M3,'-','_',O),
  ok_var_name(O))),!.

%= 	 	 

%% fix_varcase( ?I, ?O) is det.
%                                                               
% Fix Varcase.
%
fix_varcase(Word,Word):- atom_concat_or_rtrace('_',_,Word),!.
fix_varcase(Word,WordC):- !, atom_codes(Word,[F|R]),to_upper(F,U),atom_codes(WordC,[U|R]).
% the cut above stops the rest 
fix_varcase(Word,Word):-upcase_atom(Word,UC),UC=Word,!.
fix_varcase(Word,WordC):-downcase_atom(Word,UC),UC=Word,!,atom_codes(Word,[F|R]),to_upper(F,U),atom_codes(WordC,[U|R]).
fix_varcase(Word,Word). % mixed case

:- export(ok_varname_or_int/1).

%% ok_varname_or_int( ?Name) is det.
%
% Ok Varname.
%
ok_varname_or_int(Name):- atom(Name),!,ok_var_name(Name).
ok_varname_or_int(Name):- number(Name).

%% ok_var_name( ?Name) is det.
%
% Ok Varname.
%
ok_var_name(Name):- 
  quietly_sreader(( atom(Name),atom_codes(Name,[C|_List]),char_type(C,prolog_var_start),
      read_term_from_atom(Name,Term,[syntax_errors(fail),variable_names(Vs)]),!,var(Term),Vs=[RName=RVAR],!,RVAR==Term,RName==Name)).

%:- export(ok_codes_in_varname/1).
%ok_codes_in_varname([]).
%ok_codes_in_varname([C|List]):-!,ok_in_varname(C),ok_codes_in_varname(List).

%:- export(ok_in_varname/1).
%ok_in_varname(C):-sym_char(C),\+member(C,`!@#$%^&*?()`).



%= 	 	 

%% atom_upper( ?A, ?U) is det.
%
% Atom Upper.
%
atom_upper(A,U):-string_upper(A,S),quietly_sreader(((atom_string(U,S)))).


%= 	 	 

%% lisp_read_from_input( ?Forms) is det.
%
% Lisp Read Converted From Input.
%
lisp_read_from_input(Forms):-lisp_read(current_input,Forms),!.

readCycL(Forms):-lisp_read(current_input,Forms).

%% lisp_read_from_stream( ?I, ?Forms) is det.
%
% Lisp Read Converted To Simple Form.
%
lisp_read_from_stream(Input,Forms):- 
   lisp_read(Input,Forms).
     	 

%% lisp_read( ?I, ?Forms) is det.
%
% Lisp Read Converted To Simple Form.
%
lisp_read(Input,Forms):- 
    lisp_read_typed(Input, Forms0),!,
    quietly_sreader((always(to_untyped(Forms0,Forms)))).



%% lisp_read_typed( ?I, -Expr) is det.
%
% Lisp Read, Expression models DCG
%
lisp_read_typed(In,Expr):- track_stream(In,parse_sexpr(In,Expr)),!.
/*
lisp_read_typed(In,Expr):- fail, % old_stream_read
 (read_line_to_codes(current_input,AsciiCodes),
      (AsciiCodes==[]-> (at_end_of_stream(In) -> (Expr=end_of_file); lisp_read_typed(In,Expr)); 
        once(always(parse_sexpr(AsciiCodes,Expr);lisp_read_typed(In,Expr));read_term_from_codes(AsciiCodes,Expr,[])))).
*/
track_stream(_In,G):- !,G.
track_stream(In,G):- \+ is_stream(In),!,G.
track_stream(In,G):- 
   b_setval('$lisp_translation_stream',In),
   notrace_catch_fail(stream_position(In,Pos,Pos),_,true),
   character_count(In,Chars),
   stream_property(In,encoding(Was)),
   (setup_call_catcher_cleanup(
        nop(set_stream(In,encoding(octet))),
        (ignore(notrace_catch_fail(line_count(In,Line),_,(Line = -1))),
         b_setval('$lisp_translation_line',Line-Chars),
           ((G),!)),
        Catcher,
        true)->true;Catcher=fail),
     track_stream_cleanup(Catcher,In,Was,Pos).

track_stream_cleanup(Exit,In,Was,_Pos):- (Exit==exit ; Exit == (!)),!,
   set_stream(In,encoding(Was)).
track_stream_cleanup(Catcher,In,Was,Pos):-
   set_stream(In,encoding(Was)),
   ((nonvar(Pos),supports_seek(In))->stream_position(In,_Was,Pos);true),!,
   (compound(Catcher)-> (arg(1,Catcher,E),throw(E)) ; fail).




%= 	 	 

%% lowcase( :TermC1, :TermC2) is det.
%
% Lowcase.
%
lowcase([],[]).
lowcase([C1|T1],[C2|T2]) :- lowercase(C1,C2), lowcase(T1,T2).


%= 	 	 

%% lowercase( ?C1, ?C2) is det.
%
% Lowercase.
%
lowercase(C1,C2) :- C1 >= 65, C1 =< 90, !, C2 is C1+32.
lowercase(C,C).


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Interpretation
   --------------

   Declaratively, execution of a Lisp form is a relation between the
   (function and variable) binding environment before its execution
   and the environment after its execution. A Lisp program is a
   sequence of Lisp forms, and its result is the sequence of their
   results. The environment is represented as a pair of association
   lists Fs-Vs, associating function names with argument names and
   bodies, and variables with values. DCGs are used to implicitly
   thread the environment state through.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */



%= 	 	 

%% codelist_to_forms( ?AsciiCodesList, ?FormsOut) is det.
%
% Codelist Converted To Forms.
%
codelist_to_forms(AsciiCodesList,FormsOut):-
    parse_sexpr(AsciiCodesList, Forms0),!,   
    always(compile_all(Forms0, FormsOut)),!.


/*

:- export(baseKB:rff/0).

baseKB:rff:-baseKB:rff(dbginfo(n(first)),dbginfo(n(retry)),dbginfo(n(success)),dbginfo(n(failure))).

:- export(baseKB:rff/4).
baseKB:rff(OnFirst,OnRetry,OnSuccess,OnFailure) :- CU = was(never,first),
  call_cleanup((
    process_rff(CU,OnFirst,OnRetry,OnSuccess,OnFailure),
    (nb_setarg(1,CU,first));((nb_setarg(1,CU,second)),!,fail)),
    (nb_setarg(2,CU,second),process_rff(CU,OnFirst,OnRetry,OnSuccess,OnFailure),dbginfo(cleanup(CU)))),
  once((
    process_rff(CU,OnFirst,OnRetry,OnSuccess,OnFailure),
    CU \= was(second, _))).

:- export(process_rff/5).
process_rff(CU,OnFirst,OnRetry,OnSuccess,OnFailure):-
   dbginfo(next(CU)),
   once(((CU==was(first,first)->OnFirst;true),
   (CU==was(second,first)->OnRetry;true),
   (CU==was(second,second)->OnFailure;true),
   (CU==was(first,second)-e>OnSuccess;true))).


*/


/*
:- prolog_load_context(directory,Dir),
   DirFor = plarkc,
   (( \+ user:file_search_path(DirFor,Dir)) ->asserta(user:file_search_path(DirFor,Dir));true),
   absolute_file_name('../../../../',Y,[relative_to(Dir),file_type(directory)]),
   (( \+ user:file_search_path(pack,Y)) ->asserta(user:file_search_path(pack,Y));true).
:- attach_packs.
:- initialization(attach_packs).
*/

% [Required] Load the Logicmoo Library Utils
% = % :- ensure_loaded(logicmoo(logicmoo_utils)).

% % :- ensure_loaded(logicmoo(plarkc/mpred_cyc_api)).


:- export(fixvars/4).

%= 	 	 

%% fixvars( ?P, ?VALUE2, :TermARG3, ?P) is det.
%
% Fixvars.
%
fixvars(P,_,[],P):-!.
fixvars(P,N,[V|VARS],PO):-  
     quietly_sreader((atom_string(Name,V))),
     svar_fixvarname(Name,NB),Var = '$VAR'(NB),
     subst(P,'$VAR'(N),Var,PM0),
     subst(PM0,'$VAR'(Name),Var,PM),
   %  (get_varname_list(Vs)->true;Vs=[]),
  %   append(Vs,[Name=Var],NVs),
  %   nput_variable_names( NVs),
     N2 is N + 1, fixvars(PM,N2,VARS,PO).




non_empty_atom(A1):- atom(A1),atom_length(A1,AL),!,AL>0.


