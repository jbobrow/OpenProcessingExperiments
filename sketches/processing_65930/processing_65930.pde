
//  Title: Blocks
//  Description: Visualize 2d data by size of block.  block size is equal
//  to noise(x,y) for a block at position (x,y).
//  Date Started: 24 Jan 2012
//  Last Modified: 24 Jan 2012
//  http://asymptoticdesign.wordpress.com/
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
float delta = 0.05;
float xnoise = 0;
float ynoise = 0;
float xstart = 0;
float ystart = 0;
float znoise = 0;
float len = 0;

//-----------------Setup
void setup(){
  size(800,600);
  background(255);
  smooth();
  frameRate(30);
  xnoise = random(17);
  xstart = xnoise;
  ynoise = random(17);
  znoise = random(17);
  noStroke();
  for(int x = 0; x < width; x+=5){
    ynoise += delta;
    xnoise = xstart;
    for(int y = 0; y < height; y+=5){
      xnoise += delta;
      len = 10*noise(xnoise,ynoise,znoise);
      fill(128,0,255*noise(xnoise,ynoise,znoise));
      rect(x,y,len,len);
    }
  }

}

void draw() {
  background(0);
  xnoise = xstart;
  ynoise = ystart;
  znoise += 0.01;
  for(int x = 0; x < width; x+=5){
    ynoise += delta;
    xnoise = xstart;
    for(int y = 0; y < height; y+=5){
      xnoise += delta;
      len = 10*noise(xnoise,ynoise,znoise);
      fill(128,0,255*noise(xnoise,ynoise,znoise));
      rect(x,y,len,len);
    }
  }

}

void keyPressed() {
  if (key == ' ') {
    saveFrame("blocks-####.png");
  }
}

