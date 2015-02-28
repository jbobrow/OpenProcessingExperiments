
float angle =0;

void setup (){
  size(400,200);
  smooth();
}

void draw(){
   background(255);
  noStroke();
  rectMode(CENTER);
  
 
  
  pushMatrix(); //make the first square folllow the mouse
  translate(mouseX,mouseY);
  fill(0);
  rect(50,50,80,80);
  
  
  rotate(angle+=0.1);
  fill(100);
  rect(50,50,50,50);
  popMatrix();
   translate(200,50); //move all 3 xsquares into posistion 
  
  fill(175);
  rect(8,8,30,30);
}
