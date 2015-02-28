
class Car
{
 //SET UP PROPERTIES
 color c;
 float xpos;
 float ypos;
 float xspeed;
 
 
 //START MAKING THE OBJECT
 Car()
 {
  
   c = color(255,0,0);
   xpos = width/2;
   ypos = width/2;
   xspeed = 6;
   
 }
  
  void move()
{
 xpos = xpos + xspeed;
if(xpos > width)

{
  xpos = 0;
}
}

void display()
{
  rectMode(CENTER);
  fill(c);
  rect(xpos,ypos,10,80);
}
}

