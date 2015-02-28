
// Trabalho de Tandara Bazzoni para Computação I em Arquitetura e Urbanismo UTFPR em 18/03/14
//O trabalho Quase Pacman - Corrigido de Tandara Bazzoni está licenciado com uma Licença Creative Commons - Atribuição 4.0 Internacional.
/* Licença Creative Commons
O trabalho Quase Pacman - Corrigido de Tandara Bazzoni está licenciado com uma Licença Creative Commons - Atribuição 4.0 Internacional.
 Este trabalho está licenciado sob uma Licença Creative Commons Atribuição  4.0 Internacional. Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by/4.0/.
 */

//pacman adaptado de "pac man con ojo" de Fernanda Reygadas - http://www.openprocessing.org/sketch/50573

float inicio1=0.0;
float fin1 = TWO_PI;
float inicio2=0.30;
float fin2=5.61;
float temp=0.0;



void setup () {

  size (900, 900);
  smooth ();
  strokeWeight(2);
  noStroke();
  frameRate(7);
  fill(255, 255, 0);
  ellipseMode(CORNER);
}

char letter = 'a';
int pacx; int pacy;


void keyPressed() {
  letter=key;


  if (key == CODED) {
    switch (keyCode) {
    case UP: 
      pacy -= 10; 
      break;
    case DOWN: 
      pacy += 10; 
      break;
    case LEFT: 
      pacx -= 10; 
      break;
    case RIGHT: 
      pacx += 10; 
      break;
    }
  }

else {

}
}

void vida() {
  float x = random(width);
  float y = random(height);
  fill (255, 243, 75);
  ellipse(x, 6, 10, 10);
  ellipse (x, 120, 10, 10);
  ellipse (10, y, 10, 10);
  ellipse (x, 300, 10, 10);
  ellipse (x, 500, 10, 10);
  ellipse (x, 600, 10, 10);
  ellipse (300, y, 10, 10);
  ellipse (600, y, 10, 10);
  ellipse (x, 700, 10, 10);
}





void draw() {
  background(0);
  stroke(0, 0, 0);


  // vidas
  vida();

  // pacman modificado
  arc (pacx, pacy, 55, 55, inicio1, fin1);
  fill (0, 0, 0);
  ellipse(pacx+27, pacy+7, 3, 4);

  temp=inicio1;
  inicio1=inicio2;
  inicio2=temp;

  temp=fin1;
  fin1=fin2;
  fin2=temp;

  switch(letter) {
  case 'B':
  case 'b':
    fill (255, 255, 0);
    ellipse(pacx+27, pacy+7, 3, 4);
    fill (0, 0, 0);
    arc (pacx, pacy, 55, 55, inicio1, fin1);

    temp=inicio1;
    inicio1=inicio2;
    inicio2=temp;

    temp=fin1;
    fin1=fin2;
    fin2=temp;

    break;
  }
  // caminho
  
  for (int i=0; i < 750; i=i+100) {
  fill (0, 0, 0);
  stroke (28, 93, 229);
  rect (20+i, 60+i, 300, 20, 7);
  rect (20+i, 650+i, 100, 20, 7);
  rect (110+i, 350+i, 30, 200, 7);
rect (510+i, -50+i, 30, 200, 7);


  

  }
  //monstro c/ vida 1
  float x = random(width);
  float y = random(height);
  smooth();
  stroke (0, 0, 0);
  if ((y<75)||(y>=340))
    fill (250, 35, 35);
  ellipse (50, 498, 50, 50);
  fill (0, 0, 0);
  ellipse ( 70, 510, 5, 6);
  triangle( 80, 525, 100, 500, 100, 540);

  //monstro c/ vida 2
  if ((y<75)||(y>=340))
    fill (40, 209, 61);
  ellipse(70, 198, 50, 50);
  fill (0, 0, 0);
  ellipse ( 90, 210, 5, 6);
  triangle (95, 225, 120, 210, 120, 240);

  //monstro c/ vida 3
  if ((y<75)||(y>=340))
    fill (51, 235, 240);
  ellipse(800, 130, 50, 50);
  fill (0, 0, 0);
  ellipse (820, 140, 5, 6);
  triangle (830, 155, 850, 140, 850, 180);


  PFont PT;
  PT = loadFont ("AdobeArabic-Bold-48.vlw");
  textFont (PT);
  fill (255);
  textSize (20);
  text ("HIGHSCORE : 40", 20, 800);
}


