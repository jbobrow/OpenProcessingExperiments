
float originX;
float originY;

void setup(){
  size(400, 400);
  smooth();
  frameRate(60);
  originX = width/2;
  originY = height/2;
  ellipseMode(CENTER);
}

void draw(){
  background(60);
  
//========================================================

  float x = (mouseX / 400.0)+.15;
  float yColor = (mouseY / 400.0);
  println(mouseX + " " + mouseY);
  fill(60);
  strokeWeight(6*x);
  stroke(280, 120, 255*yColor);
 
  ellipse(originX, originY, 480*x, 480*x);
  
//========================================================

// Left A (outer shape)  
  beginShape();
  println(x);
  vertex        (originX - 170*x, originY + 140*x);
  bezierVertex  (originX - 200*x, originY + 100*x, originX - 220*x, originY + 50*x,  originX - 220*x, originY);
  bezierVertex  (originX - 220*x, originY - 90*x,  originX - 170*x, originY - 160*x, originX - 90*x,  originY - 200*x);
  vertex        (originX - 90*x,  originY + 200*x);
  bezierVertex  (originX - 90*x,  originY + 200*x, originX - 120*x, originY + 190*x, originX - 140*x, originY + 170*x);
  vertex        (originX - 140*x, originY + 50*x);
  vertex        (originX - 170*x, originY + 50*x);
  vertex        (originX - 170*x, originY + 140*x);
  endShape();

 // Left A (inner shape)  
  beginShape();
  vertex        (originX - 140*x, originY);
  vertex        (originX - 170*x, originY);
  bezierVertex  (originX - 170*x, originY - 40*x,  originX - 160*x, originY - 70*x,  originX - 140*x, originY - 100*x);
  vertex        (originX - 140*x, originY);
  endShape();

//========================================================

// S
  beginShape();
  vertex        (originX - 80*x,  originY - 205*x);
  bezierVertex  (originX - 55*x,  originY - 215*x, originX - 30*x,  originY - 220*x, originX,        originY - 220*x);
  bezierVertex  (originX + 30*x,  originY - 220*x, originX + 55*x,  originY - 215*x, originX + 80*x, originY - 205*x);
  vertex        (originX + 80*x,  originY - 150*x);
  bezierVertex  (originX + 55*x,  originY - 160*x, originX + 30*x,  originY - 170*x, originX,        originY - 170*x);
  bezierVertex  (originX - 10*x,  originY - 170*x, originX - 20*x,  originY - 170*x, originX - 30*x, originY - 167*x);
  vertex        (originX - 30*x,  originY - 110*x);
  vertex        (originX + 80*x,  originY - 70*x);
  vertex        (originX + 80*x,  originY + 205*x);
  bezierVertex  (originX + 55*x,  originY + 215*x, originX + 30*x,  originY + 220*x, originX,        originY + 220*x);
  bezierVertex  (originX - 30*x,  originY + 220*x, originX - 55*x,  originY + 215*x, originX - 80*x, originY + 205*x);
  vertex        (originX - 80*x,  originY + 150*x);
  bezierVertex  (originX - 55*x,  originY + 160*x, originX - 30*x,  originY + 170*x, originX,        originY + 170*x);
  bezierVertex  (originX + 10*x,  originY + 170*x, originX + 20*x,  originY + 170*x, originX + 30*x, originY + 167*x);
  vertex        (originX + 30*x,  originY - 30*x);
  vertex        (originX - 80*x,  originY - 70*x);  
  vertex        (originX - 80*x,  originY - 205*x);
  endShape();

//========================================================

// Right A (outer shape)  
  beginShape();
  vertex        (originX + 170*x, originY + 140*x);
  bezierVertex  (originX + 200*x, originY + 100*x, originX + 220*x, originY + 50 *x, originX + 220*x, originY);
  bezierVertex  (originX + 220*x, originY - 90 *x, originX + 170*x, originY - 160*x, originX + 90 *x, originY - 200*x);
  vertex        (originX + 90 *x, originY + 200*x);
  bezierVertex  (originX + 90 *x, originY + 200*x, originX + 120*x, originY + 190*x, originX + 140*x, originY + 170*x);
  vertex        (originX + 140*x, originY + 50 *x);
  vertex        (originX + 170*x, originY + 50 *x);
  vertex        (originX + 170*x, originY + 140*x);
  endShape();

// Right A (inner shape)  
  beginShape();
  vertex        (originX + 140*x, originY);
  vertex        (originX + 170*x, originY);
  bezierVertex  (originX + 170*x, originY - 40*x,  originX + 160*x, originY - 70*x, originX + 140*x, originY - 100*x);
  vertex        (originX + 140*x, originY);
  endShape();
 
}



