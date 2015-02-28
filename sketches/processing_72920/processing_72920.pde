
// Authors: Xiaohou Zhou, Farbod Fathalipouri
// Natural System Studio, Stanislav Roudavski & Gwyllim Jahn
// Credits
// Terrain, modified from Transform: Transcoded Landscape by Casey Reas, Chandler McWilliams, and LUST
// Mover, modified from codes by Gwyllim Jahn
// Boids, modified from Flock3D by Matt Wetmore

import peasy.*;
PeasyCam cam;

PImage img;
int[][] values;

//World world;
ArrayList<Mover> pop = new ArrayList<Mover>();

//Mover global properties
int numMovers = 1000;
int searchRad = 3;
float maxSpeed = 2;

// boid global properties
int initBoidNum = 50; //amount of boids to start the program with
BoidList flock1 = new BoidList(0,255);//,flock2,flock3;
boolean smoothEdges = false,avoidWalls = false;

// timer for cpature images
int timeFlag = 0;

void setup() {
  size(800, 600, P3D);
  noFill();
  
  // cam
  cam = new PeasyCam(this, 5500);
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(10000);
  
  // Terrian
  // Extract the brightness of each pixel in the image
  // and store in the "values" array
  img = loadImage("gradient.jpg");
  values = new int[img.width+1][img.height+1];
  loadTerrain();
  
  // movers
  if (true) {
    for (int i = 0; i<numMovers;i++){
      Mover m = new Mover(new PVector(random(img.width),random(img.height)), new PVector(random(-maxSpeed,maxSpeed),random(-maxSpeed,maxSpeed)), random(2));
      pop.add(m); 
    }
  }
  
  // Boids
  //create and fill the list of boids
  if (true) {
    flock1 = new BoidList(initBoidNum,255);
  }
  
}

void draw() {
  background(0);                     // Set black background
  //translate(width/2, height/2, 0);   // Move to the center
  scale(8.0);   // Scale to 800%
  translate(-img.width/2,-img.height/2,0);
  //rotateX(.8);
  
  // draw Terrian
  drawTerrain();
  
  // draw Movers
  for (Mover m:pop){m.run();}
  
  // draw Boids
  flock1.run(avoidWalls);
  //flock2.run();
  //flock3.run();
  if(smoothEdges)
    smooth();
  else
    noSmooth();
  
  //drawFrame();
  //capture();
}

void drawFrame_() {
  noFill();
  stroke(255);

  line(0,0,0,  0,img.height,0);
  line(0,0,122.5,  0,img.height,122.5);
  line(0,0,0,  img.width,0,0);
  line(0,0,122.5,  img.width,0,122.5);
  
  line(img.width,0,0,  img.width,img.height,0);
  line(img.width,0,122.5,  img.width,img.height,122.5);
  line(0,img.height,0,  img.width,img.height,0);
  line(0,img.height,122.5,  img.width,img.height,122.5);
  
  line(0,0,0,  0,0,122.5);
  line(0,img.height,0,  0,img.height,122.5);
  line(img.width,0,0,  img.width,0,122.5);
  line(img.width,img.height,0,  img.width,img.height,122.5);
  
}

void drawFrame() {
  stroke(255);
  noFill();
  pushMatrix();
  translate(img.width/8,img.height/8,60);
  box(img.width/4,img.height/4,122.5);
  popMatrix();
}

void capture() {
  if ( millis() >= timeFlag + 5000 ) {
    timeFlag = millis();
    saveFrame("capture_22_######.jpg");
  }
}

