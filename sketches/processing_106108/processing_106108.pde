
void setup(){
  size(800,800);
  background(255);
  noStroke();
  rectMode(CORNERS);
}

void draw(){
  background(255);
  
  fill(255,100,100);
  rect(mouseY,mouseX,400,400);
  
  fill(50,200,255,100);
  rect(mouseX,mouseY,400,400);
  
  
}
  


