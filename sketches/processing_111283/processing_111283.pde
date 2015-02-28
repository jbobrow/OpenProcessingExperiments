

void setup() {
  size (800, 800);
}

void draw() {
  float z=random(.5);

  int x=mouseX;
  int y=mouseY;
  for (int v=100; v>0; v=v%20) {

    color(z,z);
    rect(x, y, x, y); 

    pushMatrix();
    translate(10, 10);
    // fill(0);  
    rect(displayHeight/2, displayWidth/2, y, z); 

    popMatrix();
    rect(displayWidth/2, displayHeight/2, z, y);
  }
}



