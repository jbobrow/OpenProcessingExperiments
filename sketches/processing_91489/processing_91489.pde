
/*
  HW6_Transformers
  Make something move using pushMatrix() popmatrix() and transform()
*/

 float angle = 0;
 



void setup(){
  size(400,200);
  smooth();
}

void draw(){
  background(255);
  noStroke();
  rectMode(CENTER);
  
  
  pushMatrix();//make the first sq. move with mouse
  translate(mouseX,mouseY);
  fill(0);
  rect(50,50,80,80);
  popMatrix();
  
  pushMatrix();
  rotate(angle+=.1);
  fill(100);
  rect(0,0,50,50);
  popMatrix();
  translate(200,50);
  
  
  fill(175);
  rect(50,50,30,30);
}
