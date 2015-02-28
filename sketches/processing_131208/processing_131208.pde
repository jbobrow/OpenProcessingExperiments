
void setup() {
  size(800,800);
  background(225);
  stroke(225);
}

void draw(){
  rectMode(CENTER);
  fill(100,mouseY*0.3,150,30);
  rect(mouseX,mouseY,mouseX*0.5,100);
}

