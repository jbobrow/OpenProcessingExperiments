
//Ryanne Hollies
//PS2-3

//growth & rotation

float dia = 0;

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  smooth();
  rectMode(CENTER);
}

void draw() {
  //nothing
}

//--------------------------------------------------------------------

void mousePressed() {
  dia = 0;
}

void mouseDragged() {
  dia++;
  brush(mouseX, mouseY, dia);
}

//--------------------------------------------------------------------

void brush(float x, float y, float dia) {
      pushMatrix();
      translate(x, y);
      rotate(radians(dia*4));
      fill(0, mouseX, mouseY, 100);
      rect(10, 20, dia/30, dia/30);
      colorMode(RGB);
      rotate(radians(dia*3));
      fill(mouseX, 0, mouseX, 100);
      rect(10, 20, dia/15, dia/10);
      rotate(radians(dia*2));
      fill(mouseX, mouseY, 255, 100);
      rect(10, 20, dia/20, dia/15);
      popMatrix();
    
}

