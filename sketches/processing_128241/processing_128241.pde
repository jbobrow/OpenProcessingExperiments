
void setup() {
  size(1000, 1000);
  stroke(255);
}

void draw() {
  background(0, 0, 0);
  noStroke();
  stroke(255);
  /*
rotate(radians(frameCount));
   rectMode(CENTER);
   rect(mouseX, mouseY, 50, 50);
   rect(mouseX+50, mouseY, 50, 50);
   rect(mouseX-50, mouseY, 50, 50);
   rect(mouseX, mouseY+50, 50, 50);
   rect(mouseX, mouseY-50, 50, 50);
   */

  int xSteps = width / 150 / 2 + 1;
  int ySteps = height / 150 / 2 + 1;


  for (int i = xSteps*-1; i < xSteps; i++) {
    for (int j = ySteps*-1; j < ySteps; j++) {
      pushMatrix();
      translate(width/2+i*150, height/2+j*150);
      makeCross();
      popMatrix();
    }
  }
}


void makeCross() {

  pushMatrix();

  rotate(radians(frameCount));
  rectMode(CENTER);
  rect(0, 0, 50, 50);
  rect(0+49, 0, 50, 50);
  rect(0-49, 0, 50, 50);
  rect(0, 0+49, 50, 50);
  rect(0, 0-49, 50, 50);
  popMatrix();
}



