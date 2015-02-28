
/* 
Based on Toutorial 07 included with the geomerative library
Adapted by Alec Morrison February 2011
*/

import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

int delta = 1;
int polyLength = 0;

void setup(){
  // Initilaize the sketch
  size(500,150);
  frameRate(24);

  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 90 and the alignment CENTER
  grp = RG.getText("ERASURE", "Tahoma Bold.ttf", 90, CENTER);

  // Enable smoothing
  smooth();
}

void draw(){
  // Clean frame
  background(0);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 2*height/3);
  
  // Draw the letters
  noStroke();
  fill(180,0,180);
  RG.setPolygonizer(6);
  grp.draw();
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(polyLength);
  points = grp.getPoints();
  
  // If there are any points
  if(points != null) {
    fill(255,0,150);
    noStroke();
    for(int i=0; i<points.length; i++){
      ellipse(points[i].x, points[i].y,5,5);  
    }
    
    // Adjust length for next frame
    polyLength += delta;
    
    // Change direction of adjustment
    if (polyLength < 0 || polyLength > 300) {
     delta *= -1; 
    }
  }
}

