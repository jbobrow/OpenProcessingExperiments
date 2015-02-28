
//*****************************************
//*Assignment 4
//*Bryce Lewis
//*bklewis@brynmawr.edu
//*CS 110 - Section 1
//*10/23/2012
//*This program draws an under the sea scene with seaweed.
//*A fish is the mouse pointer.
//*Clicking makes the fish blow bubbles.
//*The background is water with moving waves.
//*****************************************


// Bubble integers
int MAX_NUM_OBJECTS = 40;   //maximum number of bubbles
Bubble[] bubbles = new Bubble[MAX_NUM_OBJECTS];   //declares bubble array
int idxbubbles = 0;
int xloc;
int yloc;
int bubbleAmount = 4;

// Background wave
int xspacing = 6;   // Distance between each ellipse in the wave
int w;              // Width of entire wave
float theta = 0.0;   // Start angle at 0
float amplitude = 10.0;   // Height of wave
float period = 100.0;   // Length of wave
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

// Declares seaweed image
//PImage seaweed;

void setup() {
  seaweed = loadImage("Seaweed.png");
  frameRate(60);
  size(600, 400);
  background();
  smooth();
  
  // Wave declarations
  w = width;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  //Water
  background(80, 100, 250);
  //Wave
  calcWave();
  renderWave();
  //Ground and Seaweed
  fill(100, 70, 0);
  rect(0, height-100, width, height);
  //image(seaweed, 50, 190, 125, 200);
  //image(seaweed, 250, 150, 100, 170);

  //The Fish
  pushMatrix();
  translate(mouseX, mouseY-10);
  noStroke();
  //fish tail
  fill(150, 0, 150);
  triangle (50, 0, 90, 40, 80, 0);
  triangle (50, 0, 90, -40, 80, 0);
  //fish top and bottom fins
  triangle(20, -25, 60, -40, 60, -20); 
  triangle(25, 20, 50, 40, 55, 20); 
  //fish body
  fill(250, 0, 250);
  ellipse(35, 0, 70, 60);
  //fish side fin
  fill(150, 0, 150);
  beginShape();
  vertex(40, 10);
  vertex(50, 15);
  vertex(50, -15);
  vertex(40, 0);
  endShape();
  //fish eye
  stroke(0);
  fill(255);
  ellipse(20, -5, 20, 20);
  fill(0);
  ellipse(18, -5, 16, 16);
  fill(255);
  ellipse(18, -8, 5, 5);
  //fish lips
  fill(255, 0, 0);
  bezier(5, 10, -5, 20, -5, 10, 5, 10);
  bezier(5, 10, -5, -20, -5, 10, 5, 10);
  popMatrix();

  // Creation of bubbles via array
  for (int i = 0; i < bubbles.length; i++) {
    if (bubbles[i] != null) {
      bubbles[i].step();
      bubbles[i].display();
    }
  }
  // more seaweed
  //image(seaweed, 350, 120, 200, 300);
}

// When the mouse is clicked, the fish blows bubbles
void mousePressed() {
  for (int i = 0; i < bubbleAmount; i++) {
    //sets bubble initiation location
    xloc=mouseX;
    yloc=mouseY;
    // creates a new bubble based on the location clicked
    //and stores it into myObjects[idxMyObjects]
    bubbles[idxbubbles] = new Bubble(xloc, yloc);
    idxbubbles = (idxbubbles+1) % MAX_NUM_OBJECTS;
  }
}

void calcWave() {
  // Speed of Wave
  theta += 0.2;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

// Wave function
void renderWave() {
  stroke(150, 170, 255);
  fill(150, 170, 255);
  // The wave is composed of many ellipses
  for (int i = 20; i < height-120; i+=80) {
    for (int x = 0; x < yvalues.length; x++) {
      ellipse(x*xspacing, yvalues[x] + i,3,3);
    }
  }
}

void background() {
  background(80, 100, 250);
  fill(100, 70, 0);
  rect(0, height-100, width, height);
}

// Bubble Object
class Bubble {
  // Fields
  float ay = .1;   //force of floatation
  float x;   //x location
  float y;   // y location
  float vy;   //y velocity
  float vx;   //x velocity
  float d;   //size

  // Constructor
  Bubble (float xCoordinate, float yCoordinate) {
    x = xloc;
    y = yloc;
    vy = random(-2, -1);
    vx = random(-1, 1);
    d = random(5, 20);
  }

  // Draws bubble
  void display() {
    fill(235, 235, 255, 100);
    ellipse(x, y, d, d);
  }

  // Updates bubble movement
  void step() { 
    x = x+vx;
    y = vy+y;
    vy = vy-ay;
  }
}
