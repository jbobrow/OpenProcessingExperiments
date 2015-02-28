
/*
Ex 6 Transformeres
Make something move uisng pudhMatrix() popmatrix() and transform()
*/
 float angle = 0;
void setup(){
  size(400,200);
  smooth();
 
}
 
void draw(){
  noStroke();
  background(255);
  rectMode(CENTER);
   
  pushMatrix();// make the first square follow the mouse
  translate(mouseX,mouseY);
  fill(0);
  
  rect(0,0,80,80);
 // popMatrix();
   
 //pushMatrix();
 
  rotate(angle+=.1);
  fill(100);
  rect(50,50,50,50); // 2
  popMatrix();
  translate(200,50); // moves all 3 boxes into position
   
  fill(175);
  rect(0,0,30,30);
}
