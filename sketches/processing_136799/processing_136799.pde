
PImage img;

void setup() {
img = loadImage("imagen.jpg");
  size(800,1000);
}

void draw() {

  color elcolor = img.get(mouseX,mouseY);
  float brillo = brightness(elcolor);
  fill(elcolor);
  ellipse(mouseX,mouseY,10,10);
}


