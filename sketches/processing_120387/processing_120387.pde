
/**************************************************************
    Proposta: Halloween 
    Propósito: uso de 2D Primitives, bezier, estruturas de 
               repetição, color, keyPressed, noCursor, PImage, 
               void setup, void draw.

    Ultima Revisao: 08/11/13
**************************************************************/

PImage bruxa; 
PImage fantasma; 
PImage esqueletos;
PImage morcego;
PImage vampira;
PImage boo;
PImage gato;
PImage abobora;
PImage arvore;
PImage tumulos;


void setup () {
  size (945,600);
  textSize (50);
  bruxa = loadImage("bruxa.png");
  fantasma = loadImage("fantasma.gif");
  esqueletos = loadImage("esqueletos.png");
  morcego = loadImage("morcego.png");
  vampira = loadImage("vampira.png");
  boo = loadImage("boo.png");
  gato = loadImage("gato.png");
  abobora = loadImage("abobora.png");
  arvore = loadImage("arvore.png");
  tumulos = loadImage("tumulos.png");
  
  }
   
 void draw () {
   
  background (4,30,129); /* fundo */
  fill (0); /* preenchimento_castelo */
  stroke (0); /* cor da linha_cerca */
  
  /* castelo */
  
  rect (30,550,500,50,15,15,0,0); /* base_castelo */
  rect (80,480,400,70); /* parede */
  rect (25,350,500,130,10); /* parede */
  rect (80,260,80,90); /* torre_esquerda */
  rect (220,260,120,90); /* torre_meio */
  rect (400,260,80,90); /* torre_direita */
  triangle (78,250,118,200,158,250); /* telhado_torre_esq */
  bezier (220,260,240,170,320,170,340,260); /* telhado_torre_meio */
  triangle (398,250,438,200,478,250); /* telhado_torre_dir */
    
  /* tumulos e cerca */
  
  image(tumulos, 770, 448,150,150); 
  line(555, 550, 1080, 550); /* cerca */
  strokeWeight (14);
    for (int x = 580; x <=945; x +=60)
     line (x,530,x,600); /* cerca */
     
  /* janelas e porta */
    
  fill (255);
  noStroke (); /* desativa_linha preta */
  ellipse (282,290,65,65); /* janela redonda */
  bezier (250,600,240,460,320,460,310,600); /* porta */
   
 for (int x = 108; x <=470; x +=320) 
    rect (x,270,30,60,15); /* janelas ovais_cima */
          
 for (int x = 107; x <=470; x +=160) 
    rect (x,380,30,90,15); /* janelas ovais_meio */
 
 for (int x = 160; x <=470; x +=250) 
    ellipse (x,545,40,40); /* janelas redondas */
    
 for (int x = 60; x <=170; x +=50) 
     image (abobora,x,565,60,40); 
    
  /* texto */
    
  textSize (60); 
  text ("Happy Halloween!!!", 35, 110);

  /* Imagens */

  image(arvore, 650, 210,390,390);

  image(bruxa, 740, 40); 
  
  image (esqueletos, 535,355);
 
  image (morcego, 650,145,40,40); 
  image (morcego, 620,165,50,50); 
  image (morcego, 570,185,80,80); 
  
  noCursor(); // esconde o cursor
    image (fantasma, mouseX, mouseY, 80,80); 
    
   if (keyPressed == true) 
   {
     image(vampira,255,270, 55, 55); 
     image(boo,350,472, 130, 130); 
     image (gato, 255,547,55,55);   
   }
}



  
  
  
  
    
  




