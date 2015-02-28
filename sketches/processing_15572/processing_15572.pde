
import processing.opengl.*;

void setup() {
  size(400,400,OPENGL);
  stroke(255);
  noLoop();
  noiseDetail(4,0.5);
}

int space = 1;
float noiseScale= 0;
void draw() {
  background(0,0,0);
  grid(8, 255, 0,0,150);
  grid(1.5, 255, 150);
}


void grid(float _strokeWeight, float _r, float _g, float _b, float _a){
  strokeWeight(_strokeWeight);
  stroke(_r,_g,_b,_a);
  float furOffset = _strokeWeight/2;
  int pointCount = 0;
  for(int y = 0; y<width; y += 12) {
    for(float x = 0; x < height; x += space) {   
      float offsetY = int((noise(x/60.00)-0.5)*20+y);
      strokeWeight(_strokeWeight);
      point(x,offsetY);
      pointCount +=1;
      if(pointCount > 3){
        pointCount = 0;
        strokeWeight(1);
        line(x,offsetY+furOffset,x+random(-3,3),offsetY + 3 + furOffset);
      }
    }
  }
  
  for(int x = 0; x<height; x += 12) {
    for(float y = 0; y < width; y += space) {   
      float offsetX = int((noise(y/60.00)-0.5)*20+x);
      strokeWeight(_strokeWeight);
      point(offsetX,y);
      pointCount +=1;
      if(pointCount > 3){
        pointCount = 0;
        strokeWeight(1);
        line(offsetX+furOffset,y,offsetX + 3 + furOffset,y+random(-3,3));
      }
    }
  }
}


void grid(float _strokeWeight, float _g, float _a){
  grid(_strokeWeight, _g, _g, _g, _a);
}


