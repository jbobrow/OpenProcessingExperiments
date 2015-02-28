
int x = 0;
int y = 0;
int speed = 5;
int xdirection = 5;
int ydirection = 5;
int countClicks = 0;
int w = 20;
int h = 30;
PImage SF;  // declare image variable
PImage GO; 
PFont JOEP;
int colorIndex = 0;

void setup() {
  smooth();
  size(600, 600);
  frameRate(60);

  SF = loadImage("sf.jpg");
  GO = loadImage("la.jpg");
  JOEP = loadFont("Wingdings3-48.vlw");
}

void draw() {

  background(360);
  colorMode(HSB, 360, 100, 100);
  strokeWeight(1);

  w = w + 5;

  if (w > 30 || w < -30) {
    w = -w;
  }

  h = h + 5;

  if (h > 30 || h < -30) {
    h = -h;
  }

  x = x + xdirection;

  if (x > width || x < 0) {
    xdirection = -xdirection;
  }

  y = y + ydirection;

  if (y > height || x < 0) {
    ydirection = -ydirection;
  }


  colorIndex++;

  if (colorIndex < 360) {
    colorIndex++;
  } 
  else {
    colorIndex = 0;
  }

  for (int i = -height; i < height * 2; i = i + 130) {
    for (int r = -width; r < width * 2; r = r + 130) {
//      stroke(colorIndex+100, 100, 100);
noStroke();
      fill(0);
      ellipse((r -65 )+ x, i-65 - y, h, h);
      ellipse(r + x, i + y, h, h);
      fill(colorIndex+150, 100, 100);
//      rect(r + x, i + y, h * 5, h * 5);
//      triangle(r, r, i+h, r, h, w);
    }
  }
}

  //like a PAUSE button right now... 
  void mousePressed() {
    countClicks++;
    if (countClicks % 2 == 0) {
      loop();
    } 
    else {
      noLoop();
    }
  }



