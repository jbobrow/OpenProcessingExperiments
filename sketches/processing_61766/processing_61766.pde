
/**
 * Pulses. 
 * 
 * Software drawing instruments can follow a rhythm or abide by rules independent
 * of drawn gestures. This is a form of collaborative drawing in which the draftsperson
 * controls some aspects of the image and the software controls others.
 */

int angle = 0;
int col = 500;
void setup() {
  size(920, 600);
  background(102);
  smooth();
  noStroke();
  fill(0, 102);
}

void draw() {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 10;
    float val = cos(radians(angle)) * 16.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(mouseX-col*.2, (mouseX-mouseY)-col/2, mouseY-col*.2);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(255);
    ellipse(mouseX, mouseY, 1, 1);
  }
}
      //=========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
//=================
