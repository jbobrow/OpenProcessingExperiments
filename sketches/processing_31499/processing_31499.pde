
  
void setup(){
  
  size(500,500);
  background(0);
}

void draw(){
  
  stroke(209,32,109,50);
  strokeWeight(2);
  line(0,mouseX,mouseY,500);
  line(500,mouseX,mouseY,0);
  line(500,mouseX,mouseY,500);
  line(0,mouseX,mouseY,0);
  
}

