
PImage b;

void setup() {
  size(655, 800);
  smooth();
  b=loadImage("water2.png");
  noStroke();
}

void draw() {

  //background(255);

  if (mousePressed) //change the color when clicked
      ellipse(mouseX, mouseY, 30, 30);

  fill(0, 150, 250);

  image(b, 0, 0);
}



