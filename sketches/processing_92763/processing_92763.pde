
PImage animage;
float d;
int x, y;
color c;
PVector pos;
void setup() {
  size(500, 400);
  animage = loadImage("moonwalk.jpg");
  frameRate(100);
  noStroke();
  strokeWeight(1);
}
void draw() {
  background(0);
  d+=0.1;
display(10);
}
void display(int size) {
  loadPixels();
for(int y = 0; y < height/size; y++) {
  for(int x = 0; x < width/size; x++) {
fill(animage.get(x*size, y*size));
ellipse(x*size, y*size, size, size);
  }
}
animage.resize(500, 400);
}


