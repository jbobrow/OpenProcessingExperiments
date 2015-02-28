
/* @pjs preload= "arana.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;

void setup() {
  size(668, 960);
  img = loadImage("image3.jpg");
  imageMode(CENTER);
  noStroke();
}

void draw() { 
//image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  background(0);
  for (y = 0; y < img.height; y+=5) {
    for (x = 0; x < img.width; x+=13) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);
        
      if (dist(mouseX, mouseY, x, y) <= 1.9) {
         pointillize=100;
       }
       else {
          pointillize=4;
      }
///////////////////////////////////////////////// This allows you to select a pixel color with the mouse coordinates
    rectMode(CENTER);
     rect( x, y, pointillize, pointillize);// rectagles work just as well, but remember to set the center mode.
      
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
}



