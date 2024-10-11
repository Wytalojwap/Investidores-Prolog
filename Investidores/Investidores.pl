main :-
    modelo([A1, A2, A3, A4, A5]),
    imprime_lista([A1, A2, A3, A4, A5]),
    fail.

main :-
    true.

modelo([
    (Nome_1, Idade_1, Colete_1, Segmento_1, Corretora_1, Retorno_1),
    (Nome_2, Idade_2, Colete_2, Segmento_2, Corretora_2, Retorno_2),
    (Nome_3, Idade_3, Colete_3, Segmento_3, Corretora_3, Retorno_3),
    (Nome_4, Idade_4, Colete_4, Segmento_4, Corretora_4, Retorno_4),
    (Nome_5, Idade_5, Colete_5, Segmento_5, Corretora_5, Retorno_5)
]) :-
    
    /* retornos */
    retorno(Retorno_1),
    retorno(Retorno_2),
    retorno(Retorno_3),
    retorno(Retorno_4),
    retorno(Retorno_5),
  
    /* Na segunda posicao esta o analista que acredita em uma alta de 40% no setor no qual e especialista.*/
	(   
	Retorno_2 == 40
	),
    
    alldifferent([Retorno_1, Retorno_2, Retorno_3, Retorno_4, Retorno_5]),
    
    /* segmentos */
    segmento(Segmento_1),
    segmento(Segmento_2),
    segmento(Segmento_3),
    segmento(Segmento_4),
    segmento(Segmento_5),
    
	/* O analista do segmento de Papel e Celulose esta em algum lugar entre o analista de Energia Eletrica e o analista de Bancos, nessa ordem.*/  
    (
    	Segmento_1 == energiaEletrica, Segmento_2 == papelCelulose, (Segmento_3 == bancos ; Segmento_4 == bancos ; Segmento_5 == bancos);
    	Segmento_1 == energiaEletrica, Segmento_3 == papelCelulose, (Segmento_4 == bancos ; Segmento_5 == bancos);
    	Segmento_1 == energiaEletrica, Segmento_4 == papelCelulose, Segmento_5 == bancos;
    	Segmento_2 == energiaEletrica, Segmento_3 == papelCelulose, (Segmento_4 == bancos ; Segmento_5 == bancos);
    	Segmento_2 == energiaEletrica, Segmento_4 == papelCelulose, Segmento_5 == bancos;
        Segmento_3 == energiaEletrica, Segmento_4 == papelCelulose, Segmento_5 == bancos
	),
    
    alldifferent([Segmento_1, Segmento_2, Segmento_3, Segmento_4, Segmento_5]),
    
    
    /* corretoras */
    corretora(Corretora_1),
    corretora(Corretora_2),
    corretora(Corretora_3),
    corretora(Corretora_4),
    corretora(Corretora_5),
    
	/*Em uma das pontas esta o analista que investe atraves da RC Investimentos.*/
	(Corretora_1 == rcInvestimentos;
	 Corretora_5 == rcInvestimentos),
    
	/*Em uma das pontas esta o analista que usa a Cerebrol Corretora para investir.*/
	(Corretora_1 == cerebrolCorretora;
	 Corretora_5 == cerebrolCorretora),
    
    alldifferent([Corretora_1, Corretora_2, Corretora_3, Corretora_4, Corretora_5]),
    
    
    /*O analista que usa a RC Investimentos e especialista no segmento de Medicamentos.*/
    (
    (Corretora_1==rcInvestimentos, Segmento_1==medicamentos);
    (Corretora_2==rcInvestimentos, Segmento_2==medicamentos);
    (Corretora_3==rcInvestimentos, Segmento_3==medicamentos); 
    (Corretora_4==rcInvestimentos, Segmento_4==medicamentos); 
    (Corretora_5==rcInvestimentos, Segmento_5==medicamentos)
    ),
    
    /* coletes */
    
    colete(Colete_1),
    colete(Colete_2),
    colete(Colete_3),
    colete(Colete_4),
    colete(Colete_5),    
      alldifferent([Colete_1, Colete_2, Colete_3, Colete_4, Colete_5]),

    /*O analista de colete Azul esta em algum lugar a esquerda do analista que tem conta na corretora CUCA Pactual.*/
	(	
    	Corretora_2 == cucaPactual, Colete_1 == azul;
    	Corretora_3 == cucaPactual, (Colete_1 == azul ; Colete_2 == azul);
    	Corretora_4 == cucaPactual, (Colete_1 == azul ; Colete_2 == azul ; Colete_3 == azul);
    	Corretora_5 == cucaPactual, (Colete_1 == azul ; Colete_2 == azul ; Colete_3 == azul ; Colete_4 == azul)
	),
    
    /*O homem de colete Amarelo esta exatamente a direita do analista que acompanha o segmento dos Bancos.*/
    (	Segmento_1 == bancos, Colete_2 == amarelo;
        Segmento_2 == bancos, Colete_3 == amarelo;
        Segmento_3 == bancos, Colete_4 == amarelo;
        Segmento_4 == bancos, Colete_5 == amarelo
	),
    
    /*O analista de colete Azul esta ao lado do analista que investe atraves da Cucaynvest.*/
    (   
         Colete_1 == azul, Corretora_2 == cucaynvest;
         Colete_2 == azul, (Corretora_1 == cucaynvest ; Corretora_3 == cucaynvest);
         Colete_3 == azul, (Corretora_2 == cucaynvest ; Corretora_4 == cucaynvest);
         Colete_4 == azul, (Corretora_3 == cucaynvest ; Corretora_5 == cucaynvest);
         Colete_5 == azul, Corretora_4 == cucaynvest
    ),
    
 	/*O segmento de Educacao e estudado pelo analista que esta em algum lugar a direita do homem de colete Verde.*/
	(   Colete_1 == verde, (Segmento_2 == educacao ; Segmento_3 == educacao ; Segmento_4 == educacao ; Segmento_5 == educacao);
    	Colete_2 == verde, (Segmento_3 == educacao ; Segmento_4 == educacao ; Segmento_5 == educacao);
    	Colete_3 == verde, (Segmento_4 == educacao ; Segmento_5 == educacao);
    	Colete_4 == verde, Segmento_5 == educacao
    ),
    
    /*O analista de colete Verde esta ao lado do analista que investe atraves da CUCA Pactual.*/  
	(
        Corretora_1 == cucaPactual, Colete_2 == verde;
    	Corretora_2 == cucaPactual, (Colete_1 == verde ; Colete_3 == verde);
        Corretora_3 == cucaPactual, (Colete_2 == verde ; Colete_4 == verde);
        Corretora_4 == cucaPactual, (Colete_3 == verde ; Colete_5 == verde);
        Corretora_5 == cucaPactual, (Colete_4 == verde)
	),
    
    /*O analista de colete Amarelo esta em algum lugar a esquerda do analista que acredita em uma alta de 20% no segmento no qual e especialista.*/
	(	
    	Retorno_2 == 20, Colete_1 == amarelo;
    	Retorno_3 == 20, (Colete_1 == amarelo ; Colete_2 == amarelo);
    	Retorno_4 == 20, (Colete_1 == amarelo ; Colete_2 == amarelo ; Colete_3 == amarelo);
    	Retorno_5 == 20, (Colete_1 == amarelo ; Colete_2 == amarelo ; Colete_3 == amarelo ; Colete_4 == amarelo)
	),
    
    /*O analista que acredita no maior retorno esta em algum lugar a direita do analista de colete Azul.*/
	(   Colete_1 == azul, (Retorno_2 == 60 ; Retorno_3 == 60 ; Retorno_4 == 60 ; Retorno_5 == 60);
    	Colete_2 == azul, (Retorno_3 == 60 ; Retorno_4 == 60 ; Retorno_5 == 60);
    	Colete_3 == azul, (Retorno_4 == 60 ; Retorno_5 == 60);
    	Colete_4 == azul, Retorno_5 == 60
    ),
    
    /*O analista de colete Verde esta em algum lugar a esquerda do analista que vislumbra um retorno de 50% no segmento no qual e especialista.*/
	(	
    	Retorno_2 == 50, Colete_1 == verde;
    	Retorno_3 == 50, (Colete_1 == verde ; Colete_2 == verde);
    	Retorno_4 == 50, (Colete_1 == verde ; Colete_2 == verde ; Colete_3 == verde);
    	Retorno_5 == 50, (Colete_1 == verde ; Colete_2 == verde ; Colete_3 == verde ; Colete_4 == verde)
	),
    
    /*O analista de colete Branco espera um retorno de 30% no segmento no qual e especialista*/
    (
    (Colete_1==branco, Retorno_1==30);
    (Colete_2==branco, Retorno_2==30);
    (Colete_3==branco, Retorno_3==30); 
    (Colete_4==branco, Retorno_4==30); 
    (Colete_5==branco, Retorno_5==30)
    ),
    
    /* nomes */
    nome(Nome_1),
    nome(Nome_2),
    nome(Nome_3),
    nome(Nome_4),
    nome(Nome_5),
  alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
    /*Felipe esta exatamente a direita do analista de colete Verde.*/    
    (
     	Colete_1 == verde, Nome_2 == felipe;
        Colete_2 == verde, Nome_3 == felipe;
        Colete_3 == verde, Nome_4 == felipe;
        Colete_4 == verde, Nome_5 == felipe
    ),


    /* idades */
    idade(Idade_1),
    idade(Idade_2),
    idade(Idade_3),
    idade(Idade_4),
    idade(Idade_5),
    
    /* Na segunda posicao esta o homem mais novo */
    (   
		Idade_2 == trinta
	),        
      alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),
    
	/*Ricardo tem 50 anos.*/
	(   
    (Nome_1==ricardo, Idade_1==cinquenta);
    (Nome_2==ricardo, Idade_2==cinquenta);
    (Nome_3==ricardo, Idade_3==cinquenta);
    (Nome_4==ricardo, Idade_4==cinquenta);
    (Nome_5==ricardo, Idade_5==cinquenta)
     ),

	/*• Tiago esta exatamente a esquerda do analista de 35 anos.*/
    (	
        Idade_2 == trintaEcinco, Nome_1 == tiago;
        Idade_3 == trintaEcinco, Nome_2 == tiago;
        Idade_4 == trintaEcinco, Nome_3 == tiago;
        Idade_5 == trintaEcinco, Nome_4 == tiago
    ),

 
    
	/*O homem mais velho esta em algum lugar a direita do homem de colete Verde.*/
	(   Colete_1 == verde, (Idade_2 == cinquenta ; Idade_3 == cinquenta ; Idade_4 == cinquenta ; Idade_5 == cinquenta);
    	Colete_2 == verde, (Idade_3 == cinquenta ; Idade_4 == cinquenta ; Idade_5 == cinquenta);
    	Colete_3 == verde, (Idade_4 == cinquenta ; Idade_5 == cinquenta);
    	Colete_4 == verde, Idade_5 == cinquenta
    ),
    
	/*O homem de 45 anos esta ao lado do homem de Verde.*/
	(
        Colete_1 == verde, Idade_2 == quarentaEcinco;
    	Colete_2 == verde, (Idade_1 == quarentaEcinco ; Idade_3 == quarentaEcinco);
        Colete_3 == verde, (Idade_2 == quarentaEcinco ; Idade_4 == quarentaEcinco);
        Colete_4 == verde, (Idade_3 == quarentaEcinco ; Idade_5 == quarentaEcinco);
        Colete_5 == verde, (Idade_4 == quarentaEcinco)
	),

	/*O homem de Azul está em algum lugar entre o Bruce e o homem de 35 anos, nessa ordem.*/
    (
    	Nome_1 == bruce, Colete_2 == azul, (Idade_3 == trintaEcinco ; Idade_4 == trintaEcinco ; Idade_5 == trintaEcinco);
    	Nome_1 == bruce, Colete_3 == azul, (Idade_4 == trintaEcinco ; Idade_5 == trintaEcinco);
    	Nome_1 == bruce, Colete_4 == azul, Idade_5 == trintaEcinco;
    	Nome_2 == bruce, Colete_3 == azul, (Idade_4 == trintaEcinco ; Idade_5 == trintaEcinco);
    	Nome_2 == bruce, Colete_4 == azul, Idade_5 == trintaEcinco;
        Nome_3 == bruce, Colete_4 == azul, Idade_5 == trintaEcinco
	).
    
        

/* Dados */
nome(bruce).
nome(tiago).
nome(vicente).
nome(felipe).
nome(ricardo).

idade(trinta).
idade(trintaEcinco).
idade(quarenta).
idade(quarentaEcinco).
idade(cinquenta).

colete(azul).
colete(branco).
colete(verde).
colete(amarelo).
colete(vermelho).

segmento(energiaEletrica).
segmento(papelCelulose).
segmento(bancos).
segmento(educacao).
segmento(medicamentos).

corretora(rcInvestimentos).
corretora(brainInvestimentos).
corretora(cucaynvest).
corretora(cucaPactual).
corretora(cerebrolCorretora).

retorno(20).
retorno(30).
retorno(40).
retorno(50).
retorno(60).

/* Definição alldifferent */
alldifferent([]).
alldifferent([H|T]) :-
    not(member(H, T)),
    alldifferent(T).

imprime_lista([]):-

nl,
write('\n Finalizando a impressão \n').
imprime_lista([H|T]):-
    nl,
write('\nInvest |  \n'),
write(H),
imprime_lista(T).
