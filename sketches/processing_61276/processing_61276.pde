
void setup () {
  size (400, 400);
  smooth();
  background(64, 219, 143);

  rectMode(CENTER);
}


void draw () {

  if (mousePressed) {

    fill(255, 229, 23, 12);
    ellipse(width/2, height/2, mouseX, mouseY);
  }
  else {
    fill(255, 25);
    ellipse(pmouseX, pmouseY, mouseX/2, mouseY/2);
  }
}
