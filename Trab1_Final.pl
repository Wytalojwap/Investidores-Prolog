main :-
modelo([A1,A2,A3,A4,A5]),
imprime_lista([A1,A2,A3,A4,A5]),
fail.
main :-
true.
modelo([
    (Nome_1, Cavalo_1, Camiseta_1, Estado_1, Altura_1, Peso_1),
    (Nome_2, Cavalo_2, Camiseta_2, Estado_2, Altura_2, Peso_2),
    (Nome_3, Cavalo_3, Camiseta_3, Estado_3, Altura_3, Peso_3),
    (Nome_4, Cavalo_4, Camiseta_4, Estado_4, Altura_4, Peso_4),
    (Nome_5, Cavalo_5, Camiseta_5, Estado_5, Altura_5, Peso_5)
]):-
    
    /* NOMES */
	nome(Nome_1),
	nome(Nome_2),
	nome(Nome_3),
	nome(Nome_4),
	nome(Nome_5),
    
    /*Belchior está em uma das pontas.*/
    (   Nome_1 == belchior;
    	Nome_5 == belchior
	),

    /*Gerson está exatamente à direita de Itamar*/
	(   Nome_1 == itamar, Nome_2 == gerson;
		Nome_2 == itamar, Nome_3 == gerson;
		Nome_3 == itamar, Nome_4 == gerson;
		Nome_4 == itamar, Nome_5 == gerson
	),

    
    alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
    
    /* CAVALOS */
    cavalo(Cavalo_1),
    cavalo(Cavalo_2),
    cavalo(Cavalo_3),
    cavalo(Cavalo_4),
    cavalo(Cavalo_5),
    
    /*Na terceira posição está o jóquei do cavalo ozzy*/
    (   Cavalo_3 == ozzy
	),
    
	/*O jóquei do cavalo Marvin está na primeira posição*/
    (   Cavalo_1 == marvin
    ),
    
    alldifferent([Cavalo_1, Cavalo_2, Cavalo_3, Cavalo_4, Cavalo_5]),
   
    /*Itamar está exatamente à esquerda do jóquei do cavalo Gordon*/
	(   Nome_1 == itamar, Cavalo_2 == gordon;
    	Nome_2 == itamar, Cavalo_3 == gordon;
    	Nome_3 == itamar, Cavalo_4 == gordon;
    	Nome_4 == itamar, Cavalo_5 == gordon
	),
    
	
    /* CAMISETAS */
    camiseta(Camiseta_1),
    camiseta(Camiseta_2),
    camiseta(Camiseta_3),
    camiseta(Camiseta_4),
    camiseta(Camiseta_5),
    
    alldifferent([Camiseta_1, Camiseta_2, Camiseta_3, Camiseta_4, Camiseta_5]),
    
    /*O jóquei do cavalo Apolo está em algum lugar à direita do jóquei de camiseta Vermelha*/
	(   Camiseta_1 == vermelha, (Cavalo_2 == apolo ; Cavalo_3 == apolo ; Cavalo_4 == apolo ; Cavalo_5 == apolo);
    	Camiseta_2 == vermelha, (Cavalo_3 == apolo ; Cavalo_4 == apolo ; Cavalo_5 == apolo);
    	Camiseta_3 == vermelha, (Cavalo_4 == apolo ; Cavalo_5 == apolo);
    	Camiseta_4 == vermelha, Cavalo_5 == apolo
    ),
    
    /*ESTADOS*/
    estado(Estado_1),
	estado(Estado_2),
	estado(Estado_3),
	estado(Estado_4),
	estado(Estado_5),
    
    /*Na segunda posição está o jóquei de Goiás*/
    (   Estado_2 == goias
	),
    
    alldifferent([Estado_1, Estado_2, Estado_3, Estado_4, Estado_5]),  
    
	/*O jóquei de camiseta Verde está em algum lugar à esquerda do jóquei do Ceará*/
	(	
    	Estado_2 == ceara, Camiseta_1 == verde;
    	Estado_3 == ceara, (Camiseta_1 == verde ; Camiseta_2 == verde);
    	Estado_4 == ceara, (Camiseta_1 == verde ; Camiseta_2 == verde ; Camiseta_3 == verde);
    	Estado_5 == ceara, (Camiseta_1 == verde ; Camiseta_2 == verde ; Camiseta_3 == verde ; Camiseta_4 == verde)
	),
    
    /*O homem de camiseta Verde está ao lado do homem do Paraná*/
	(
        Estado_1 == parana, Camiseta_2 == verde;
    	Estado_2 == parana, (Camiseta_1 == verde ; Camiseta_3 == verde);
        Estado_3 == parana, (Camiseta_2 == verde ; Camiseta_4 == verde);
        Estado_4 == parana, (Camiseta_3 == verde ; Camiseta_5 == verde);
        Estado_5 == parana, (Camiseta_4 == verde)
	),
    
    /*O jóquei de Amarelo está em algum lugar entre o jóquei do Amapá e o Belchior, nessa ordem.*/
    (
    	Estado_1 == amapa, Camiseta_2 == amarela, (Nome_3 == belchior ; Nome_4 == belchior ; Nome_5 == belchior);
    	Estado_1 == amapa, Camiseta_3 == amarela, (Nome_4 == belchior ; Nome_5 == belchior);
    	Estado_1 == amapa, Camiseta_4 == amarela, Nome_5 == belchior;
    	Estado_2 == amapa, Camiseta_3 == amarela, (Nome_4 == belchior ; Nome_5 == belchior);
    	Estado_2 == amapa, Camiseta_4 == amarela, Nome_5 == belchior;
        Estado_3 == amapa, Camiseta_4 == amarela, Nome_5 == belchior
	),
    
    /*ALTURAS*/
	altura(Altura_1),
    altura(Altura_2),
    altura(Altura_3),
    altura(Altura_4),
    altura(Altura_5),

	alldifferent([Altura_1, Altura_2, Altura_3, Altura_4, Altura_5]),

	/*Ronaldo está ao lado do homem de 1,62m.*/
	(	
    	Nome_1 == ronaldo, Altura_2 == 1.62; 
        Nome_2 == ronaldo, (Altura_1 == 1.62 ; Altura_3 == 1.62);
        Nome_3 == ronaldo, (Altura_2 == 1.62 ; Altura_4 == 1.62);
        Nome_4 == ronaldo, (Altura_3 == 1.62 ; Altura_5 == 1.62);
        Nome_5 == ronaldo, Altura_4 == 1.62
	),
    
