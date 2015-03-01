
void setup(){
  size(400,400);
  frameRate(30);
}
int x=400;
int speed=second();
float a=random(255);

void draw(){
  background(0,a,255);
  noStroke();fill(238,238,a);
  triangle(x,x,x,2*x,2*x,2*x);
  x=x-speed;
  if(x<0){
    x=400;
  }
}

