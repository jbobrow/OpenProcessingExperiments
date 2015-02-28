
PImage img;
PImage img2;
PImage img3;

float v; 
float easing = 0.15;  // Between 0 and 1
float volumeScalar = 2000;
boolean noMic = true;

void setup() {
  size(500, 500);
  smooth();
  img = loadImage("bowler.png");
  img2 = loadImage("mustache.png");
  img3 = loadImage("hair.png");
  setupVolume();
}

void draw() {
  background(255);

  getVolume();

  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);
}
  
  testFace();
  
}

