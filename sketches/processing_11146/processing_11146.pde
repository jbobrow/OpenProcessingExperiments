
/**
 * Colorful Rect by Eriq Adams 
 * (eriq.adams@gmail.com)
 */
int rectNum = 0;
int maxRect = 2000;

void setup() {
  size(640,480);
  frameRate(30);
  background(0);
  PFont font = loadFont("Ziggurat-HTF-Black-32.vlw");
  textFont(font, 32);
}

void draw() {
  if(rectNum>maxRect) {
    background(0);
    rectNum=0;
  }
  else {
    stroke(0,0,0);
    fill(random(255),random(255),random(255));
    strokeWeight(random(4));
    rect(random(width),random(height),random(50),random(50));
    fill(255,255,255);
    stroke(255,255,255);
    rect(width-290, height-45, 440, 24);
    fill(0,0,0);
    text(":Colourful Rect", width-292+random(5), height-22+random(5));
    rectNum++;
  }
}


