
/* 
 Printing Code ITP
 (Spring 2012)
 
 Assignment Week 2: create a sketch that consists of two seperate shapes.
 One that is inspired by the word "wet", one that is insprired by the word 
 "sharp". Colors are limited to only b/w and the sketch must contain a 
 beginShape() and a for loop through which the vertex points are created.
 */

/* created by Alexandra Coym */

float numVertices = 25;
float vertexDegree = 360 / numVertices;
float numVertices2 = 3;


//setting canvas properties
//float printWidth = 16;
//float printHeight = 23;
//float enlarge = 48;


void setup () { 
  //size(round(printWidth * enlarge), round(printHeight * enlarge));
  size(800,1000);
  background(255);
  smooth();
}

void draw () {
  noLoop();

  // drawing the ink blob as a for loop  
    pushMatrix();
    for (int i=200; i<=width-(width/6); i+=7) {
      strokeWeight(2);
      line(i, height-400, i+60, height-(height/8));
  }
    
    beginShape();
    fill(0);
    noStroke();
    translate(width-(2*width/3), height-(2*height/2.6));
    for (int i = 0; i < numVertices + 3; i++)
    {
      float circleRadius = random(100, 200);
      float x = cos(radians(i * vertexDegree)) * (circleRadius);
      float y = sin(radians(i * vertexDegree)) * (circleRadius);
      curveVertex(x, y);
    }
    endShape();
    popMatrix();

  // adding ink splotch #1
  beginShape();
  fill(0);
  noStroke();
  translate(180, 450);
  for (int i = 0; i < numVertices + 3; i++)
  {
    float circleRadius2 = random(17, 20);
    float x = cos(radians(i * vertexDegree)) * (circleRadius2);
    float y = sin(radians(i * vertexDegree)) * (circleRadius2);
    curveVertex(x, y);
  }
  endShape();

  // adding ink splotch #2  
  beginShape();
  fill(0);
  noStroke();
  translate(70,20);
  for (int i = 0; i < numVertices + 3; i++)
  {
    float circleRadius2 = random(10, 13);
    float x = cos(radians(i * vertexDegree)) * (circleRadius2);
    float y = sin(radians(i * vertexDegree)) * (circleRadius2);
    curveVertex(x, y);
  }
  endShape();

}

/* actual idea with hardcoded paper airplane
 //  fill(0);
 //  rect(0, 550, width, height-500);
 //  pushMatrix();
 //  fill(255);
 //  stroke(1);
 //  translate(250, 800);
 //  rotate(radians(-20));
 //  scale(4);
 //  triangle(30, 30, 30, 60, 110, 20);
 //  triangle(30, 60, 40, 40, 110, 20);
 //  triangle(15, 20, 30, 30, 110, 20);
 //  triangle(40, 40, 60, 60, 110, 20);
 //  popMatrix();
 */


