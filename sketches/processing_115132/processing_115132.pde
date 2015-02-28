
/* @pjs preload= "royals.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 8;


void setup() {
  size(600, 300);
  noStroke();
}

void draw() {
  img = loadImage("royals.jpg");
  //image(img,width, height); // We don't need this anymore becayse we are drawing our own pixels

  for (y = 0; y < img.height; y+=3) {
    for (x = 0; x < img.width; x+=3) {
      pix = img.get(x, y);
      //      if (pix != color(255)) {
      noStroke();
      fill(pix);

      if (dist(mouseX, mouseY, x, y) <= 1) {
        pointillize= 90;
      }
      else {
        pointillize= 2;
      }
      rect( x, y, pointillize, pointillize);
    }
  }
}
//}



