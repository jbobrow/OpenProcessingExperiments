
void setup() {
  size(300, 600, P2D);
  smooth();
  
  background(23);
  stroke(175, 30);

  strokeWeight(10);

  pushMatrix();
    scale(1.1, 1);  // Strech out to the right
    for (int i=0; i<=width; i+=10) {
      line(i,i, width-i, height/2+i);
    }
  popMatrix();
}

void draw() { }

