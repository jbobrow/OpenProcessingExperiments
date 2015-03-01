

int xPots;
int yPots;

void setup(){
  background(255,255,0);
  size(800,600);
  smooth();
 }

void draw(){

  xPots=mouseX;
  yPots=mouseY;
  fill(xPots);
  ellipse(xPots,yPots,100,100);
  //println
}


