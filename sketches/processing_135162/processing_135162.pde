
void setup() {
size(500, 500);
background(0);
}

void draw(){
  
  background(100);
  strokeWeight(3);
  stroke(1, 40, 180, mouseY-200);
  fill(100, 10, 0, mouseX - 150);
  ellipse(250, 250, 280, 130);
  
  strokeWeight(7);
  stroke(1, 40, 180, mouseX-200);
  fill(100, 10, 0, mouseY-200);
  float x = mouseX;
  float y = mouseY;
  ellipse(x-50, y-100, 30, 30);

  strokeWeight(5);
  stroke(1, 40, 180, mouseY-200);
  fill(100, 10, 0, mouseX - 150);
  ellipse(250, 250, 130, 280);
}


