
/* Andy M, Computer Programming 1, Mods 14/15
www.instantnoodle.webs.com */

size(500,500);
noFill();
int x = 10;
while(x<1000)
{
  stroke(12,34,56);
  strokeWeight(3);
  ellipse(1,x,50,50);
  ellipse(x,x,50,50);
  ellipse(x,1,50,50);
  ellipse(x,500,50,50);
  ellipse(500,x,50,50);
  ellipse(250,x,50,50);
  ellipse(x,250,50,50);
  ellipse(500-x,x,50,50);
  ellipse(250-x,x,50,50);
  ellipse(x,250+x,50,50);
  ellipse(500-x,250+x,50,50);
  ellipse(250+x,x,50,50);
  ellipse(x,125,50,50);
  ellipse(x,375,50,50);
  ellipse(125,x,50,50);
  ellipse(375,x,50,50);
  ellipse(125+x,x,50,50);
  ellipse(375-x,x,50,50);
  ellipse(500-x,125+x,50,50);
  ellipse(375+x,x,50,50);
  ellipse(x,375+x,50,50);
  ellipse(x,125+x,50,50);
  ellipse(500-x,375+x,50,50); 
  ellipse(125-x,x,50,50);
  
  x = x + 5;
}
