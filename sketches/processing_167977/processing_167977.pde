
int x=0;
int y=0;
float r;
float o;
float v;
void setup()
{
  size(600,600);
  background(0);
  
}
void draw()
{
  
  stroke(0);
  fill(r,o,v);
  r=random(0,250);
o=random(40,100);
v=random(60,210);
  rect(x,y,width/12,height/12);
  x=x+width/12;
  y=y;
  if(x==width){
    x=-width/12+width/12;
    y=y+height/12;
  }
  
}
