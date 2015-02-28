
void setup() {
  size(400, 400);
  smooth();
  rectMode(CENTER);
  background(0);
  noLoop();
}

void draw() {
    drawShape();
}

void drawShape(){  
   rect(width/2, height/2, 200, 200);
}
