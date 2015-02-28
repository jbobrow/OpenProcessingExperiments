
/* @pjs preload= "ham.png"; */
PImage img;
int x;
int y;
float a = 0.0;
float s = 1.0;
color pix;


void setup() {
  size(600, 600);
  img = loadImage("ham.png");
  imageMode(CENTER);
  noStroke();
  ellipseMode(CENTER);
  frameRate(30);
  smooth();
}



void draw() { 
  //image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  background(0);

  for (y = 0; y < img.height; y+=4) {
    for (x = 0; x < img.width; x+=4) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        //translate(.02*s, .02*s);
        scale(s);
        fill(pix); 
        ellipse( x, y, 4, 4);
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    a = a + 0.04;
    s = 1.00025 + cos(a)*.0003;
  }
  else {
    s = 1.0;
  }
}



