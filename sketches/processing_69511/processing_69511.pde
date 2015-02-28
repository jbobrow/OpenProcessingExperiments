
//Raidel C , Computer Programming 1, Mods 14-15, Functions and Animations

int x = 10;
int x2= 10;
int x3= 10;
int x4= 10;
int x5= 10;
int x6= 10;
int x7= 10;
int x8= 10;
void setup()
{
  size(600, 600);
  smooth();
}
void draw()
{
  circleA();
  circleB();
}
void circleA()
{
  fill(0, 0, 0, 5);
  rect(0, 0, 600, 600);
  fill(69, 187, 206);
  stroke(255);
  ellipse(x8, x8, 10, 10);
  ellipse(580+x2, 20-x2, 10, 10);
  ellipse(600-x3, 600-x3, 10, 10);
  ellipse(20-x4, 580+x4, 10, 10);
  ellipse(300, 0+x5, 10, 10);
  ellipse(300, 600-x6, 10, 10);
  ellipse(x, 300, 10, 10);
  ellipse(600-x7, 300, 10, 10);
  x=x+1;
  x2=x2-1;
  x3=x3+1;
  x4=x4-1;
  x5=x5+1;
  x6=x6+1;
  x7=x7+1;
  x8=x8+1;
  
  if(x>600)
  {
    x=-1;
  }
  if(x2<-600)
  {
    x2=1;
  }
  if(x3>600)
  {
    x3=1;
  }
  if(x4<-600)
  {
    x4=1;
  }
  
  if(x5>600)
  {
    x5=-1;
  }
  if(x6>600)
  {
    x6=-1;
  }
  if(x7>600)
  {
    x7=1;
  }
  if(x8>600)
  {
    x8=1;
  }

}

void circleB()
{
 noFill();
 stroke(69, 187, 206);
 ellipse(300,300,x+140,x+140);
 stroke(255);
 fill(69, 187, 206);
 ellipse(300, 300, 150, 150);

}
