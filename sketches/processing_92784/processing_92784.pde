
PImage animage;
float r, g, b;
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
display(1);
}
void display(int size) {
  loadPixels();
for(int y = 0; y < height/size; y++) {
  for(int x = 0; x < width/size; x++) {
    r = red(animage.get(x*size, y*size));
    g = green(animage.get(x*size, y*size));
    b = blue(animage.get(x*size, y*size));
fill(r/(dist(x, y, mouseX/size, mouseY/size)/5), g/(dist(x, y, mouseX/size, mouseY/size)/5), b/(dist(x, y, mouseX/size, mouseY/size)/5));
rect(x*size, y*size, 1, 1);
  }
}
animage.resize(500, 400);
}


