
/*

most simple way to make a simulation of a planet running in a cricle
using sine and cosine

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
}


void draw() {

  float myTimeInFloat = millis()/1000.0;
  x = int ( mx + radius  * sin (myTimeInFloat));
  y = int(  my + radius * cos ( myTimeInFloat));
  ellipse(x, y, 10, 10);
  
}


