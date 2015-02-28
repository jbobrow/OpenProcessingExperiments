
void setup() {
  size(600,600);
}

void draw() {
  fill(255,0,0);
  rectMode(CENTER);
  
  if(mouseX > 250 && mouseX < 350 && mouseY >250 && mouseY < 350) {
  fill(0,0,255);
  }
  
  rect(width/2, height/2,100,100);
}
