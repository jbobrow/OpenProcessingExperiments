
/*
Sam Wood
CSE 1341
Lab #4 - simple physics simulation
9/29/10
code borrowed from Ira Greenburg, and then altered
*/


float x1, y1;
float x2, y2;
float x3, y3;
float x4, y4;
float spdX1, spdY1;
float spdX2, spdY2;
float spdX3, spdY3;
float r1;
float r2;
float r3;
float gravity1;
float gravity2;
float gravity3;
float damping;
float friction;

void setup() {
  size(800, 600);
  smooth();
  background(255);
  spdX1 = 4.50;
  spdY1 = 0.0;
  spdX2 = 4.25;
  spdY2 = 0.0;
  spdX3 = 3.75;
  spdY3 = 0;
  r1 = 5.0;
  r2 = 10.0;
  r3 = 15.0;
  gravity1 = .10;
  gravity2 = .15;
  gravity3 = .25;
  damping = .85;
  friction = .85;
  
}

void draw() {
  fill(255);
  rect(-1, -1, width+1, height+1);  
  fill(0);
  stroke(0);
 
  // ball 1
  ellipse(x1, y1, r1*2, r1*2);
  x1+=spdX1;
  spdY1 += gravity1;
  y1+=spdY1;
  
  if (x1>width-r1){
    x1 = width-r1;
    spdX1*=-1;
  } else if (x1 < r1) {
    x1 = r1;
    spdX1*=-1;
  //} if(x>
  } if (y1>height-r1){
    y1 = height-r1;
    spdY1*= -1;
    spdY1*= damping;
    spdX1*= friction;
  } else if (y1<r1) {
    y1 = r1;
    spdY1*=-1;
  } if (x1>550 && y1>200){
    spdX1*=-1;
    spdY1*= -1;
    spdY1*= damping;
    spdX1*= friction;
  } if (x1<150 && y1>575){
    spdX1*=-1;
    spdY1*= -1;
    spdY1*= damping;
    spdX1*= friction;
  }
  
  // ball 2  
  ellipse(x2, y2, r2*2, r2*2);
  x2+=spdX2;
  spdY2 += gravity2;
  y2+=spdY2;
  
  if (x2>width-r2){
    x2 = width-r2;
    spdX2*=-1;
  } else if (x2 < r2) {
    x2 = r2;
    spdX2*=-1;
  } if (y2>height-r2){
    y2 = height-r2;
    spdY2*= -1;
    spdY2*= damping;
    spdX2*= friction;
  } else if (y2<r2) {
    y2 = r2;
    spdY2*=-1;
  } if (x2>550 && y2>200){
    spdX2*= -1;
    spdY2*= -1;
    spdY2*= damping;
    spdX2*= friction;
  } if (x2<150 && y2>575){
    spdX2*=-1;
    spdY2*= -1;
    spdY2*= damping;
    spdX2*= friction;
  }
  
  // ball 3
  ellipse(x3, y3, r3*2, r3*2);
  x3+=spdX3;
  spdY3 += gravity3;
  y3+=spdY3;
  
  if (x3>width-r3){
    x3 = width-r3;
    spdX3*=-1;
  } else if (x3 < r3) {
    x3 = r3;
    spdX3*=-1;
  } if (y3>height-r3){
    y3 = height-r3;
    spdY3*= -1;
    spdY3*= damping;
    spdX3*= friction;
  } else if (y3<r3) {
    y3 = r3;
    spdY3*=-1;
  } if (x3>550 && y3>200){
    spdX3*= -1;
    spdY3*= -1;
    spdY3*= damping;
    spdX3*= friction;
  } if (x3<150 && y3>575){
    spdX3*=-1;
    spdY3*= -1;
    spdY3*= damping;
    spdX3*= friction;
  }

  // rectangles that ball bounce off of
  stroke(0);
  strokeWeight(3);
  fill(255, 5, 5);
  rect(550, 250, 250, 400);
  rect(0, 575, 150, 25);
    
}


  



