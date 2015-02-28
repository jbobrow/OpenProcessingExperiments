
float x1;
float y1;
float xMOV;
float yMOV1;
float x2;
float y2;
float xMOV2;
float yMOV2;
float x3;
float y3;
float xMOV3;
float yMOV3;

void setup() {
  size(600, 500);
  background(255);
  x1=0;
  y1=500;
  x2=300;
  y2=0;
  x3=600;
  y3=500;
  xMOV=5;
  xMOV3=-5;
}
void draw() {
 
  noFill();
  triangle(x1, y1, x2, y2, x3, y3);
  //else, sino
  if (x1<600) {
    x1=x1+xMOV;
    
  }
  if (y1>0) {
    y1=y1-xMOV;
  }
  if (x3>0) {
    x3=x3+xMOV3;
  }
  if (y3>0) {
    y3=y3+xMOV3;
  }
  if (y2<500) {
    y2=y2+xMOV;
  }
 }




