
int outChange = 0;
int turnChange = 0;

void setup() {
  size(640, 480);
}

void draw() {
  background(255);
  int xCent = mouseX;
  int yCent = mouseY;
//  Draw lines going out in a circle
  for(int i = 0; i <= 20; i++) {
    float lineAng = radians((18 * i) + turnChange);
    line( xCent + ((20 + outChange) * cos(lineAng)), yCent + ((20 + outChange) * sin(lineAng)),
          xCent + ((100 + outChange) * cos(lineAng)), yCent + ((100 + outChange) * sin(lineAng)));
  }
//  Lines grow out from center on mouse click
  if (mousePressed && (mouseButton == LEFT)) {
    outChange ++;
  }
//  Lines spring back to original spot on mouse release
  else {
    outChange -= 10;
  }
  if (outChange <= 0) {
    outChange = 0;
  }
//  Lines rotate when key is pressed
  if (keyPressed) {
    turnChange ++;
  }
}


