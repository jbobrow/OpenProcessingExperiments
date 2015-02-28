
// CSC Homework 3 Exercise 2

void setup() {
  size(405, 430);
  colorMode(HSB);
  background(60, 153);
  smooth();
  stroke(.25, 164);
  strokeWeight(30);
  noLoop();
}

void draw() {
  for (int x = 50; x <= 350; x += 100) {
    for (int y = 20; y <= 400; y += 110) {
      drawrandomintsect(x, y, 60, color(random(x), 200, 700), 
      color(random(224), y*.40, x*.70), color(random(x*.2), 221, y*4));
      //the various color randoms controls the variation of colors in each section
      //of the intertwined ellipses. I realised that multiplying the variables
      //by different values caused a different effect (hue, saturation and brightness)
      // each time the sketch is run. I had several runs and plug in various values to achieve this final result.
    }
  }
}

void drawrandomintsect(int x, int y, int widthheight, int palette1, int palette2, int palette3) {
  fill(palette1);
  ellipse(x, y, widthheight, widthheight);
  fill(palette2);
  ellipse(x+20, y+40, widthheight, widthheight);
  fill(palette3);
  ellipse(x-20, y+40, widthheight, widthheight);
  //filter(BLUR);
}
  



