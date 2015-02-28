
/* @pjs preload= "Brownie.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 10;

void setup() {
  size(600, 600);
  img = loadImage("Brownie.jpg");
  img.resize(600, 600);
  imageMode(CENTER);
  ellipseMode(CENTER);
}

void draw() { 
  background(img);
  for (y = 0; y < 600; y+=10) {
    for (x = 0; x < 600; x+=20) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();

        if (dist(mouseX, mouseY, x, y) <=1.9) {
          pointillize =30;
          fill(pix);
        }
        else {
          pointillize=10;
          ellipse( x, y, pointillize, pointillize);
        }
      }
    }
  }
}



