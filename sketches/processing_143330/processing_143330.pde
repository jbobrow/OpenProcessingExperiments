
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: An Junyeong
// ID: 201420088

float angle; 

void setup() 
{  
  size(640,360); 
  background(0,0,20);
  smooth ();
} 


void draw() 
{ 
  noStroke(); 
  fill(255,10);
  rectMode(UP);
  rect(0,0,width,height);
  // rotation angle

  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0); 
  line(-width,-height,width,height); 
  popMatrix(); 
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  line(-width,-height,width,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  line(-width/2,-height,width/2,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  line(-width,-height/2,width,height/2); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(4); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  rect(-width/3,-height,width/3,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(4);
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  stroke(0,0,30);
  rect(-width/3,-height,width/3,height);
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5);
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  line(-width/6,-height,width/6,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  line(-width/6,-height,width/6,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(3); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  ellipse(-width/9,-height,width/9,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(3); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  ellipse(-width/9,-height,width/9,height); 
  popMatrix();

  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0); 
  line(-width,-height,width,height); 
  popMatrix(); 
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  line(-width,-height,width,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  line(-width/2,-height,width/2,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  line(-width,-height/2,width,height/2); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(4); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  rect(-width/3,-height,width/3,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(4);
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  stroke(0,0,30);
  rect(-width/3,-height,width/3,height);
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5);
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  line(-width/6,-height,width/6,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(5); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  line(-width/6,-height,width/6,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(3); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  ellipse(-width/9,-height,width/9,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(3); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  ellipse(-width/9,-height,width/9,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(3); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(-angle); 
  stroke(0,0,30); 
  rect(-width/2,-height,width/2,height); 
  popMatrix();
  
  angle += 0.001;
  strokeWeight(3); 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(angle); 
  stroke(0,0,30); 
  rect(-width/2,-height,width/2,height); 
  popMatrix(); 
}

