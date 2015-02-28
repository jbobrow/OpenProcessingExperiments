
//Kate Easton
//z3290017
//Lesson One Project

void setup(){
  size(200,200);
  background(0);
}

void draw(){
  stroke(0);
  fill(240-mouseX,130-mouseX,45+mouseX);
  triangle(20,80,50,20,80,80);
  fill(180,60,35);
  rect(mouseX,mouseY,40,40);
}

