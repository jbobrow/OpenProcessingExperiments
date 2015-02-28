
void setup() {
  size(500,500);
  noStroke();
  smooth();
}

void draw() { 
  ellipse (mouseX,mouseY,20,30);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0);
  }

  if (mouseButton == RIGHT) {
    fill(255);
  } 

  if (mouseButton==CENTER) {
    fill(126);
  }
}

                
                
