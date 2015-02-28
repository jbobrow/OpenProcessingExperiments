
/*****
* Assignment Number 3
* Susan Anderson
* CS 110 - 001
* Submitted 10/2/12
*
* This program shows three frogs and three bugs.
* The frogs are randomly placed, randomly sized, 
* and lash out their tongues when the mouse is hovering
* over them.  The bugs' shapes and sizes are also randomly
* determined.  Their bodies' colors change according
* to the position of the mouse.
*****/

//position of lower left frog
float a = random (100, 200);
float b = random (650, 750);
//position of mid-height right frog
float d = random (600, 700);
float e = random (550, 650);
//position of upper middle frog
float f = random (300, 500);
float g = random (450, 550);

//width/height lower left frog
float h = random (175, 200);
float i = random (150, 175);
//width/height mid-height right frog
float j = random (140, 150);
float k = random (130, 140);
// width/height upper right frog
float l = random (90, 100);
float m = random (80, 90);

//position of bugs
float n = random (0, 800);
float o = random (0, 300);
float q = random (0, 300);
float s = random (0, 300);

//width/heights of bugs
float p = random (15,25);
float r = random (5,15);
float t = random (15,25);
float u = random (5,15);
float v = random (15,25);
float w = random (5,15);

//speed of bugs
float speed = 1;

float objectWidth = 300;
float objectHeight = 200;

void setup() {

  size(800, 800);
  background(0, 160, 255);
  smooth();
  noStroke();
  //water
  fill(0,0,255);
  triangle(0,300, 0,3000, 3000,300);
  //small, upper center frog
  fill(0,50,255);
  drawFrog(f,g, l, m);
  //medium, mid-height right frog
  drawFrog(d,e, j,k);
  //large, lower left frog
  drawFrog(a,b, h,i);
  //draw bugs
  drawBug(n,o, p,r);
  drawBug(n,q, t,u);
  drawBug(n,s, v,w);
}

void draw() {
  background(0, 160, 255);
  //water
  fill(0,0,255);
  triangle(0,300, 0,3000, 3000,300);
  //small, upper center frog
  fill(0, 50, 255);
  drawFrog(f,g, l,m);
  //medium, mid-height right frog
  drawFrog(d,e, j,k);
  //large, lower left frog
  drawFrog(a,b, h,i);
  //draw bugs
  drawBug(n,o, p,r);
  drawBug(n,q, t,u);
  drawBug(n,s, v,w);

  n= n+speed;

  if ((n>790) || (n<10)) {
    speed= speed*-1;
  }
}
/*
*This function draws a frog.
*Inputs: x position, y position, width, height
*Outputs: a drawing of a frog
*/
void drawFrog(float x, float y, float objectWidth, float objectHeight) {
  //lilly pad
  stroke(0);
  fill(40, 90, 50);
  ellipse(x, y-objectWidth*.33, objectWidth*1.5, objectHeight*1.33);

  //frog
  noStroke();
  fill(0, 255, 0);
  //body
  arc(x, y, objectWidth, objectHeight, 3.142, 6.283);
  //legs
  arc(x+objectWidth*.35, y, objectWidth*.3, objectHeight*.95, 3.142, 6.283);
  arc(x-objectWidth*.35, y, objectWidth*.3, objectHeight*.95, 3.142, 6.283);
  //feet
  arc(x+objectWidth*.5, y, objectWidth/4, objectHeight/4, 3.142, 6.283);
  arc(x-objectWidth*.5, y, objectWidth/4, objectHeight/4, 3.142, 6.283);
 
  //head
  ellipse(x, y-objectWidth*.65, objectWidth*.75, objectHeight*.83);
  //green part of eyes
  ellipse(x+objectWidth*.2, y-objectHeight, objectWidth*.375, objectHeight*.5);
  ellipse(x-objectWidth*.2, y-objectHeight, objectWidth*.375, objectHeight*.5);
  //whites of eyes
  fill(255);
  ellipse(x+objectWidth*.2, y-objectHeight, objectWidth*.3, objectHeight*.4);
  ellipse(x-objectWidth*.2, y-objectHeight, objectWidth*.3, objectHeight*.4);
  //pupils
  fill(0);
  ellipse(x+objectWidth*.2, y-objectHeight, objectWidth*.2, objectHeight*.267);
  ellipse(x-objectWidth*.2, y-objectHeight, objectWidth*.2, objectHeight*.267);
  //mouth
  arc(x, y-objectHeight*.75, objectWidth*.55, objectHeight*.2267, 0.371, 2.707);
  
  //tongue
  if (mouseX >= x-objectWidth*1.5/2 && mouseX <= x+objectWidth*1.5/2 && mouseY >= y-objectHeight*1.33/2 && mouseY <= y+objectHeight*1.33/2) {
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(x-5, y-objectHeight*.75-295, 10, 300);
  }
  else {
    fill (255, 0, 0);
    rectMode(CENTER);
    rect(x, y-objectHeight*.75+5, 10, 10);
  }
}

/* This fucntion draws bugs, and determines the position of the head
*of the bug based on direction of travel.
*Inputs: x positon, y position, width, height
*Outputs: a picture of a bug
*/
void drawBug(float x, float y, float objectWidth, float objectHeight) {
  //body
  fill(mouseX*.317, mouseY*.317, mouseY*.317);
  ellipse (x, y, objectWidth, objectHeight);
  //head
  if (speed>0) {
    fill(0);
    ellipse(x+objectWidth/2, y, objectHeight, objectHeight);
  }
  else if (speed<0) {
    fill(0);
    ellipse(x-objectWidth/2, y, objectHeight, objectHeight);
  }
  //wings
  fill(0, 160, 160, 160);
  ellipse(x, y-objectHeight/1.5, objectHeight, objectWidth/1.5);
}



