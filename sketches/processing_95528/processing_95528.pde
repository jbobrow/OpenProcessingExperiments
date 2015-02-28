
//Ana Cecilia Thompson
//Sin and cos
//week10

int thread = 20;
float xOffset = 0;
float incrementer = 0;

void setup() {
  size(700, 750);
  background(0);
}

void draw() {
  fill(255, 216, 18);
  if (keyPressed) {
    if (key == '1') {
      for (int i = 0; i<thread+1; i++) {
        float yOffset = cos(incrementer * 2) * 100;
        ellipse(xOffset, 125 + yOffset, 20, 20);
        ellipse(width - xOffset, 225 + yOffset, 20, 20);
        ellipse(xOffset, 325 + yOffset, 20, 20);
        ellipse(width - xOffset, 425 + yOffset, 20, 20);
        ellipse(xOffset, 525 + yOffset, 20, 20);
        ellipse(width - xOffset, 625 + yOffset, 20, 20);
        incrementer += .03;
        xOffset += 5;
        if (xOffset > width) xOffset = 0;
      }
    }
  }
  if (keyPressed) {
    if (key == '2') {
      for (int i = 0; i<thread+1; i++) {
        float yOffset = cos(incrementer * 2) * 100;
        ellipse(xOffset, 125 + yOffset, 20, 20);
        ellipse(width - xOffset, 225 + yOffset, 20, 20);
        ellipse(xOffset, 325 + yOffset, 20, 20);
        ellipse(width - xOffset, 425 + yOffset, 20, 20);
        ellipse(xOffset, 525 + yOffset, 20, 20);
        ellipse(width - xOffset, 625 + yOffset, 20, 20);
        incrementer += .02;
        xOffset += 5;
        if (xOffset > width) xOffset = 0;
      }
    }
  } 
  if (keyPressed) {
    if (key == '3') {
      for (int i = 0; i<thread+1; i++) {
        float yOffset = cos(incrementer * 2) * 100;
        ellipse(xOffset, 125 + yOffset, 20, 20);
        ellipse(width - xOffset, 225 + yOffset, 20, 20);
        ellipse(xOffset, 325 + yOffset, 20, 20);
        ellipse(width - xOffset, 425 + yOffset, 20, 20);
        ellipse(xOffset, 525 + yOffset, 20, 20);
        ellipse(width - xOffset, 625 + yOffset, 20, 20);
        incrementer += .01;
        xOffset += 5;
        if (xOffset > width) xOffset = 0;
      }
    }
  } 
  if (mousePressed == true) {
    background(0);
  }
}
