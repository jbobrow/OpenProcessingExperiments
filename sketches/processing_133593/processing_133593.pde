
int iDiagonal=0;
int a=0;

void setup() {
  size(400,400);
  frameRate(60);
  background(0);
  fill(0,0,0,1);
}
void draw() {
  //noStroke();
  //rect(0,0,400,400);
float red=random(255);
float green=random(255);
float blue=random(255);
  float r=random(400);
  float g=random(400);
  float b=random(400);
  float v=random(1,20);
  int k=(int) v;
  strokeWeight(3);
  //stroke(red,green,255,10);
  stroke(0,255,b,3);
  if (iDiagonal<400){
    triangle(iDiagonal,0,g,iDiagonal,0,0);
  } else if (iDiagonal<800){
    stroke(170,green,255,2);
    triangle(400,iDiagonal-400,800-iDiagonal,r,0,0);
  } else if (iDiagonal<1200){
    //stroke(red,green,blue,2);
    noStroke();
    triangle(1200-iDiagonal,400,0,1200-iDiagonal,b,0);
  } else if (iDiagonal<1600){
    stroke(0,255,b,3);
    triangle(0,1600-iDiagonal,iDiagonal-1200,0,400,400);
  }
  iDiagonal+=5;
  if (iDiagonal>=1600) {
    iDiagonal=0;
  }
  ellipse(iDiagonal,b,2,2);
  if (red>200) {
    red-=50;
  }
  if (blue>200) {
    blue-=50;
  }
  if (green>200) {
    green-=50;
  }
}
