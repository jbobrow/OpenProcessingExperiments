
/* @pjs preload="norfolk.jpg"; 
 */

float x,y,z;
//PShape s;
PImage p;

void setup() {
  size(500,500,P3D);
  x = width/2;
  y = height/2;
  z = 0; 
  smooth();
  //s = loadShape("drawing2.svg");
  p = loadImage("norfolk.jpg");
}

void draw() {
  background(127);
  //shape(s);
  //image(p,0,0);
  
  translate(x,y,0);
  
  stroke(0);
  fill(255);
    rotateY(0.02*z*PI/8);
  beginShape();
  texture(p);
  vertex(-141,-100,-1,0,0);
  vertex(141,-100,-1,282,0);
  vertex(141,100,-1,282,200);
  vertex(-141,100,-1,0,200);
  
  /*vertex(-141,100,1);
  vertex(-141,-100,1);
  vertex(141,-100,1);
  vertex(141,100,1);*/
  endShape();

  //rectMode(CENTER);
    //box(296,210,2);
   //translate(0,0,1); 
  //rect(0,0,286,200);
  //translate(0,0,-2);
  //rect(0,0,286,200);

spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  z++; // The box moves forward as z increments.
}




