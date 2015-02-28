
float xpos, ypos;
float xspeed, yspeed;
int r = 40;
void setup()
{
  size(400, 400);
  smooth();
  noStroke();
  xspeed = 5.2;
  yspeed = 4.3;
  xpos = width/2;
  ypos = height/2;
}
void draw()
{
  //background(90);
  fill(255, 20); //instead of background, a rectangle with some alpha
  rect(0,0,width,height);
   
  xpos += xspeed;
  ypos += yspeed;
 
  fill(200,20,150);
  ellipse(xpos,ypos, r*2,r*2);
   
  if( (ypos > height-r) || (ypos < r))
  {
    yspeed *= -1;
  }
  if( (xpos > width-r) || (xpos < r))
  {
    xspeed *= -1;
  }
}



