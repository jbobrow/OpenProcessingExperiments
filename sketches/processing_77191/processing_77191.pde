
PFont f;

int angle = 0;

void setup() {
  size(800, 600);
  background(50);
  stroke(0);
  fill(0, 50);
  f = createFont ("Verdana Bold", 16, true);
}

void draw() {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 5;
    float val = cos(radians(angle)) * 35.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(100,0,0);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(0,0,random (100, 255));
    ellipse(mouseX, mouseY, 25, 25);
  }
  textFont (f, 32);
  fill (255, 235, 215);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (255, 235, 215);
  text ("created using Processing and Processing.ja", 20, 20);
}


