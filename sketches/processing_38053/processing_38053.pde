
void setup(){
  size(500, 500);
  fill(0,0,0);
  stroke(5,255,255);
}

void draw(){
  rect(-2,-2,502,502);
  for (int i = 0; i <= 20; i++){
    line(i * 25, 0, mouseX, mouseY);
    line(i * 25, 500, mouseX, mouseY);
  }
}

