
/*
  HW6_Transformers
  Making something move using pushMatrix() popMatrix() and Translate()
*/

float angle = 0;

void setup(){
  size(400,200);
  smooth();
}

void draw(){
  background(255);
  noStroke();
  rectMode(CENTER);
  
  
  
  pushMatrix();//make the first square follow the mouse
  translate(mouseX,mouseY);
  rotate(angle += 200);
  fill(random(0,255),random(0,255),random(0,255));
  rect(0,0,80,80);//1
  
  rotate(angle += .1);
  fill(random(0,255),random(0,255),random(0,255));
  rect(0,0,50,50);//2
 
  fill(random(0,255),random(0,255),random(0,255));
  rotate(angle += 200);
  rect(0,0,30,30);//3
  translate(200,50);//move all 3 squares into position
  popMatrix();
}
  
}
