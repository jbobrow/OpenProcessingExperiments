
//  Title: Data Visualization: Color
//  Description: Visualize 2d data by color.  The intensity of each point is
//  equal to 255*noise(x,y) for each point (x,y).
//  Date Started: Jan 2012
//  Last Modified: Jul 2012
//  http://www.asymptoticdesign.org/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//  
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
float delta = 0.01;
float xnoise = 0;
float ynoise = 0;
float znoise = 0;
float xstart = 0;
float ystart = 0;

//-----------------Setup
void setup() {
  size(800,600);
  background(255);
  smooth();
  frameRate(30);
  colorMode(HSB);
  xnoise = random(17);
  xstart = xnoise;
  ynoise = random(17);
  ystart = ynoise;
  znoise = random(17);
  for(int i = 0; i < width; i++){
    ynoise += delta;
    xnoise = xstart;
    for(int j = 0; j < height; j++){
      xnoise += delta;
      stroke(360*noise(xnoise,ynoise,znoise),255*noise(ynoise,xnoise,znoise),255);
      point(i,j);
    }
  }
}

void draw() {
  background(255);
  xnoise = xstart;
  ynoise = ystart;
  znoise += 0.01;
  for(int i = 0; i < width; i++){
    ynoise += delta;
    xnoise = xstart;
    for(int j = 0; j < height; j++){
      xnoise += delta;
      stroke(360*noise(xnoise,ynoise,znoise),255*noise(ynoise,xnoise,znoise),255);
      point(i,j);
    }
  }

}
void keyPressed() {
  if (key == ' ') {
    saveFrame("hsv-####.png");
  }
}

