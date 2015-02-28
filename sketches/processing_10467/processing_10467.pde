
int maxImages = 6;
int imageIndex = 0;
PImage[] images = new PImage[maxImages];

void setup() {
  frameRate(5);
  size(400,400);
  background(0);
  for (int i=0; i<images.length; i++) {
    images[i] = loadImage("radio"+i+".gif");
  }
}

void draw() {
  //
  imageIndex = (imageIndex + 1) % images.length;
  image(images[imageIndex],random(width),random(height));
}

void mousePressed() {
  imageIndex = int(random(images.length));
}


