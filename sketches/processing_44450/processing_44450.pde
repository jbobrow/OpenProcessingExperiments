
import geomerative.*;
//import processing.opengl.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

color[] c = new color[10];

void setup() {
  // Initilaize the sketch
  size(800, 400);
  frameRate(14);

  // Choice of colors
  background(256);

  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);

  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("G", "FreeSans.ttf", 332, CENTER);

  // Enable smoothing
  smooth();

  for (int i = 0; i < 10; i++) {
    c [i]= color(random(256), random(100), random(200));
  }
}

void draw() {
  // Clean frame
  fill(256, 256, 256, 25);
  rect(0, 0, width, height);

  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);

  // Draw the group of shapes
  //noStroke();
  //fill(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
  // grp.draw();

  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(random(width-mouseX), 0, 50, 3, 300));
  points = grp.getPoints();

  // If there are any points
  if (points != null) {
  for (int i = 0; i < 10; i++) {
    c[i] = color(random(50), random(80,180), random(50), random(60));
    fill(c[i]);
  }    
    strokeWeight(0.1);
    beginShape();
    for (int i=0; i<points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape();

    fill(45);
    stroke(0);
    for (int i=0; i<points.length; i++) {
      //ellipse(points[i].x, points[i].y,1,1);
    }
  }
}


