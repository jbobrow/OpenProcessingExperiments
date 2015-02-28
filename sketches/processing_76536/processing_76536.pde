
PImage img;
int i;

void setup() {
  size(1024, 768);
  
  img = loadImage("image.jpg");
}

void draw() {
  background(0);
  
  image(img, 0, 0);
  
  stroke(0, 0, 0);
  strokeWeight(5);
  ellipse(mouseX, mouseY, i, i);
  fill(0);
  
  if (mousePressed) {
    i = i-2;
  } else {
    i = i+2;
  }
 
  if (i > 1280) {
     i = 0;
  }
}


