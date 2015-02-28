
float x0=0.2;
float x;
float a=0.5;
float aa;
int i=1;

void setup()
{
  size(900,450, P2D);
  background(0);
  stroke(140);
  fill(0);
  line(120,450,900,450);
  line(120,450,120,270);
  PFont font;
  font = loadFont("ArialMT-30.vlw");
  textFont(font);
  fill(255);
}
void draw()
{
  stroke(140);
  fill(0);
  rect(0,0,900,200);
  rect(0,200,120,180);
  stroke(255);
  fill(255);
  text("x:=ax(1-x)",30,250);
  text("x0="+str(x0),40,300);
  text("a="+str(aa),40,350);
  for(i=1;i<=700;i++)
  {
    point(i,(200-200*x));
    x=a*x*(1-x);
  }
  for(i=700;i<=900;i++)
  {
    point(i,(200-200*x));
    point(120+200*(aa-0.5),(430-200*x));
    x=a*x*(1-x);
  }
  a=a+0.005;
  aa=float(round(1000*a))/1000;
  i=1;
  x=x0;
  if (aa>=4)
  {
    noLoop();
  }
}



                
                     
