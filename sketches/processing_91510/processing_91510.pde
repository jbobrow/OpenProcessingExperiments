
/*
  HW6_Transformers
  Make something move using pushMatrix() popMatrix() and transform()
 Aundie Soriano
  */
   
   
  float angle = 0;
   
void setup(){
  size(400,200);
  background(255);
   
   
}
void draw(){
  noStroke();
  background(255);
  rectMode(CENTER);
   
  pushMatrix();
  translate(mouseX,mouseY);
  fill(0);
  rect(0,0,80,80);
  
   
  rotate(angle+=0.1);
  fill(255);
  rect(0,0,50,50);
  popMatrix();
    translate(200,50);
     
  fill(175);
  rect(0,0,30,30);
}
