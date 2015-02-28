
int rectang = 100;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  //background(mouseX,mouseY);
  //stroke(0);
  noStroke();
  fill(mouseX,mouseY,50,15);
  rectMode(CENTER);
  rect(mouseX,mouseY,rectang,rectang);
}
