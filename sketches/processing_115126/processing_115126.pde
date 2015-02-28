
/* @pjs preload= "katenude.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;

void setup() {
  size(470, 664);
  img = loadImage("katenude.jpg");
  imageMode(CENTER);
  noStroke();
}


void draw() { 
  //image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  background(0);
  for (y = 0; y < img.height; y+=4.5) {
    for (x = 0; x < img.width; x+=4.5) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0, 15)) {
        noStroke();
        fill(pix);

        if (dist(pmouseX, pmouseY, x, y) <= 65) {
          pointillize=random(mouseX/50,13);
        }
        else {
          pointillize=1;
        }
        ellipseMode(CENTER); 
        ellipse(x, y, pointillize, pointillize);
      }
    }
  }
}



