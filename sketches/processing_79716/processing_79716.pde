
// pointillism
PImage img;

void setup() {
  size(600, 450);        // Load and display image
  img = loadImage("bmc3.jpg");    
  imageMode(CENTER);

 // image(img, 300, 225);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();
  img.loadPixels();          // Cover with random circles

  for (int i=0; i<50000; i++) addPoint();
}



void addPoint() {
  // Add a random filled circle to image
  int x = (int)random(img.width);
  int y = (int)random(img.height);
  int i = x + img.width*y;

  color c = img.pixels[i];
  fill(c);
  ellipse(x, y, 7, 7);
}

void draw() {
  //addPoint();
}

