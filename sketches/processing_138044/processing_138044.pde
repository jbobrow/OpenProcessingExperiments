

//The Final Project
//Snow on the Flowers
//Wanted to Have Control of the Snow in the Users Hands.
//Mouse Click = More Snow
//Winter on the Way!
//s or S for Screenshot

void setup() {
  size (800, 600);
  PImage photo = loadImage("Cold_Daisy.jpg");
  image (photo, 0, 0);
}
void draw() {
  if (mousePressed) {
    pushMatrix();
    stroke(255);
    strokeWeight (random (3));
    if (mousePressed) {
      ellipse (mouseX, mouseY, random (10), random (10));

      popMatrix();
    }
  }
}
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame ("screenshot.png");
}



