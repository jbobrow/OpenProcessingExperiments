
void setup(){
  size(200, 200);
  smooth();
}//set up

void draw(){
  background(255);
  stroke(0);
  fill(175);
  
  int mx=constrain(mouseX, 0, width);
  int my=constrain(mouseX, 0, height);
  
  translate(mx, my);
  ellipse(0,0,8,8);
  
  translate(100,0);
  ellipse(0,0,8,8);
  
  translate(0,100);
  ellipse(0,0,8,8);
  
  translate(-100,0);
  ellipse(0,0,8,8);
  }
