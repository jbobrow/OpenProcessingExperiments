
/*
HX6_Transformers
Make something move using push matrix*/

  float angle=0;
  
void setup(){
  size(400,200);

}

void draw(){
  background(255);
  noStroke();
   rectMode(CENTER);
  
  pushMatrix();
  translate(mouseX,mouseY);
  fill(0);
  rect(100,100,80,80);
 
   rotate(angle+=.1);
   fill(100);
  rect(100,100,50,50);
  popMatrix();
  
   fill(175);
  rect(100,100,30,30);
}
