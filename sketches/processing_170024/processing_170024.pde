
/* Jesús C González
 Práctica Condicionales
 Caroline DVDvideo
 2014 */

float posY, posX, velX, velY;
float tam, radio;
PImage dvd, caroline; 
float limiteXright, limiteXleft, limiteYtop, limiteYbottom;

void setup () {
  size(850, 600);
  posX=width/3;
  posY=height/4.6;
  velX=1.5;
  velY=1.5;
  tam=50;
  radio= tam/2;
  dvd= loadImage("dvd_video_logoblanco.png");
  caroline= loadImage("carolinee.png");
}

void draw () {
  imageMode(CORNER);
  image (caroline, 0, 0);
  background(caroline);
  imageMode(CENTER);
  image (dvd, posX, posY, tam, radio);

  //actualización pos
  posX=posX+velX;
  posY=posY+velY;

  //definición limites
  println(mouseX, mouseY);
  limiteXright = width/4.6;
  limiteXleft = width/2.185;
  limiteYtop = height/11.1;
  limiteYbottom = height/2.8;
  
  //comprobación limites
  if (posX-radio<limiteXright||posX+radio>limiteXleft) {
    velX=-velX;
    tint(random(255), random(255), random(255));
  }
  if (posY-radio/2<limiteYtop||posY+radio/2>limiteYbottom) {
    velY=-velY;
    tint(random(255), random(255), random(255));
  }

  /* //comprobación posX y posY
   if (posX-radio<0||posX+radio>width) {
   velX=-velX;
   tint(random(255), random(255), random(255));
   }
   if (posY-radio/2<0||posY+radio/2>height) {
   velY=-velY;
   tint(random(255), random(255), random(255));
   }
   */


}



