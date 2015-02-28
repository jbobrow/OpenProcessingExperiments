
/*
  HW6_Transformers
  make something move using pushMatrix() popMatrix() and transform()
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
  
  pushMatrix();  //make first square follow mouse
  translate(mouseX,mouseY);
  fill(0);
  rect(0,0,80,80);//1

  rotate(angle+=0.1);
  fill(100);
  rect(0,0,50,50);//2
  popMatrix();
  translate(200,50);  //move all 3 squares
  
  fill(175);
  rect(0,0,30,30);
}
