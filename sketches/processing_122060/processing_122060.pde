
/**************************************************************
Proposta: Trabalho com funcoes.
Propósito: Funcoes com retorno, PImage, animacao, movimento.

Ultima Revisao: 25/11/13
**************************************************************/

 float dir=1; //direcao da mudança da cor
 float tinto=0; // inicializa em zero
 
 PImage fundo;
 PImage arvore_natal;
 PImage treno;
 
 int a = 436;
 int b = 100;
 int V = 3;
 
 void setup () 
 {
   size (450, 600); 
   fundo = loadImage("fundo.jpg"); 
   arvore_natal = loadImage("arvore2.png");
   treno = loadImage("noel.png");
  
  frameRate(50); //velocidade da animacao
  noStroke(); // desativa traco
  smooth(); // suavizacao
 }
  
 void draw ()
 {
   image(fundo, 0, 0, 800, 600);
   imagem();
   movimento();
 }
 
 void imagem() // modificacao da funcao de Anderson Luiz Krainski
 {
   image(treno, a, b, treno.width/2, treno.height/2);
 }
 
 void movimento() // modificacao da funcao de Anderson Luiz Krainski
 {
   a = a - V;
   if (a <- width)
   {
     a = +600;
   } 
   
   image(arvore_natal, 10, 0, 430, 600); 
   
   bola(214, 136, 0); /* tres parametros, (x, y, cor) */
   bola(245, 208, 0);
   bola(175, 269, 0); 
   bola(255, 313, 0); 
   bola(166, 350, 0); 
   bola(278, 396, 0); 
   bola (83, 447, 0); 
   bola(204, 423, 0); 
   bola(333, 424, 0); 
   
   tinto=tinto+dir*15; //define nova cor e a velocidade da mudança
   if (tinto<0) { //definido como zero
   dir=1;
   }
   if (tinto>190) { //ultrapassando 190, inverte a direcao
   dir=-1;
   }
   fill(255, tinto, 255); //define a cor
   }
   
   void bola(float x, float y, float cor)
   {
     ellipse(x, y, 33, 33);
   }




