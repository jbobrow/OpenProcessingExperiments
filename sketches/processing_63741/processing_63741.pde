
float xpos, ypos; // location of the ball
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
  background(250);
  
  //updating the position
  xpos += xspeed;
  ypos += yspeed;
 
 //rendering the ball
  fill(200,20,150);
  ellipse(xpos,ypos, r*2,r*2);
   
//   
//  //checking the walls
//  if( (ypos >= height) || (ypos < 0))
//  {
//    yspeed *= -1;
//  }
//  if( (xpos >= width) || (xpos < 0))
//  {
//    xspeed *= -1;
//  }
   
  //checking the walls
  if( (ypos > height-r) || (ypos < r))
  {
    yspeed *= -1;
  }
  if( (xpos > width-r) || (xpos < r))
  {
    xspeed *= -1;
  }


}


