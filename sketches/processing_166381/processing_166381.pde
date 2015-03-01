
int a=0;
int b=0;

void setup(){
  size(200,200);
}


void draw(){
  noFill();
  stroke(a,0,0);
  ellipse(100,100,a,a);
  line(b,0,100,100);
  stroke(0,a,0);
  line(0,b,100,100);
  a+=5;
  b+=3;
}


