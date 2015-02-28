
PImage img;

void setup(){
  size (450,640);
  background(255,92,177);
  img = loadImage("ManaInori.jpg"); // to load image, go to SKETCH -> ADD FILE -> blah.jpg
}

void draw(){
  img.resize(400,600);
  image (img,25,25);
}


