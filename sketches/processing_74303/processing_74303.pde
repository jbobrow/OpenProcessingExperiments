
void setup() {
  size(400, 400, P2D);
  smooth(8);
}

void draw() {
  background(0);
  if(mousePressed) {
     fill(255);
  } else {
    fill(0);
  }
  
  rect(mouseX,100,mouseX, 200);
  
}
