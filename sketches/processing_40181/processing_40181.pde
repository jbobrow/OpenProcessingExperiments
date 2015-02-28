
// 6.2.) Create a 300 x 300 sketch. Write an original program that uses color data from an image to create a new graphic composition.
// click on the image to make her dance

PImage[] images = new PImage[8];
PImage img = new PImage();
int r;

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  background(0);

  for (int i = 0; i < images.length; i ++) //load images into the array
  {
    images[i] = loadImage( i +".jpg");
  }
}

int cell = 3; // size of the pixels


void draw() {
}

void mousePressed() {
  for (int count = 0;count<8;count ++) {
    r=int(random(8));
    image(images[r], 0, 0);
  }
  for (int y=cell; y <= 299; y+=cell) {    
    for (int x=cell; x <= 299; x+=cell) {

      float radius = cell * (brightness(images[r].pixels[x + (y * 300)]) / 255);
      ellipse(x, y, radius, radius);
    }
  }
}


