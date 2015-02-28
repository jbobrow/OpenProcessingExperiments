
void setup() {
  size(1000, 1000);
  colorMode(HSB);
}

void draw() {
  background(0, 0, 0);
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
      rotate(radians(90*i*j));
     
      if (1 == ((i+j) % 2)) {
        rotate(radians(frameCount));
      } else {
     rotate(radians(-1 * frameCount));
      }

      makeCross();
      popMatrix();
    }
  }
}


void makeCross() {

  fill(25, 255, 255);

  noStroke();

  pushMatrix();

  

  rectMode(CENTER);
  rect(0, 0, 150, 40);
  rect(0, 0, 40, 150);

  fill(0);
  rect(45, 0, 7, 50);
  fill(0);
  rect(-45, 0, 7, 50);
  rect(-63, 0, 7, 50);

  popMatrix();
}



