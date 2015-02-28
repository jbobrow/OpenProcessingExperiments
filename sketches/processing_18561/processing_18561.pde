
void setup(){
  size(300,300);
  background(255,255,255);
}

void draw(){
}

void mouseDragged(){
  
  int x=mouseX/12;
  int y=mouseY/12;
  noStroke();
  fill(235,10*x,10*y);
rect(12*x,12*y,12,12);
}

