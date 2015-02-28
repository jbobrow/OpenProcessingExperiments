
PImage photo;

void setup() {
  size(576, 759);
  photo = loadImage("Florals_4.png");
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(205,204,0,25);
    image(photo, 0, 0);
  } else {
    fill(205,204,0,25);
  
  }
  ellipse (mouseX, mouseY, 80, 80);



}




