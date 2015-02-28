
/* @pjs preload= "Brownie.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 3;

void setup() {
  size(600, 600);
  img = loadImage("Brownie.jpg");
  imageMode(CENTER);
  //ellipseMode(CENTER);
}

void draw() { 
  image (img, width/2, width/2);
  background(0);
  for (y = 0; y < 600; y+=4) {
    for (x = 0; x < 600; x+=4) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);

        if (dist(mouseX, mouseY, x, y) <=1.9) {
          pointillize =50;
        }
        else {
          pointillize=3;
        }
          ellipse( x,y, pointillize, pointillize);
      }
    }
  }
}



