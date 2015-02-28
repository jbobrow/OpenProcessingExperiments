
//Ryanne Hollies
//PS2-2

//Paint brush

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  //nothing
}

//--------------------------------------------------------------------

void mousePressed() {
  background(255);
  
}

//--------------------------------------------------------------------

void mouseDragged() {
  
  brush(mouseX, mouseY);
}

//--------------------------------------------------------------------

void brush(float x, float y) {
      pushMatrix();
      translate(x, y);
      rotate(PI/4);
      fill(0, mouseX, mouseY, 100);
      rect(0, 0, 5, 20);
      colorMode(RGB);
      rotate(PI);
      fill(mouseX, 0, mouseX, 100);
      rect(0, 0, 30, 15);
      rotate(PI/3);
      fill(mouseX, mouseY, 255, 100);
      rect(0, 0, 30, 20);
      popMatrix();
    
}

