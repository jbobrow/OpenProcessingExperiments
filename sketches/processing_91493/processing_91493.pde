
/*
Eleni Bazezew
2-27-2013
HW6_Transformers
Make something move using pushMatrix() popMatrix() and transform()
*/


float angle =0;

void setup() {
  size(400,200);
  smooth();

}

void draw() {
  background(255);
  noStroke();
  rectMode(CENTER);


  pushMatrix(); // make the first square follow the mouse 
  translate(mouseX,mouseY); 
  fill(18,255,3);
  rect(0,0,80,80);//1
 
  rotate(angle += 0.1);
  fill(255,255,3);
  rect(0,0,50,50);//2
  popMatrix();  
 
  translate(200,50);//moves all 3 squares into position
 
  
  fill(255,3,3);
  rect(0,0,30,30);//3
  
}
