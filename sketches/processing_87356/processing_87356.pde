
void setup(){
  size(500,500);
  frameRate(2);
  background(255);
}


void draw(){
   background(253);
  int step = 70;
  float lastx = -999;
  float lasty = -999;
  float strokeranNum = random(0.3,0.6);
  float strokeranNum2 = random(0.3,0.6);
  float y = 50;
  int borderx = 20;
  int bordery = 10;
  for(int x=borderx; x<=width-borderx; x+=step){
    y = bordery + random(height - 2*bordery);
    if(lastx > -999){
      strokeWeight(strokeranNum);
      line(x, y, lastx, lasty);
      strokeWeight(strokeranNum2);
      line(width- x, height- y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}
