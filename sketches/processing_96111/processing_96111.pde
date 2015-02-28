
int a=50;
float b=5;
float c=12;
float d=14;
float x,y,e,f;

void setup(){
  size(600, 600);
  background(0);
  stroke(0);
  strokeWeight(1.5);
}
 
void draw(){
  translate(width/2,height/2);
  b=map(mouseX,0,width,0,HALF_PI);
  c=map(mouseY,0,height,0,10*d);
  for (int i=1;i<=a;i++)
  {
    f=c*b;
    e=i*sqrt(i);
    x=e*sin(f);
    y=e*cos(c);
    fill(random(0,255),random(0,255),random(0,255));
    rect(x,y,40,60);
  }
}
