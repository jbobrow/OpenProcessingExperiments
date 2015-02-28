
//Monissa Chakrabartty YSDN 2012
//Source code partially from Sam Richardson http://openprocessing.org/sketch/50517
 
void setup() {
  size(400,400);
  smooth();
  noStroke();
  rectMode(CENTER);
}
 
void draw() {
   
  background(70);
  
 //large circles
 pushMatrix();
  translate(200,200);
  rotate(-radians(4*frameCount));
  fill(255, 255, 0, 10);
  stroke(100);
  ellipse(50,10,200,200);
  ellipse(-50,10,200,200);
  popMatrix(); 
  
  //middle circles
  pushMatrix();
  translate(200,200);
  rotate(radians(2*frameCount));
  fill(200, 120, 150, 100);
  ellipse(100,0,70,70);
  ellipse(-100,0,70,70);
  ellipse(0,100,70,70);
  ellipse(0,-100,70,70);
  popMatrix();
   
  //outer circles
  pushMatrix();
  translate(200,200);
  rotate(radians(frameCount));
  fill(200, 100, 100);
  ellipse(200,0,40,40);
  ellipse(-200,0,40,40);
  ellipse(0,200,40,40);
  ellipse(0,-200,40,40);
  popMatrix();
  
  //outer circles
  pushMatrix();
  translate(200,200);
  rotate(-radians(2*frameCount));
  fill(200, 100, 100);
  ellipse(200,0,40,40);
  ellipse(-200,0,40,40);
  ellipse(0,200,40,40);
  ellipse(0,-200,40,40);
  popMatrix();
  
    
}

