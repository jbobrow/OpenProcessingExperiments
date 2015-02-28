
void setup(){
  size(400, 400);
  smooth();
  background(255, 249, 134);
  noCursor();
}

void draw(){ 
  noStroke();
  fill(255, 249, 134, 40);
  rect(0, 0, width, height); 
  drawEllipse(25, 25, 50);
  drawEllipse(375, 25, 50);
  drawEllipse(25, 375, 50);
  drawEllipse(375, 375, 50);
  drawEllipse(mouseX, mouseY, 100);
}


void drawEllipse(float x, float y, float grand){
  stroke(40, 190, 255);
  strokeWeight(3);
  fill(255, 255, 240);
  ellipse(x, y, grand, grand);
}

