
PImage b;

void setup() {
  size(1024, 768);
  smooth();
  b = loadImage("FinalMocks4.jpg");
  noLoop();
  
}

void draw() {
  background(0);
  
  image(b,0,0, b.width/2, b.height/2); 
}

