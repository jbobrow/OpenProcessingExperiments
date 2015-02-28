
int maxImages = 14;
int imageIndex = 0;
PImage[] images = new PImage[maxImages];

PImage vector;
PFont font;

void setup() {
  size(400,500);
  background(255);
  smooth();
  
  for(int i = 0; i < images.length; i++) {
  images[i] = loadImage("sky" + i + ".jpg");
  }
  vector = loadImage("vector_experiment3.png");
  
  font = loadFont("Geneva-48.vlw");
}

void draw() {
  background(255);
  
  image(images[imageIndex], 0, 0);
  
  image(vector,0,0);
  
  text("a theater of air", random(50), random(100));
  delay(100);
}

void mousePressed() {
  imageIndex = int(random(images.length));
  
}

