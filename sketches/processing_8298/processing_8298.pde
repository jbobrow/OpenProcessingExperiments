
// the rose, animated version
// schien@mail.ncku.edu.tw

void setup() {
  size(400, 400);
  stroke(150, 150, 60);
  noFill();
  strokeWeight(0.5);
  smooth();
}

float x, y, k=3.0;
int counter = 0;

void draw() {
  counter++;
  background(51);
  beginShape();
  for (int theta=0; theta<counter; theta+=1) {
    x = 200.0* sin(k*theta*PI/180.0) * cos(theta*PI/180.0);
    y = 200.0* sin(k*theta*PI/180.0) * sin(theta*PI/180.0);
    vertex((int)(x+width*2/3), (int)(height/2-y));
  } 
  endShape();
  
  if (keyPressed) {
    saveFrame("rose.png");
  }
}

void mouseReleased() {
  counter = 0;
  k = (float)mouseX/(float)mouseY;
}


