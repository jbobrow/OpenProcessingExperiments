
/* @pjs preload= "planet one.jpg"; */
PImage img;
int x;
int y;
float a = 0.0;
float s = 1.0;
float h = 1.0;
color pix;


void setup() {
  size(600, 600);
  img = loadImage("planet one.jpg");
  imageMode(CENTER);
  noStroke();
  ellipseMode(CENTER);
  frameRate(60);
}



void draw() {
  background(0);

  a = a + 0.04;
  s = 1.00025 + h*cos(a)*.0003;

  for (y = 0; y < img.height; y+=4) {
    for (x = 0; x < img.width; x+=4) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        //translate(.02*s, .02*s);
        scale(s);
        fill(pix);
        //int tempX = round (s);
        ellipse( x, y, s, s);
      }
    }
  }
}

void keyReleased() {
  if (key == 'u') {
    h *=-1;
  }
}



//void keyPressed() {
//  if (key == ' ') {
//    a = a + 0.04;
//    s = 1.00025 + cos(a)*.0003;
//  }
//  else {
//    s = 1.0;
//  }
//}



