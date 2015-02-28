
/* 
HW6_Transformer
Make something move using pushMatrix() popMatirx() and Translate
*/

float angle = 0;
void setup(){
  size(400,200);
  background(255,0,0,0);
}

void draw(){
  background(255);
  stroke(10);
  rectMode(CENTER);
 

  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle +=.15);
  fill (random (0,255), random (0,255), random (0,255));
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle +=.5);
   fill (random (0,255), random (0,255), random (0,255));
  rect(0,0,50,50);
  popMatrix();
  
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle +=.10);
  fill (random (0,255), random (0,255), random (0,255));
  rect(0,0,30,30);
  popMatrix();
  translate(200,50);
}
