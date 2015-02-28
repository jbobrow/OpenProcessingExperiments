
// Sep 2009
// http://www.abandonedart.org
// http://www.zenbullets.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://www.zenbullets.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// These conditions can be waived if you want to do something groovy with it 
// though, so feel free to email me via http://www.zenbullets.com

int numcols = 47;
int numrows = 47;
int gap = 6;
float xspacing;
float yspacing;
float xoff = 0; 
float yoff = 0;
float driftXN = 0; 
float driftYN = 0; 

void setup() {
  size(920,500);
  frameRate(112);
  smooth();
  noStroke();
  xspacing = (width-gap) / numcols;
  yspacing = (height-gap) / numrows;
  background(255);
  drawGrid();
}

void draw() {
  background(255);
  driftXN += 0.01;
  driftYN += 0.01;
  xoff += (noise(driftXN) * 0.2) - 0.1;
  yoff += (noise(driftYN) * 0.2) - 0.1;
  drawGrid();
}


void drawGrid() {
  float xpos = 15;
  float ypos = 15; 
  float inc = 0.02;
  float xnoise = xoff + inc;
  float ynoise = yoff + inc;
  for (int y = 0; y < numrows; y+=1) {
    for (int x = 0; x < numcols; x+=1) {
      drawShape(xpos, ypos, xspacing-gap, yspacing-gap, noise(xnoise,ynoise));
      xpos += xspacing;
      xnoise += inc;
    }
    xpos = 10;
    xnoise = xoff + inc;
    ypos += yspacing;
    ynoise += inc;
  }
}

void drawShape(float x, float y, float wid, float hei, float factor) {
  int fillval = int(factor * 300);
  fill(0,0,fillval, 70);
  pushMatrix();
  translate(x, y);
  int rot = int(factor * 1440);
  rotate(radians(rot));
  scale(factor * 12);
  rect(0, 0, wid, hei);
  popMatrix();
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