/*Ronaldo está ao lado do jóquei de 1,54m.*/
	( 
        Nome_1 == ronaldo, Altura_2 == 1.54;
        Nome_2 == ronaldo, (Altura_1 == 1.54 ; Altura_3 == 1.54);
        Nome_3 == ronaldo, (Altura_2 == 1.54 ; Altura_4 == 1.54);
        Nome_4 == ronaldo, (Altura_3 == 1.54 ; Altura_5 == 1.54);
        Nome_5 == ronaldo, Altura_4 == 1.54
	),

	/*O homem de 1,58m está exatamente à direita do jóquei que nasceu na região Norte.*/
    (	Estado_1 == amapa, Altura_2 == 1.58;
        Estado_2 == amapa, Altura_3 == 1.58;
        Estado_3 == amapa, Altura_4 == 1.58;
        Estado_4 == amapa, Altura_5 == 1.58
	),

    /*O jóquei de 1,58m está exatamente à esquerda do jóquei de Santa Catarina.*/
    (	
    	Estado_2 == santa_catarina, Altura_1 == 1.58;
    	Estado_3 == santa_catarina, Altura_2 == 1.58;
    	Estado_4 == santa_catarina, Altura_3 == 1.58;
    	Estado_5 == santa_catarina, Altura_4 == 1.58
    ),
    
    /*O homem que nasceu no Paraná está ao lado do jóquei de 1,54m.*/
	(
        Estado_1 == parana, Altura_2 == 1.54;
        Estado_2 == parana, (Altura_1 == 1.54 ; Altura_3 == 1.54);
        Estado_3 == parana, (Altura_2 == 1.54 ; Altura_4 == 1.54);
        Estado_4 == parana, (Altura_3 == 1.54 ; Altura_5 == 1.54);
        Estado_5 == parana, Altura_4 == 1.54
	),
    
    
    /*O jóquei de 1,54 está em algum lugar entre o jóquei de Goiás e o Jóquei mais baixo, nessa ordem.*/
	(
    	Estado_1 == goias, Altura_2 == 1.54, (Altura_3 == 1.50 ; Altura_4 == 1.50 ; Altura_5 == 1.50);
    	Estado_1 == goias, Altura_3 == 1.54, (Altura_4 == 1.50 ; Altura_5 == 1.50);
    	Estado_1 == goias, Altura_4 == 1.54, Altura_5 == 1.50;
    	Estado_2 == goias, Altura_3 == 1.54, (Altura_4 == 1.50 ; Altura_5 == 1.50);
    	Estado_2 == goias, Altura_4 == 1.54, Altura_5 == 1.50;
        Estado_3 == goias, Altura_4 == 1.54, Altura_5 == 1.50
	),
    
    /*O homem mais alto está em algum lugar entre o homem de Branco e o homem de 1.5m de altura, nessa ordem.*/
	(
        Camiseta_1 == branca, Altura_2 == 1.66, (Altura_3 == 1.50 ; Altura_4 == 1.50 ; Altura_5 == 1.50);
    	Camiseta_1 == branca, Altura_3 == 1.66, (Altura_4 == 1.50 ; Altura_5 == 1.50);
    	Camiseta_1 == branca, Altura_4 == 1.66, Altura_5 == 1.50;
    	Camiseta_2 == branca, Altura_3 == 1.66, (Altura_4 == 1.50 ; Altura_5 == 1.50);
    	Camiseta_2 == branca, Altura_4 == 1.66, Altura_5 == 1.50;
        Camiseta_3 == branca, Altura_4 == 1.66, Altura_5 == 1.50
	),
    
    /*PESOS*/
    peso(Peso_1),
    peso(Peso_2),
    peso(Peso_3),
    peso(Peso_4),
    peso(Peso_5),

	alldifferent([Peso_1, Peso_2, Peso_3, Peso_4, Peso_5]),
  
    /*O jóquei de camiseta Vermelha está em algum lugar à esquerda do jóquei de 50kg.*/
	(
        Camiseta_1 == vermelha, (Peso_2 == 50 ; Peso_3 == 50 ; Peso_4 == 50 ; Peso_5 == 50);
        Camiseta_2 == vermelha, (Peso_3 == 50 ; Peso_4 == 50 ; Peso_5 == 50);
        Camiseta_3 == vermelha, (Peso_4 == 50 ; Peso_5 == 50);
        Camiseta_4 == vermelha, Peso_5 == 50
    ),
    
    /*O jóquei de 51kg está exatamente à direita do jóquei de camiseta Amarela.*/
	(   Camiseta_1 = amarela, Peso_2 = 51;
    	Camiseta_2 = amarela, Peso_3 = 51;
    	Camiseta_3 = amarela, Peso_4 = 51;	
    	Camiseta_4 = amarela, Peso_5 = 51
	),
    
    /*O jóquei de camiseta Amarela está em algum lugar à esquerda do jóquei de 52kg.*/
    (   
        Camiseta_1 == amarela, (Peso_2 == 52 ; Peso_3 == 52 ; Peso_4 == 52 ; Peso_5 == 52);
        Camiseta_2 == amarela, (Peso_3 == 52 ; Peso_4 == 52 ; Peso_5 == 52);
        Camiseta_3 == amarela, (Peso_4 == 52 ; Peso_5 == 52);
        Camiseta_4 == amarela, Peso_5 == 52
    ),
    
        /*O jóquei de 53kg está ao lado do jóquei de camiseta Amarela.*/
	(   
        Peso_1 == 53, Camiseta_2 == amarela;
        Peso_2 == 53, (Camiseta_1 == amarela ; Camiseta_3 == amarela);
        Peso_3 == 53, (Camiseta_2 == amarela ; Camiseta_4 == amarela);
        Peso_4 == 53, (Camiseta_3 == amarela ; Camiseta_5 == amarela);
        Peso_5 == 53, Camiseta_4 == amarela
	).

/******Dados******/

/*CAMISETAS*/
camiseta(amarela).
camiseta(azul).
camiseta(branca).
camiseta(verde).
camiseta(vermelha).

/*NOMES*/
nome(amauri).
nome(belchior).
nome(gerson).
nome(itamar).
nome(ronaldo).

/*PESOS*/
peso(49).
peso(50).
peso(51).
peso(52).
peso(53).

/*ALTURAS*/
altura(1.50).
altura(1.54).
altura(1.58).
altura(1.62).
altura(1.66).

/*ESTADOS*/
estado(amapa).
estado(ceara).
estado(goias).
estado(parana).
estado(santa_catarina).

/*CAVALOS*/
cavalo(apolo).
cavalo(gordon).
cavalo(marvin).
cavalo(ozzy).
cavalo(tempestade).


/*Definição alldifferent*/
alldifferent([]).
alldifferent([H|T]):- not(member(H,T)),
alldifferent(T).

imprime_lista([]):-

nl,
write('\n Finalizando a impressão \n').
imprime_lista([H|T]):-
    nl,
write('\nJÓQUEI |  \n'),
write(H),
imprime_lista(T).


