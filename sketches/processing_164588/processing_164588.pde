
PImage pic;
PImage myPic;
int columns = 40;
int rows = 40;

void setup() {
  size(480, 640);
  colorMode(HSB);
  pic = loadImage("self.JPG");
}

void draw() {
  noStroke();
  pic.loadPixels();
  for (int x = 0; x < width; x+= width/columns) {
    for (int y = 0; y < height; y+= height/rows) {
      int loc = x + y * width;
      color c = pic.pixels[loc];
      fill(c);
      rect(x, y, width/columns, height/rows);
    }
  }
  updatePixels();
  if (mousePressed == true) {
    colorMode(HSB);
    myPic = loadImage("travel.jpg");
  }
}



