
void setup() {
  size(640, 480);
  fill(0);
  textAlign(CENTER);
}
void draw() {
  background(255);
  text(mouseX+ ", " + mouseY, mouseX, mouseY);
  if (mousePressed) {
    String mou = "";
    if (mouseButton == 37) mou = "LEFT";
    else if (mouseButton == 39) mou = "RIGHT";
    text("MOUSE HAS BEEN PRESSED!! It was the " + mou + " one.", mouseX,mouseY+25);
  }
}



