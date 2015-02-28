
void setup(){
  size(400, 400);
  smooth();
  background(255);
  noStroke();
  noCursor();
}

int x = 0;

void draw(){
  fill(0, 5);
  rectMode(CORNER);
  rect(x-width, 0, width, height);
  x += 1;
  rectMode(CENTER);
  rect(mouseX, mouseY, 10, 10);
  if(mouseX <= x){
    x = x - 50;
    background(255);
    fill(0, 100);
    rect(mouseX, mouseY, 20, 20);
  }
}               
