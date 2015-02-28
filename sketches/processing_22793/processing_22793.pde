
// Basic Diffusion Limited Aggregarion model in a body centered lattice
// Created by David Andreen

import peasy.*;

// Create a camera from PeasyCam library
PeasyCam cam;

// Set distance Centre to Centre
float cc = 12;
float scaleFactor = cc/4;

//Set extents of lattice
int extentX = 40;
int extentY = 40;
int extentZ = 60;

//Initiate point lattice (as a 3D array)
Point  [][][] lattice = new Point  [extentX][extentY][extentZ];

//Create a Walker in random location
Walker walker = new Walker (random(2,extentX-3),random(2,extentY-3),random(3,extentZ-4)); 

void setup() {
  size(800,600,P3D);
  cam = new PeasyCam(this, extentX*cc/2,extentY*cc/2,extentZ*cc/4, 800);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  smooth();

  //Create points in lattice (populate 3D array)
  for (int i=0; i<extentX; i++) {
    for (int j=0; j<extentY; j++) {
      for (int k=0; k<extentZ; k++) {
        lattice[i][j][k] = new Point (i,j,k);
      }
    }
  }
}

void draw() {
  //set a background color which clears the draw area in each frame
  background(194);

  //draw origo
  stroke(255,0,0);
  line (0,0,0,20,0,0);
  stroke(0,255,0);
  line (0,0,0,0,20,0);
  stroke(0,0,255);
  line (0,0,0,0,0,20);

  //create a walker at random location
  if (walker.complete == true) {
    walker= new Walker (random(2,extentX-2),random(2,extentY-2),random(3,extentZ-4));
  }

  //Walker wanders around and looks for position where it has a neighbour, 
  //then turns ON it's current position and sets complete to TRUE
  while (walker.complete == false) {
    walker.step();
    walker.check();
  }

  //Call function which draws lattice and octahedrons
  fill(255);
  for (int i=0; i<extentX; i++) {
    for (int j=0; j<extentY; j++) {
      for (int k=0; k<extentZ; k++) {
        lattice[i][j][k].display();
      }
    }
  }
}


