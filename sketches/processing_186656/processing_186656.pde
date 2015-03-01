
// basado en el còdigo http://www.openprocessing.org/sketch/186178//

float ojos=0;
float chispa= random(96, 150);
float x=random(0, width);
float y=random(0, height);
int x1=10;
int x2=50;
int x3=500;
int y1=500;
int y2=30;
int y3=600;

void setup() {
  size (600, 600);
  colorMode(HSB);
  background(195, 255, ojos);
}
void draw() {
  if (x<width/2) 
  {
    x=ojos;
    ojos=ojos+1;
  }
  else {
    x=x-ojos;
    y=y-chispa;
  }
stroke(255);
  line(mouseX, mouseY, x2, y3);
  line(mouseX, mouseY, x3, y2);
  line(mouseX, mouseY, x1, y1);
  fill(50,71,91);
  ellipse(0, 0, ojos, ojos);
  ellipse(600, 600, ojos, ojos);
  ellipse(600, 0, ojos, ojos);
  ellipse(0, 600, ojos, ojos);
}

