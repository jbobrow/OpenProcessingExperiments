
import geomerative.*;
//import processing.opengl.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

float d;
float sp = 285;
float spr;
float sd = 150;
boolean light = false;
//text

String letter = "Q";



void setup() {
  size(400, 500);
  frameRate(20);

  PFont font = loadFont("juice.vlw");
  textFont(font);

  background(256, 256, 256);

  // VERY IMPORTANT: Always initialize the library in the setup
  RG.init(this);

  // Enable smoothing
  smooth();
}


void draw() {
  // Clean frame
  fill(256, 256, 256, 65);
  rect(0, 0, width, height);


  //Slider for points
  stroke(100, 100, 100);
  strokeWeight(.5);
  line(130, 432, 380, 432);
  strokeWeight(2);
  line(350, 432, 380, 432);


  noStroke();
  if ((mousePressed == true) && (mouseY>420) && (mouseY<440) ) {
    sp = int(mouseX);
  }
  fill(90, 90, 90);

  spr = int(random(200, 300));
  if (mouseX<350) {
    ellipse(sp, 432, 15, 15);
  }
  else if (mouseX>=350) {
    ellipse(pmouseX, 432, 15, 15);
  }

  //Slider for distance
  stroke(100, 100, 100);
  strokeWeight(.5);
  line(130, 462, 380, 462);
  noStroke();
  if ((mousePressed == true) && (mouseY>460) && (mouseY<480)) {
    sd = int(mouseX);
  }
  fill(90, 90, 90);
  ellipse(sd, 462, 15, 15);

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
    if (mouseX<350 ) {
      RG.setPolygonizerLength(map(width*(1.2)-(1.5)*sp, 20, 50, 10, 50));
    }
    if ((mouseX>=350)) {
      RG.setPolygonizerLength(map(width*(1.2)-(1.5)*spr, 20, 50, 10, 50));
    }
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
        int o = j - i;
        if (i!=j && k!=1 && o!=1) {
          float d = points[i].dist(points[j]);
          if (d<(sd-100)) {
            line(points[i].x, points[i].y, points[j].x, points[j].y);
          }
        }

        vertex(points[i].x, points[i].y);
      };
    }
  }
  fill(140, 140, 140);
  PFont slidertext = loadFont("ir.vlw");

  textFont(slidertext, 11);
  text("Quantity of Points", 30-(width/2), 342 - (height/2), 120, 120);
  text("Max Line Length", 37-(width/2), 372 - (height/2), 120, 120);
}


