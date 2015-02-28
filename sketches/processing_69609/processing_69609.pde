
//Copyright © 2012 Dakotah Konicek
//HW4

/*
The line will rotate in a clockwise direction continuously. 
Press up to move the line's rotational point up.
Press down to move the line's rotational point down.
Press left to move the line's rotational point left.
Press right to move the line's rotational point right.
Press r,g, or b to increase the r,g or b values of the line's stroke
Press p to save a .jpg
Press shift to refresh the background.
*/
float x,y,wd,ht,s,l,d,r,g,b;
int state = 0;
void setup()
{ 
  size(400,400);
  smooth();
  background(random(255),random(255),random(255));
  x=0;
  y=0;
//change the value of l and d to position the starting rotation.  
  l=200;
  d=200;
  //change the value of s to increase of decrease the number of possible nodes
  s=20;
  r=random(255);
  g=random(255);
  b=random(255);
  wd=width;
  ht=height;
  state=0;
}

void draw()
//pressing r,g, or b increases the r, g, or b values of the stroke
{
  stroke(r,g,b);
  if (keyPressed) {
  if (key == 'r')
  {r=r+5;}
  if (r>255)
  {r=0;}
  
  if (key == 'g')
  {g=g+5;}
  if (g>255)
  {g=0;}
  
  if (key == 'b')
  {b=b+5;}
  if (b>255)
  {b=0;}
  
//save an image if p is pressed
{if (key =='p')
{saveFrame("hw4.jpg");}
}
  }
  //Line with one point moving clockwise around the format
  line(x,y,l,d);
if (state==0)
x=x+s;
if(x>width)
{x=wd;
 y=y+s;}
if(y>height)
{state=2;}
if(state==2)
{y=ht;
 x=x-s;}
if (x<0)
{x=0;
 state=3;}
if (state==3)
{y=y-s;}
if (y<0)
{y=0;
 state=0;}
}
// key strokes for movement of center of rotation
void keyPressed() 
{
  if (key == CODED)
  {
    if (keyCode==UP)
    {d=d-s;}
    if (d<0)
    {d=400;}
    if (keyCode ==DOWN)
    {d=d+s;}
    if (d>400)
    {d=0;}
    if (keyCode == LEFT)
    {l=l-s;}
    if (l<0)
    {l=400;}
    if (keyCode == RIGHT)
    {l=l+s;}
    if (l>400)
    {l=0;}
    
      }
      //If Shift is pressed background is refreshed
     if(keyCode ==SHIFT)
     {background(random(255),random(255),random(255));}
 }

