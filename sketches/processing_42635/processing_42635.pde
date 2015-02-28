
String txt = "this shoes are made for walking";
int xspeed= 0;
int y= 200;

PFont Arial;
 
void setup() {
  size(400, 400);
  smooth();
  Arial  = loadFont("ArialMT-48.vlw");
}
 
void draw() {  
  background (255);
  fill(245, 180, 255);
  textFont(Arial, 48);
  text(txt, xspeed, y);
 
 xspeed=xspeed-1;
  }

