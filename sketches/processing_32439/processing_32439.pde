
int x1=100;
int y1=100;
int x2=200;
int y2=200;
int x3=300;
int y3=300;
int x4=400;
int y4=400;

void setup(){
  smooth();
  size(400,550);
  background(0);
  stroke(0,255,0,20);
  strokeWeight(2);

}

void draw(){
//rectangle
  noFill();
  while (x1<400){
  rect(x1,y1,x2,y2,x3,y3,x4,y4);
  x1=x1+10;
  x2=x2+10;
  x3=x3+10;
  x4=x4+10;
  y1=y1+4;
  y2=y2+5;
  y3=y3+6;
  y4=y4+6;
}
  
}

