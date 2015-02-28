
import processing.opengl.*;
import geomerative.*;

RShape shp;
RPoint[] points;

void setup() {
  // Initilaize the sketch
  size(600, 600, OPENGL);
  frameRate(24);

  // Choice of colors
  background(255);
  fill(255, 102, 0);
  stroke(0);

  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  shp = RG.loadShape("test1.svg");
  shp = RG.centerIn(shp, g);
  RG.ignoreStyles();

  // Enable smoothing
  smooth();
}

void draw() {
  // Clean frame
  background(200);
  translate(width/2, height/2);
  // Set the origin to draw in the middle of the sketch


  // Draw the group of shapes
  noFill();
  stroke(255);
  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.shape(shp);

  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  points = shp.getPoints();

  // If there are any points
  if (points != null) {
    noFill();
    stroke(0, 200, 0);
    beginShape();
    for (int i=0; i<points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape();

    fill(0);
    stroke(0);
    for (int i=0; i<points.length; i++) {
      ellipse(points[i].x, points[i].y, 5, 5);
    }
  }
}



