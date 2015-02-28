
import geomerative.*;
//import processing.opengl.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

float d;
float sp = 284;
float sd = 150;

//text

String letter = "k";



void setup() {
  size(400, 500);
  smooth();
  frameRate(4);

  PFont font = loadFont("juice.vlw");
  textFont(font);

  background(256, 256, 256);

  // VERY IMPORTANT: Always initialize the library in the setup
  RG.init(this);

  // Enable smoothing
}


void draw() {
  // Clean frame
  fill(256, 256, 256, 85);
  rect(0, 0, width, height);

  //text
  if (keyPressed == true) {
    if ((key>=32) && (key <=126)) {
      letter =Character.toString(key);
    }
  }


  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER

  grp = RG.getText(letter, "FreeSans.ttf", 350, CENTER);

  // Set the origin to draw in the middle of the sketch
  translate(width/2, 2*height/3);

  // Draw the group of shapes
  RG.setPolygonizer(RG.ADAPTATIVE);
  // grp.draw();

  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 90.0));

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  for (int i = 0; i<width; i+=(1)) {
    RG.setPolygonizerLength(map(random(40,60), 20, 50, 10, 50));
  }
  points = grp.getPoints();

  // If there are any points
  if (points != null) {
    fill(90, 180, 5, 8);
    stroke(256, 256, 256, 60);
    strokeWeight(0.3);

    for (int i=0; i<points.length; i++) {
      for (int j=0; j<points.length; j++) {
        for (int l=0; l<points.length; l++) {

          if (i!=j && j!=l && l!=i ) {
            float d = points[i].dist(points[j]);
            float c = points[j].dist(points[l]);
            float e = points[l].dist(points[i]);

            if (d<(sd-90) && c<sd-90 && e <sd-90) {
              triangle(points[i].x, points[i].y, points[j].x, points[j].y, points[l].x, points[l].y);
            }
          }
        }

        vertex(points[i].x, points[i].y);
      }
    }
  }
}


