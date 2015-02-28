


void setup(){
  size(450,450);
  background(255);
  noStroke();
}

void draw(){
  
  float r =map(mouseX,0,width,0,255);
  float g =map(mouseY,0,width,0,255);
  
  fill(r,g,100);
  rect(0,0,width,height);
}

