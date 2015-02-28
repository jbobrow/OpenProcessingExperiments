
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 14-8: rotateY
float theta = 0.0;
float theta1 = 0.0;
float theta2 = 0.0;
float theta3 = 0.0;
float theta4 = 0.0;
float theta5 = 0.0;

void setup() {
  size(300,400,P3D);
}

void draw() {
  background(0);
  stroke(0);
  
  
  pushMatrix();
  fill(mouseX+100,0,mouseX+100);
  translate(25, height/2);
  rotateY(theta1);
  rectMode(CENTER);
  rect(0,0,50,370);
  if (mouseX>=25){
  theta1 += 0.03;
  }
  popMatrix();
  
  pushMatrix();
  fill(mouseX/50+100,0,mouseX+100);
  translate(75, height/2);
  rotateY(theta2);
  rectMode(CENTER);
  rect(0,0,50,370);
  if (mouseX>=75){
  theta2 += 0.03;
  }
  popMatrix();
  
  pushMatrix();
  fill(mouseX/50+50,0,mouseX+100);
  translate(125, height/2);
  rotateY(theta);
  rectMode(CENTER);
  rect(0,0,50,370);
  if (mouseX>=125){
  theta += 0.03;
  }
  popMatrix();
  
  pushMatrix();
  fill(mouseX/50+100,0,mouseX+100);
  translate(175, height/2);
  rotateY(theta3);
  rectMode(CENTER);
  rect(0,0,50,370);
  if (mouseX>=175){
  theta3 += 0.03;
  }
  popMatrix();
  
  pushMatrix();
  fill(mouseX/30+20,0,mouseX+100);
  translate(225, height/2);
  rotateY(theta4);
  rectMode(CENTER);
  rect(0,0,50,370);
  if (mouseX>=225){
  theta4 += 0.03;
  }
  popMatrix();
  
   pushMatrix();
   fill(mouseX+20,0,mouseX+100);
  translate(275, height/2);
  rotateY(theta5);
  rectMode(CENTER);
  rect(0,0,50,370);
  if (mouseX>=275){
  theta5 += 0.03;
  }
  popMatrix();
  
  
  
}

