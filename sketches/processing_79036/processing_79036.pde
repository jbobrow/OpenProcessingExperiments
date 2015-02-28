
//original sketch: http://www.openprocessing.org/sketch/56360//

PFont myFont;

void setup() {
  size(400, 400);
  myFont = createFont("FFScala", 32);
  textFont(myFont);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
}

float x;
float y;
int num = 6;
int counter;
 
 
void draw() {
  background(0, 0, 100);
 
  for (int i = 0; i < num ; i++) {
    pushMatrix();
    translate(width/2+150*sin(y + i), height/2+150*cos(y + i));
    fill(i * 360 / num, 100, 100, 80);
    text("jamie is cool", 5,25 );
    popMatrix();
  }
 
  y += 0.01;
  x += 0.05;
}
 
void mousePressed() { 
  num += 6;
}
 
void keyPressed() {
  background(0,0,100);
  num = 6;
}
