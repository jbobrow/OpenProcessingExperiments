
int rectX = 0;
int rectY = 0;
int dirW = 10;
int dirH = 10;

void setup(){
  size(500, 500);
  background(0);
}

void draw(){
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  
  fill(r, g, b);
  rect(rectX, rectY, 10, 10);
  rectX = rectX + dirW;
  if((rectX < 0) || (rectX > width)) {
    dirW = dirW *-1;
    rectY = rectY +dirH;
  } else if((rectY < 0) || (rectY > height)) {
    dirH = dirH *-1;
  }
    
}

