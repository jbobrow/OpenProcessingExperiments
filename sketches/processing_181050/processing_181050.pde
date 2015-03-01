
void setup(){
  size(500,500);
  background(255);
}

void draw(){
  stroke(0,
  map(mouseX,0,400,0,255),
  map(mouseY,0,400,0,255));
 
  strokeWeight(map(pmouseX,0,400,1,10));
  line(mouseX,mouseY,100,100);
}



