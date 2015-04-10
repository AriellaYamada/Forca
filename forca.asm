; -------- JOGO DA FORCA ---------- ;


;_____________________ TABELA DE CORES _______________________

; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde						0010 0000
; 768 oliva						0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo						0101 0000
; 1536 teal						0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima						1010 0000
; 2816 amarelo						1011 0000
; 3072 azul						1100 0000
; 3328 rosa						1101 0000
; 3584 aqua						1110 0000
; 3840 branco						1111 0000

jmp main

str1: string "Digite uma palavra:"
str2: var #30
;str3: string "Letra ja foi digitada...Digite outra!"
;str4: string "Se fodeu!!"
;str5: string "Parabens!! Voce nao se fodeu!!"
;str6: string "Jogar novamente? <s/n>"
;str7: var #24
;str8: var #30

;_________________________ PALAVRA __________________________

tryList : var #27 ;Armazena as lestras da palavra digitada
tryListSize : var #1 ;Armazena o tamanho da palavra

;______________________ DESENHO FORCA ________________________


tela0 	: string " ____________________________________   "
tela1 	: string "|   _________________________________|  "
tela2 	: string "|  |                   | |              "
tela3 	: string "|  |                   | |              "
tela4 	: string "|  |            ___    |_|     ___      "
tela5 	: string "|  |           |___|  |   |   |___|     "
tela6 	: string "|  |            | |   |___|    / /      "
tela7 	: string "|  |            | |____| |____/ /       "
tela8 	: string "|  |            |______    ____/        "
tela9 	: string "|  |                  |   |             "
tela10 	: string "|  |                  |___|             "
tela11 	: string "|  |                  | _ |             "
tela12 	: string "|  |                 / / | |            "
tela13 	: string "|  |                / /  | |            "
tela14 	: string "|  |              _/_/   |_|_           "
tela15 	: string "|  |___________  |___|   |___|  ______  "
tela16 	: string "|   __________()XXXXXXXXXXXXXXXXX__   | "
tela17 	: string "|  |                               |  | "
tela18 	: string "|  |                               |  | "
tela19 	: string "|  |                               |  | "
tela20 	: string "|  |                               |  | "
tela21 	: string "|  |                               |  | "
tela22 	: string "|  |                               |  | "
tela23 	: string "|__|                               |__| "
tela24 	: string "                                        "
tela25 	: string "                                        "
tela26 	: string "                                        "
tela27 	: string "                                        "
tela28 	: string "                                        "
tela29	: string "                                        "


;___________________ PROGRAMA PRINCIPAL ______________________


main:

	loadn r0, #0
									
	loadn r1, #str1

	loadn r3, #0

	call ImprimeString

	loadn r5, #19
	
	loadn r6, #str2 

	call LeString

	loadn r0, #40
	
	loadn r1, #str2

	call ImprimeString

	loadn r0, #0

	loadn r1, #tela0			 

	loadn r2, #0
	
	call ImprimeTela

	call ImprimeSombra


	halt				  


;___________________ IMPRIME TRACINHOS ______________________


ImprimeSombra:

	push r0

	push r1

	push r2

	push r7 ;tamanho da palavra digitada

	loadn r0, #1000 ;Posicao que vai imprimir

	loadn r1, #'_'

	loadn r2, #0

	LoopSombra:

		cmp r2, r7

		jeg FimSombra

		outchar r1, r0

		inc r0

		inc r2

		jmp LoopSombra

	FimSombra:

		pop r7

		pop r2

		pop r1

		pop r0

		rts



		
;______________________ IMPRIME TELA ________________________
		

ImprimeTela:					
	
	call ApagaTela

	push r0				

	push r1
					
	push r2

	push r3				

	push r4		
	
	push r5 
	
	loadn r3, #1199

	loadn r5, #'\0'

LoopImprime:	
	
	loadi r4, r1
	
	cmp r4, r3

	jeg SaiImprime
 
	cmp r4, r5

	jeq IncR1	

	outchar r4, r0

	inc r0

	inc r1

	jmp LoopImprime

IncR1:

	inc r1

	jmp LoopImprime


SaiImprime:	

	pop r5
	pop r4				
	pop r3
	pop r2
	pop r1
	pop r0

	rts


;______________________ APAGA TELA ___________________________


ApagaTela:

	push r0
	push r1

	loadn r0, #1199
	loadn r1, #' '

LoopApagarTela:

	outchar r1, r0
	
	dec r0
	
	jnz LoopApagarTela

	outchar r1, r0
		
	pop r1
	
	pop r0

	rts

;______________________ APAGA PALAVRA ___________________________


ApagaPalavra:

	push r0
	push r1
	push r2

	loadn r0, #979
	loadn r1, #' '
	loadn r2, #1199

LoopApagarPalavra:

	outchar r1, r0
	
	inc r0
	
	cmp r0, r2

	jne LoopApagarPalavra

	outchar r1, r0
		
	pop r1
	
	pop r0

	pop r2

	rts

;_________________________LE STRING______________________________


LeString:

	push r0
	
	push r1
	
	push r2
	
	push r5
	
	push r6

	push r7

	loadn r1, #255 
	
	loadn r2, #13

	loadn r7, #0

LeTecla:
	
	inchar r0 

	cmp r0, r1 

	jeq LeTecla 

	outchar r0, r5 	
	
	cmp r0, r2

	jeq FimLeString

	storei r6, r0 

	static palavra + r7, r0 ;Armazena no vector as 

	inc r7 ;armazena o tamanho da palavra digitada
	
	inc r5 

	inc r6 

	jmp LeTecla

FimLeString:

	loadn r0, #'\0'
	
	storei r6, r0

	pop r7

	pop r6
	
	pop r5
	
	pop r2
	
	pop r1
	
	pop r0
	
	rts


;________________________IMPRIME STRING__________________________


ImprimeString:
	
	push r0

	push r1

	push r2  

	push r3  

	loadn r2, #'\0'

LoopPercorre:
	
	loadi r3, r1  
	
	cmp r3, r2  		
	
	jeq SaiLoop  

	outchar r3, r0
	
	inc r0

	inc r1

	jmp LoopPercorre

SaiLoop:
	
	pop r3
	
	pop r2

	pop r1

	pop r0

	rts