
/* @pjsfont="Courier New Italic.ttf" ; */
/* @pjs preload="panda.png" ;*/

PImage panda ;
int x = 100 ;
PFont tyyype ;


void setup() {
  size(500,500) ;
  panda = loadImage("panda.png") ;
  tyyype = createFont("Courier New Italic.ttf", 30);
}

void draw() {
  background(255,255,255);
  image(panda, x, 100) ;
  x = x - 1;
  if (x < -400) {
    x = 500;
  }
  fill(0,0,255);
  textFont(tyyype,30);
  text("Ice Skating Panda", x , 50);
}



