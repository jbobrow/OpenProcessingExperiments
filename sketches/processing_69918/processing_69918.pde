
/* Andy Ma, Computer Programming 1, Mods 14/15
www.instantnoodle.webs.com */

int x = 0;
int change = 1;
void setup ()
{
  size(500, 500);
  smooth();
  frameRate(28);
}
void draw ()
{
  //Pattern();
  Circle();
  x = x + change;
  if (x<0)
  {
    change = change + 5;
  }
  if (x>500)
  {
    change = change - 5;
  }
}
void Pattern()
{
  stroke(12, 34, 56);
  strokeWeight(3);
  ellipse(1, x, 50, 50);
  ellipse(x, 1, 50, 50);
  
  ellipse(x, x, 50, 50);
  
  ellipse(x, 500, 50, 50);
  ellipse(500, x, 50, 50);
  
  ellipse(250, x, 50, 50);
  ellipse(x, 250, 50, 50);
  
  ellipse(x, 250+x, 50, 50);
  ellipse(250+x, x, 50, 50);
  
  ellipse(x, 250+x, 50, 50);
  ellipse(250+x, x, 50, 50);
  
  ellipse(x, 125, 50, 50);
  ellipse(125, x, 50, 50);
  
  ellipse(x, 375, 50, 50);
  ellipse(375, x, 50, 50);
  
  ellipse(125+x, x, 50, 50);
  ellipse(375-x, x, 50, 50);
  ellipse(500-x, 125+x, 50, 50);
  ellipse(375+x, x, 50, 50);
  ellipse(x, 375+x, 50, 50);
  ellipse(x, 125+x, 50, 50);
  ellipse(500-x, 375+x, 50, 50); 
  ellipse(125-x, x, 50, 50);
 
  ellipse(500-x, x, 50, 50);
  ellipse(500-x, 250+x, 50, 50);
 
  ellipse(250+x, x, 50, 50);
  ellipse(250-x, x, 50, 50);
  x=x+5;
}
void Circle()
{
  noFill();
  stroke(0, random(100), random(200));
  strokeWeight(5);
  fill(0, random(100), random(200));
  ellipse(250, x , x, x);
  ellipse(x, 250 , x, x);
  ellipse(500-x, 250, x, x);
  ellipse(250,500-x,x,x);
  ellipse(x,x,x,x);
  ellipse(x,500-x,x,x);
  ellipse(500-x,x,x,x);
  ellipse(500-x,500-x,x,x);
  ellipse(250,250,x,x);
  x = x + 5;
}
