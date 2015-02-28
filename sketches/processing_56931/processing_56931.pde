
//----------------------
// by lali barriere 2012
//----------------------

PImage imatge;

void setup() {
  imatge=loadImage("ocellets-5-petita.jpg");
  size(300, 300);
  image(imatge, 0, 0);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  if (mousePressed) {
    // linies alternatives
    //fill(get(mouseX, mouseY));
     fill(imatge.get(mouseX, mouseY));

    rect(mouseX, mouseY, 100, 100);
  }
}


