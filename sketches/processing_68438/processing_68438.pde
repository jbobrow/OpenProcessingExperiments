
//Rohan Rathod, andrewid: rkrathod
//Hw_2, Tuesday 4 Sep 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Rohan Rathod, 2012. 

//==========================================================================================
void setup() {
  size(400, 400);
  background(80);
  smooth();
  frameRate(10);
}
//==========================================================================================
void draw() {

  background(80);
  
  //DEFINE VARIBALES
  float x = 200;
  float y = 200;
  float rad = 300;
  noFill();
  strokeWeight(8);
  
  //MAIN ELLIPSE
  float r = random(0, 100);

  float b = random(50, 255);

  float g = random(50, 255);
  
  float opacity = random(0, 255);
  
  fill(r,g,b, opacity);
  stroke(r+20, g+20, b+20);
  ellipse(x, y, rad, rad);

  //ELLIPSE RECURSION STATEMENT
  for (float A = 0; A < 1000; A = A + 10) {
    noFill();
    strokeWeight(1);
    ellipse(x, y, A, A);
  }

  //SINGLE SHAPE FOR INITIALS R AND R
  strokeWeight(5);
  stroke(r-50, g-50, b-50);
  beginShape();
  vertex(x-rad/4, y+rad/2.8);
  vertex(x-rad/4, y-rad/2.8);
  bezierVertex(x - rad/2.5, y-rad/2.8, x - rad/2.5, y - rad/4, x - rad/4, y-rad/4); 
  vertex(x - rad/4, y-rad/4);
  vertex(x - rad/2.8, y+rad/3.5);
  vertex(x + rad/4, y - rad/2.8);
  bezierVertex(x + rad/2, y, x + rad/1.6, y + rad/3.5, x, y-11);
  vertex(x, y+rad/2.5);
  endShape();
  
  //saveFrame("hw2.jpg");
}
