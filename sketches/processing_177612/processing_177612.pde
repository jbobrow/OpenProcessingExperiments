
/*

most simple way to make a simulation of a planet running in a ellipse
using sine and cosine

You can now see how the ellipse is made from the waves on the two axes

with you mouse position, you can make the circle into an ellips

Beam 2014, for the lecture on OPEN SOURCE ASTRONOMY

*/

int x = 0;
int y = 0;

int mx, my;

int radius = 100;

void setup() {

  size(360, 360);

  mx = width/2;
  my = height/2;
  
  stroke(0);
}


void draw() {
  
    fill(0, 10);
  rect(0, 0, width, height);
  
    fill(255);
  stroke(255);

  //background(0);
  
  float myTimeInFloat = millis()/1000.0;
  x = int ( mx + radius*(mouseX -  width/2.0)/width*2.0 * sin (myTimeInFloat));
  y = int(  my + radius*(mouseY -  width/2.0)/width*2.0  * cos ( myTimeInFloat));
  ellipse(x, y, 10, 10);
  
  ellipse(10, y, 10, 10);
  ellipse(x, 10, 10, 10);
  
  line ( 10, y, x,y);
   line ( x, 10,x,y);
}

void keyPressed(){
  background(100);
}


