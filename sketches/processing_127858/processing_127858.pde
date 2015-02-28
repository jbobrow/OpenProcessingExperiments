
boolean down;
color col;

void setup() {
  size(920,450);
  background(0);
  down = false;
  noStroke();
  smooth();
  col = color((int)random(255), (int)random(255), (int)random(255));
}

void draw() {
  if(down)
    crayonStroke(pmouseX, pmouseY, mouseX, mouseY, col);
}

void mousePressed() {
  down = true;
}

void mouseReleased() {
  col = color((int)random(255), (int)random(255), (int)random(255));
  down = false;
}

void keyPressed() {
  if (key == ' ')
    background(255);
}

void crayonStroke(float x1, float y1, float x2, float y2, color c) {
  int a = (c >> 24) & 0xFF;
  int r = (c >> 16) & 0xFF;
  int g = (c >> 8) & 0xFF;
  int b = c & 0xFF;
  float pressure = 2*dist(x1, y1, x2, y2);
  for(int count = 0; count < pressure; count++) {
    fill(r+random(-10, 10), g+random(-10, 10), b+random(-10, 10), random(100, 200));
    ellipse(x1+count*(x2-x1)/pressure+random(-2-constrain(pressure/20, 0, 4), 2+constrain(pressure/20, 0, 4)),
    y1+count*(y2-y1)/pressure+random(-2-constrain(pressure/20, 0, 4), 2+constrain(pressure/20, 0, 4)), 
    random(0.5, 13), 
    random(0.5, 13));
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
 
