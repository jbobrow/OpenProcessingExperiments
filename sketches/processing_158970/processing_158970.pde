
//using get()

PImage img;

void setup () {
  size(600, 799);
  img = loadImage("Poster.jpg");
}

void draw() {
  image(img, 0, 0);
  //get the color at the mouse x and mouse y
  color posColor = img.get(mouseX, mouseY);
  fill(posColor);
  ellipse(mouseX, mouseY, 100, 100);

  float posB = brightness(posColor);
  fill(posB);
  rect(0, 90, posB, 30);

  float posRed = red(posColor);
  fill(255, 0, 0);
  rect(0, 0, posRed, 30);

  float posGreen = green(posColor);
  fill(0, 255, 0);
  rect(0, 30, posGreen, 30);

  float posBlue = blue(posColor);
  fill(0, 0, 255);
  rect(0, 60, posBlue, 30);
}



