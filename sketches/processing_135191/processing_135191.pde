

int aumenta = 0;
 void setup() {
  noCursor();
  size(600, 600);
  strokeWeight(4);
  }
void draw() {
  background(200);
  stroke(255,0,50);
  line(0,0,mouseX,mouseY);
  stroke(255,255,50);
  line(width,0,mouseX,mouseY);
  stroke(0,0,255);
  line(width/2,height,mouseX,mouseY);
}

