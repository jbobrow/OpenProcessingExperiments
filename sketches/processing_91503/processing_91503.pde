
/*
  EX6_Transformers
  Make something move using pushMatrix() popMatrix() and transform()
*/

float angle=0;

void setup(){
  size(400,200);
  background(255);
  smooth();

}

void draw(){
  noStroke();
  background(255);
  rectMode(CENTER);
  
  pushMatrix();
  translate(mouseX,mouseY);
  fill(0);
  rect(0,0,80,80);//1
  
  rotate(angle+=.1);
  fill(100);
  rect(50,50,50,50);//2
  popMatrix();
  translate(200,50);
  
  fill(175);
  rect(0,0,30,30);//3
}
