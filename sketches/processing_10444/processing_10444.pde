
void setup(){
  size(800,800);
  smooth();
}

void draw(){
  background(255);
  noFill();
  makeLine(width/2, height/2, mouseX, mouseY, 5, dist(width/2, height/2, mouseX, mouseY)/5);
}





