
int a=0;
int b=0;
int c=#8AC410;
void setup() 
{
  size(400,400);
   background(0);
}
void draw()
{
  frameRate(5);
   fill(c);
   c=c+20;
  rect(a,b,width/10,width/10);
  a=a+width/10;
  b=b;
  if(a>=width) {
    a=0;
    b=b+width/10;
}
}
