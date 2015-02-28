
/* @pjs preload= "forsketch.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 25;

void setup() {
  size(500, 717);
    img = loadImage("forsketch.jpg");
    // background(0);
    noStroke();
  }
void draw() {
  //background(0);

  imageMode(CORNER);
  //image(img,0,0,width, height);
  img = loadImage("forsketch.jpg");
  for (y = 0; y < height; y+=5) {
    for (x = 0; x < width; x+=5) {
      pix = img.get(x, y);
      if (dist(mouseX, mouseY, x, y) <= 10) {
        pointillize=10;
      }
      else {
        pointillize=0;
      }


      noStroke();
      fill(pix);
      rect( x, y, pointillize, pointillize);
    }
  }
}



