
import geomerative.*;
//import processing.opengl.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

float mx, my, nx, ny;
float[][] coords;
float d;

float p = 150;

//text
//  PFont font = loadFont("juice.vlw");

  
void setup() {
  // Initilaize the sketch
  size(400, 500);
  frameRate(20);

//  textFont(font);

  // Choice of colors
  background(256, 256, 256);

  // VERY IMPORTANT: Always initialize the library in the setup
  RG.init(this);

  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
    if (key == CODED) {
      
    }
  grp = RG.getText("w", "FreeSans.ttf", 372, CENTER);
    
  // Enable smoothing
  smooth();

  //  NEW CONTENT


  mx = 00; // horizontal margin
  my = 00; // vertical margin
  nx = 20; // number of elements in X
  ny = 20; // number of elements in Y
}
//


void draw() {
  // Clean frame
  fill(256, 256, 256, 65);
  rect(0, 0, width, height);


  //Slider
  stroke(100, 100, 100);
  strokeWeight(.5);
  line(130, 402, 300, 402);
  noStroke();
  if ((mousePressed == true) && (mouseY>390) && (mouseY<410)) {
    p = int(mouseX);
  }
  fill(90, 90, 90);
  ellipse(p, 402, 15, 15);



  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);

  // Draw the group of shapes
  noFill();
  RG.setPolygonizer(RG.ADAPTATIVE);
  // grp.draw();

  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 90.0));

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  for (int i = 0; i<width; i+=(1)) {
    RG.setPolygonizerLength(map(width*(1.2)-(1.5)*p, 20, 50, 10, 50));
  }
  points = grp.getPoints();

  // If there are any points
  if (points != null) {
    noFill();
  stroke(0, 0, 150, 250);
    strokeWeight(0.1);

    for (int i=0; i<points.length; i++) {
      for (int j=0; j<points.length; j++) {
        int k = i - j;
        int p = j - i;
        if (i!=j && k!=1 && p!=1) {
          float d = points[i].dist(points[j]);
          if (d<200) {
            line(points[i].x, points[i].y, points[j].x, points[j].y);
          }
        }

        vertex(points[i].x, points[i].y);
      };
    }
  }
}


