
// Trabalho de Tandara Bazzoni para ComputaÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o I em Arquitetura e Urbanismo UTFPR em 18/03/14
//O trabalho Quase Pacman de Tandara Bazzoni estÃ�ï¿½Ã�Â¡ licenciado com uma LicenÃ�ï¿½Ã�Â§a Creative Commons - AtribuiÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o 4.0 Internacional.
/* Este trabalho estÃ�ï¿½Ã�Â¡ licenciado sob uma LicenÃ�ï¿½Ã�Â§a Creative Commons AtribuiÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o  4.0 Internacional. Para ver uma cÃ�ï¿½Ã�Â³pia desta licenÃ�ï¿½Ã�Â§a, visite http://creativecommons.org/licenses/by/4.0/.
*/
//pacman *referÃ�ï¿½Ã�Âªncia "pac man con ojo" de Fernanda Reygadas - http://www.openprocessing.org/sketch/50573

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

void draw() {
  background(0);
  stroke(0, 0, 0);

  // vidas
  float x = random(width);
  float y = random(height);
  fill (255, 243, 75);
  ellipse(600, 6, 10, 10);
  ellipse (x, 120, 10, 10);
  ellipse (10, 200, 10, 10);
  ellipse (x, 300, 10, 10);
  ellipse (x, 500, 10, 10);
  ellipse (x, 600, 10, 10);
  ellipse (300, y, 10, 10);
  ellipse (600, y, 10, 10);
  ellipse (x, 700, 10, 10);

  // pacman modificado
  arc (mouseX, mouseY, 55, 55, inicio1, fin1);
  fill (0, 0, 0);
  ellipse(mouseX+27, mouseY+7, 3, 4);

  temp=inicio1;
  inicio1=inicio2;
  inicio2=temp;

  temp=fin1;
  fin1=fin2;
  fin2=temp;

  // caminho
  fill (0, 0, 0);
  stroke (28, 93, 229);
  rect (10, 50, 300, 20, 7);
  rect (70, 150, 300, 20, 7);
  rect (500, 250, 100, 20, 7);
  rect (690, 90, 20, 130, 7);
  rect ( 100, 350, 200, 20, 7);
  rect (500, 70, 350, 20, 7); 
  rect (600, 670, 250, 20, 7);
  rect (700, 300, 20, 250, 7);
  rect (300, 200, 20, 70, 7);
  rect (150, 500, 20, 170, 7);
  rect (400, 400, 20, 180, 7);
  rect (500, 200, 20, 120, 7);
  rect (790, 570, 20, 100, 7);
  rect (600, 400, 100, 20, 7);
  rect (300, 470, 100, 20, 7);
  rect (720, 460, 105, 20, 7);
  rect (90, 670, 199, 20, 7);

  //monstro c/ vida 1
  smooth();
  stroke (0, 0, 0);
  if ((y<75)||(y>=340))
    fill (250, 35, 35);
  ellipse (50, 498, 50, 50);
  fill (0, 0, 0);
  ellipse ( 70, 510, 5, 6);
  triangle( 80, 525, 100, 500, 100, 540);

  //monstro c/ vida 2
  smooth();
  stroke (0, 0, 0);
  if ((y<75)||(y>=340))
    fill (40, 209, 61);
  ellipse(70, 198, 50, 50);
  fill (0, 0, 0);
  ellipse ( 90, 210, 5, 6);
  triangle (95, 225, 120, 210, 120, 240);

  //monstro c/ vida 3
  smooth();
  stroke (0, 0, 0);
  if ((y<75)||(y>=340))
    fill (51, 235, 240);
  ellipse(800, 130, 50, 50);
  fill (0, 0, 0);
  ellipse (820, 140, 5, 6);
 triangle (830, 155, 850, 140, 850, 180);  
 }
