
PImage img;
PImage img1;
int value = 0;

void setup() {
  size(500,303);
  img = loadImage("Bang dead1.jpg");
  img1 = loadImage("Bang dead.jpg");
}

void draw() {
  fill(value);
  rect(25, 25, 50, 50);

  image(img, 0, 0);


if (mousePressed == true) {
  image(img1, 0, 0);
    fill(0);
  } else {
    fill(255);
  }
  
}




