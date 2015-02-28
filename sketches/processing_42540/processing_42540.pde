
String txt = "LA LO";
 
int y = 0;
 
PFont carattere;
 
void setup() {
  size(500, 200);
  smooth();
  carattere = loadFont("HelveticaNeue-20.vlw");
}
 
void draw() {
  background(0);
  fill(255,60);
  textFont(carattere, 20);
  text(txt, 65, y);
  y = y +1;
 
 
  if (y>200) {
  text(txt, 65, y);
   y=0;
  }
}


