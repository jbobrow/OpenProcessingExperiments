
//Hanson T., Random Shapes That Amount a 100, Cp1 16/17
void setup()
{
  size(500,500,P3D);
  frameRate(1);
}
 
void draw()
{
  background(0);
  int a= 1;
  while(a<=100)
  {
  int d= int (random(0,255));
  int y= int(random(0,255));
  int x= int(random(0,300));
  fill(d,255-d,255-d,d);
  translate(d,y,0);
  ellipse(d,y,40,40);
  rect(d,y,40,40);
  translate(-d,-y,0);
  a=a+1;
  text("Whoosh",x,x);
  }
}
