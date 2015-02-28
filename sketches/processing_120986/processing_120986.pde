
/**************************************************************
 Proposta:  Halloween - animacao 
 Propósito: uso de 2D Primitives, arc, color, keyPressed,
            noCursor, mouseMoved, PImage, random, text, 
            float, smooth, noStroke, void setup, void draw.

Ultima Revisao: 17/11/13
**************************************************************/

PImage fundo,grito,morcego,abobora;

float y=300.0, x=420; /* posicao inicial do texto */

void setup () {
  size (400,390);
  smooth (); /* suavizacao */
  noStroke();
  textSize(40); 
  fundo = loadImage("cemetery.png");
  grito = loadImage("boo.png");
  morcego = loadImage("morcego.png");
  abobora = loadImage("pumpkin.png");
}

void draw () {
  
  image(fundo, 0, 0, 400, 390); 
  
  noStroke();
  fill(255); /* preenchimento do fantasma - cor branca */
  ellipse (120, 250, 130, 60); /* braco esquerdo */
  ellipse (280, 250, 130, 60); /* braco direito */
  rect(150, 250, 100, 130, 12, 12, 12, 12); /* corpo do fantasma */
  ellipse (200, 200, 80, 150); /* cabeca */
  stroke(0); /* para contorno dos olhos */
  ellipse (185, 180, 15, 15); /* olho esquerdo */
  ellipse (215, 180, 15, 15); /* olho direito */
  
 /* o texto inicia na borda direita da janela e sera decrementado, 
    ao ultrapassar o limite estabelecido na condicao, o texto retorna
    a posicao inicial x */
 
  text ("HAPPY HALLOWEEN!!!", x, 55);
  x-=1;
  if (x<-420){
    x=+420;
  }
  
  fill (0); /* para preenchimento de cor preta */
  ellipse (187, 180, 5, 5); /* pupila esquerda */
  ellipse (212, 180, 5, 5); /* pupila direita */
  ellipse(200, 220, 15, 30); /* boca */
  
  noFill(); /* tirando o preenchimento dos arcos */
  arc(200, 190, 10, 15, HALF_PI, PI); /* nariz */
  arc(195, 165, 15, 20, HALF_PI, PI); /* sobrancelha esquerda */
  arc(205, 165, 15, 20, 0, HALF_PI); /* sobrancelha direita */
  

  
  noCursor(); // esconde o cursor
  image (morcego, mouseX, mouseY, 80,80); /* animacao do morcego */
  
  if (keyPressed == true) {
      image(grito, 50, 120, 130, 140); /* se true, mostrar grito */
  }
}

  void mouseMoved(){
  image (abobora,300,300,80,80);
  }




