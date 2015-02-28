
float a;
float x=200;
float y=200;

float r=1.36;
void setup(){
  size(500,500);
 // background(255);
  fill(0);
}
void draw(){
  a+=PI/r;
  x-=.5;
  y-=.5;
  translate(250,250);
  rotate(a);
  ellipse(x,y,10,10);
  if (mousePressed){
    r=random(1,2);
    a=0;
    x=200;
    y=200;
    background(200);
  }
}
