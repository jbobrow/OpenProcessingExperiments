
int deep = 0;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(50);
  stroke(200);
  noFill();
  drawCorner(deep,20,380,180);
  rotate(HALF_PI);
  translate(0,-400);
  drawCorner(deep,20,380,180);
  rotate(HALF_PI);
  translate(0,-400);
  drawCorner(deep,20,380,180);
  rotate(HALF_PI);
  translate(0,-400);
  drawCorner(deep,20,380,180);
}

void drawCorner(int depth, float cx, float cy, float si){
  if (depth<1){
    line(cx,cy-si,cx,cy);
    line(cx+si,cy,cx,cy);
  } else {
    drawCorner(depth-1, cx, cy-si/2, si/2);
    drawCorner(depth-1, cx+si/2, cy, si/2);
  }
}

void mousePressed(){
  saveFrame();
  deep++;
}

