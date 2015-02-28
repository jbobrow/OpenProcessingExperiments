
void setup(){
  size(400,400);
  background(50,220,185);
  strokeWeight(0.1);
  stroke(255);
}

void draw(){
  for(int i = 10; i<400; i= i+150){
    stroke(255);
    line(mouseX, mouseX, i, mouseY);
  
  }
  
}

