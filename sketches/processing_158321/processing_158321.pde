
boolean isDone;

void setup() {
  size(500,400);
  background(0);
  isDone = false;
}

void draw() {
  stroke(255, 80);
  strokeWeight(1);
  if (isDone == false){
  // here we are drawing a new line every 4th pixel until we reach the right side of the canvas
  
  for (int i = 0; i < 1000; i++) {
    float x1 = random(0, width);
    float x2 = random(0, width);
    float y1 = random(0, height);
    float y2 = random(0, height);
    line(x1, y1, x2, y2);
  }
  isDone = true;
  }
  
}


