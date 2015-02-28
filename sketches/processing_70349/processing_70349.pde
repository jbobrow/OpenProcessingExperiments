
int x = 1;
int y = 20;
void setup()
{
  size(800,600);
  background(0);
  strokeWeight(3);
  fill(0);
  smooth();

}
void draw()
{
  stroke(0);
  rect(1,1,200,600);
  rect(600,1,500,600);
  stroke(240,97,109);
  ellipse(15+x,y+10,50,50);
  stroke(240,98,160);
  ellipse(15+x,y+60,50,50);
  stroke(173,61,171);
  ellipse(15+x,y+110,50,50);
  stroke(122,64,173);
  ellipse(15+x,y+160,50,50);
  stroke(73,64,173);
  ellipse(15+x,y+210,50,50);
  stroke(64,89,173);
  ellipse(15+x,y+260,50,50);
  stroke(64,127,173);
  ellipse(15+x,y+310,50,50);
  stroke(42,221,229);
  ellipse(15+x,y+360,50,50);
  stroke(42,229,140);
  ellipse(15+x,y+410,50,50);
  stroke(50,229,42);
  ellipse(15+x,y+460,50,50);
  stroke(222,229,42);
  ellipse(15+x,y+510,50,50);
  stroke(229,139,42);
  ellipse(15+x,y+560,50,50);
  x = x + 2  ;
  y = y ;
  if(x > 800)
  {
    x=-100;
    background(0);
  }
  if(x< 0)
  {
    x=10;
  }
}
