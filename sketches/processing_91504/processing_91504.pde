
/* EX6_transformers
making someone move*/


void setup(){
  size(400,400);
 smooth();
}
float angle = 0;
void draw(){
  noStroke();
   background(255);
  rectMode(CENTER);
  

  
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle +=5);
  fill(random(0,255),random(0,255),random(0,255));
  rect(0,0,80,80); //1
 
  
  
  fill(random(0,255),random(0,255),random(0,255));
  rect(50,50,50,50); //2
  
 
  fill(random(0,255),random(0,255),random(0,255));
  rect(0,0,30,30); //3
  popMatrix();
    translate(200,50);
  
}
