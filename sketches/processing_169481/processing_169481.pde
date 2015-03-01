
int a=0;
int e=0;
int c=10;
int d=10;
int x=600;
float r;
float g;
float b;
void setup()
{size(600,600);
background(255);}
void draw(){
  r=random(255);
  g=random(255);
  b=random(255);
  fill(r,g,b);
  frameRate(100);
  rect(a,e,c,d);
  a=a+10;
  if(a > width ){
    a=-10;
    a=a+10;
    e=e+10;}
}
