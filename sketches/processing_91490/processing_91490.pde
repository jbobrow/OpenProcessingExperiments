
/*
  
  HW_Transformers
  Move something with using pushMartix() popMatrix() amd tramsform()

*/


float angle = 0;


void setup(){
  size(400,200);
  smooth();
}

void draw (){
  background(255);
  noStroke();
  fill(0);
  
  pushMatrix();
  translate(mouseX,mouseY);
  rectMode(CENTER);
  rect (0,0,80,80);//1
  
  rotate(angle += .1);
  fill(100);
  rect (0,0,50,50);//2
  popMatrix();
  
  
  fill(175);
  rect (0,0,30,30);//3

}
