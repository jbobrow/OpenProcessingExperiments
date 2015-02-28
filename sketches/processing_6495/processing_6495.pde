
import processing.xml.*;
import geomerative.*;

import megamu.mesh.*;

//Setup the BG
PImage bg;

// Setup Voronoi Object
Delaunay myDelaunay;

float[][] points;
float[][] myEdges;
int col[];

// Declare an SVG object
RShape grp;

RPoint[][] pointPaths;

float[] rand;

float startX,startY,endX,endY;
float[][] regionCoordinates;

void setup() {
  size(800,600);

  RG.init(this);
  RG.ignoreStyles();

  RG.setPolygonizer(RG.ADAPTATIVE);

  grp = RG.loadShape("peter.svg");
  grp.centerIn(g, 100, 1, 1);

  pointPaths = grp.getPointsInPaths();

  // initialize points and calculate diagrams
  initMesh();
  smooth();
  
  bg = loadImage("bg.png");
}

void draw() {
  image(bg, 0, 0);

  pushMatrix();
  translate(width/2, height/2);

  for(int i=0; i< myEdges.length; i++) {
    strokeWeight(2);
    stroke(255);
    startX = myEdges[i][0];
    startY = myEdges[i][1];
    endX = myEdges[i][2];
    endY = myEdges[i][3];
    line(startX, startY, endX, endY);
  }


  for(int i = 0; i<pointPaths.length; i++){
    strokeWeight(3);
    stroke(255);
    noFill();
    beginShape();
    for(int j = 0; j<pointPaths[i].length; j++){



      vertex(pointPaths[i][j].x, pointPaths[i][j].y);

      if(i < pointPaths.length) {
        fill(255, 50);
        noStroke();
        ellipse(pointPaths[i][j].x, pointPaths[i][j].y, rand[i], rand[i]);
        strokeWeight(3);
        stroke(255);
        noFill();
      }

    }
    endShape();

  }
  popMatrix();
}

void initMesh() {
  // is points array is null then initialize it
  initPoints();

  myDelaunay = new Delaunay( points );

  myEdges = myDelaunay.getEdges();
}

void initPoints() {
  points = new float[pointPaths.length + 10][2];
  rand = new float[pointPaths.length];

  for(int i=0; i< points.length; i++) {
    if(i < pointPaths.length) {
      for(int j=0; j< pointPaths[i].length; j++) {
        points[i][0] = pointPaths[i][j].x; // first point, x
        points[i][1] = pointPaths[i][j].y; // first point, y
        rand[i] = random(0,100);
        println("x: " + points[i][0] + " y: " + points[i][1]);
      }
    } 
    else {
      points[i][0] = random(-width, width); // first point, x
      points[i][1] = random(-height, height); // first point, y
    }
  }
}



void mousePressed() {
  initMesh();
}












