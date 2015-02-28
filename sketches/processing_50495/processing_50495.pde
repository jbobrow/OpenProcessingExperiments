
// particle sphere
// mjmurdock 2012

// IMPORTS
//import processing.opengl.*;
PImage bg;


//global variables ///////////////////////////
int numPart = 60;
float[] xPos = new float[numPart];
float[] yPos = new float[numPart];
float[] thetaX = new float[numPart];
float[] thetaY = new float[numPart];
float[] thetaZ = new float[numPart];
float[] sphereRad = new float[numPart];
float[] offset = new float[numPart];


//SETUP /////////////////////////////////////
void setup() {
  size(700, 700, P3D);
  lights();
  background(100);
  smooth();

  //load image
  bg = loadImage("BG.jpg");


  // fill arrays
  for (int i=0; i<numPart; i++) {
    xPos[i] = 0;
    yPos[i] = 0;
    thetaX[i] = random(360);
    thetaY[i] = random(360);
    thetaZ[i] = random(360);
    sphereRad[i] = random(10, 30);
    offset[i] = random(2, 4);
  }
  println(thetaX);
  println(thetaY);
  println(thetaZ);
}


//DRAW /////////////////////////////////////
void draw() {
  //setup
  frameRate(24);
  background(100);
  // draw BG image
  pushMatrix();
  translate(0, 0, -800);
  imageMode(CENTER);
  image(bg, width/2, height/2, width*2.5, height*2.5);
  popMatrix();


  translate(width/2, height/2);
  lights();

  // light stuff
  pointLight(51, 102, 126, 0, 0, 0);
  pointLight(255, 0, 0, 300, -600, 240);
  lightSpecular(204, 204, 204); 

  // multipliers
  float inc = 30;

  // mouse interaction
  rotateX(radians(-mouseY/2));
  rotateY(radians(-mouseX/2));


  // animate sphereRad
  for (int i=0; i<numPart; i++) {
    sphereRad[i] = sphereRad[i]+sin(frameCount/offset[i]);
  }

  // draw particle sphere
  drawParticles(255);





  fill(0, 255);
  specular(255, 255, 0);
  shininess(5);
  sphereDetail(10);
  sphere(210);
  
  save("particle_ball.jpg");
  
}


void drawParticles (float sphereColor) {
  for (int i = 0; i<numPart; i++) {
    pushMatrix();
    rotateX(radians(thetaX[i]));
    rotateY(radians(thetaY[i]));
    rotateZ(radians(thetaZ[i]));
    translate(0, 0, 200);

    // sphere details
    pushMatrix();

    noStroke();
    fill(sphereColor);
    specular(255, 255, 0);
    shininess(5);
    sphereDetail(6);
    sphere(sphereRad[i]);
    popMatrix();

    popMatrix();
  }
}


