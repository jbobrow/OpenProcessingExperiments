
void setup()
{
size(500,500);
background(255,255,255);
  ellipse(h,o,25,25);
 line(1,1,2,1);
}
float d =sqrt((25-mouseX)*(25-mouseX)+(45-mouseY)*(45-mouseY));
float h = random(25,475);
float o = random(25,475);
int x= 1;
int y= 1;
void draw()
{
 
  d =sqrt((h-mouseX)*(h-mouseX)+(o-mouseY)*(o-mouseY));
  
if (d<25)
{
 background(255,255,255,255);
 fill(0,0,0);
 h =random(0,500);
  o =random(0,500);
  ellipse(h,o,25,25);
}
if (d<20)
{
  background(255,255,255,255);
 fill(0,0,0);
 h =random(0,500);
  o =random(0,500);
  ellipse(h,o,25,25);
   x=x+100;
  line(1,y,x,y);
}

}
