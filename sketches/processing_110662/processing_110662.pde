
//Homework 4
//Lincoln He
//Pittsburgh,PA
//September 10,2013


float x, y, wd, ht;
color col;

void setup ()
{
  size(400,400);
  background(255);
  x = width+1;
  y = height+1;
  wd = width;
  ht = height;
  smooth();
  
}

void draw()
 {
   fill(col);
   if (mousePressed)
  {
    col= color(random(255), random(255), random(255));
  }

   background(255);
   ellipse(x*.2,y*.82,wd*.05,ht*.05);
   strokeWeight(3);
  line(wd*.25,ht*.85,wd*.85,ht*.85);
  line(wd*.85,ht*.85,wd*.85,ht*.70);
  line(wd*.85,ht*.70, wd*.45,ht*.70);
  line(wd*.7,ht*.78,wd*.25,ht*.78);
  line(wd*.25,ht*.78, wd*.25, ht*.60);
  line(wd*.15,ht*.60,wd*.55,ht*.60);
  line(wd*.15,ht*.60,wd*.15,ht*.45);
  line(wd*.15,ht*.45,wd*.70,ht*.45);
  line(wd*.70,ht*.70,wd*.70,ht*.53);
  line(wd*.80,ht*.53,wd*.25,ht*.53);
  line(wd*.80,ht*.53,wd*.80,ht*.30);
  
 }
   
void keyPressed()
{
  
  if ( keyCode == UP )
 {
   y = y - 20;
 }
  if ( keyCode == DOWN )
 {
   y = y + 20;
 }
  if ( keyCode == RIGHT )
 {
   x = x + 20;
 }
   if ( keyCode == LEFT )
 {
   x = x - 20;
 }
}




