
/*
EX6_Transform
Makesomething move using pushMatrix() popMatrix() and transform()
Kristian Hallegado
2/28/13
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
  
  pushMatrix(); //Make the first square follow the mouse
  translate(mouseX,mouseY);
  fill(0);
  rect(0,0,80,80);//1

  rotate(angle+=.1);
  fill(100);
  rect(0,0,50,50);//2
  popMatrix();
  translate(200,50);
  
  fill(175);
  rect(0,0,30,30);//3
}
