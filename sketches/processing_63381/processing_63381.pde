
/*Erstelle einen Zeichenautomaten. Verwende Variablen um eine 
 einfache Form mit RGB Farbe zu zeichnen. Experimentiere mit 
 der random() Funktion, um Position, Grösse und/oder Farbe zu 
 ändern.*/

float r;
float g;
float b;
float a;
float r2;
float g2;
float b2;

float x;
float y1;
float y2;
float width;
float height;

void setup() {
  frameRate(25);
  size(700, 500);
  background(255);
  colorMode (RGB, 255, 255, 255, 100);
}

void draw() {
  smooth();
  r = random(200, 250);
  g = random(200, 250);
  b = random(200, 250);
  a = random(60);
  r2 = random(200, 250);
  g2 = random(200, 250);
  b2 = random(200, 250);

  x = random (0, 700);
  y1 = random (0, 136);
  y2 = random (344, 500);
  width = random(10, 50);
  height = random(10, 50);

  stroke(r, g, b, a);
  strokeWeight(1);
  fill(r2, g2, b2, a);
  ellipse(x, y1, width, height);
  fill(r, g, b, a);
  rect(x, y2, width, height);
  strokeWeight(width/10);
  line(x, 166, x, 334);
}

void keyPressed() {
  background(255);
}

/*void mousePressed(){
  saveFrame("thumbnail.png");
}*/


