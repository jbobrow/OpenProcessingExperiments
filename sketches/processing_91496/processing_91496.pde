
/*
HW_Transformers
make something move using pushMatrix() poMatrix() and transform()
*/
float angle=0;

void setup(){
  size(400,200);
}

void draw(){
  background(255);
  noStroke();
  rectMode(CENTER);
  
  pushMatrix();// make first square follow mouse
  translate(mouseX,mouseY);
  rotate(angle+=.3);
  fill(random(0,255),random(0,255),random(0,255));
  rect(0,0,80,80);//1
  
  
  
  fill(random(0,255),random(0,255),random(0,255));
  rect(50,50,50,50);//2
  
  fill(random(0,255),random(0,255),random(0,255));
  rect(0,0,30,30);//3
  popMatrix();
  translate(200,50); //move all 3 squares into position
}
