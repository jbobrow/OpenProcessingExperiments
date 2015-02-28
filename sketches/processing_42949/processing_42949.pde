
void setup() {
  size(300, 300);
  background(0);
}

int xTemp = 150; 
int yTemp = 150;
void draw() {
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
  for (int row = 0; row < 15; row++) {
    for (int j = 0; j < 15; j++) { 
    {     
       
        pushMatrix();
        translate(j * 30, row*30);
        float d = dist(mouseX, mouseY, j*30, row*30);
        rotate(radians(45));
        rect(0, 0, d/4, d/4);
        popMatrix();
      }
    }
  }
}


