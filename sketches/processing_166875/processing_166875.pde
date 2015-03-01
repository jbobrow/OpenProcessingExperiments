
float unit, theta;
int num = 20, numFrames = 120;
 
void setup() {
  size(500, 500);
  unit = width/num;
  noStroke();
}
 
void draw() {
  background(0);
  for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*unit, y*unit);
      float offSet = map(distance, 0, width/2+height/2, 0, TWO_PI);
      float sz = map(sin(theta+offSet),-1,1,unit*.1,unit*.9);
      float start = map(sin(theta+offSet),-1,1,0,PI);
      float lerpAmount = map(distance, 0, width/2+height/2, 0,1);
      color col = lerpColor(#FCE400, #C60C0C,  lerpAmount);
      fill(col);
      arc(x*unit, y*unit, sz, sz,start,start+PI);
    }
  }
  theta += TWO_PI/numFrames;
}

