
PImage motorcycle;

int C;
float r, g, b, bright;

void setup() {
  size(600, 440);

  motorcycle=loadImage("motorcycle.jpg");

  noLoop();
  smooth();
   background(0);
}

void draw() {

  noStroke();
  for (int x=0; x<600; x++) {
    for (int y=0; y<440; y++) {
      C=motorcycle.get(x*10, y*10);
      r=red(C);
      g=green(C);
      b=blue(C);
      bright=(brightness(C)/255)*10;

      fill(r, g, b);
         rect(x*10, y*10, bright, bright);
    
    }
  }
}

