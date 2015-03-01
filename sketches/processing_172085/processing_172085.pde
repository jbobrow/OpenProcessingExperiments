
int xPos, yPos, score;
float appleX , appleY;
int xDir, yDir;
void setup() {  
size(400, 400);
xPos = 0;
yPos = 0;


}

void draw() {  
background(255); 
if (xPos <= appleX+9 && xPos >= appleX-9 && yPos <= appleY + 9 && yPos >= appleY-9)
{
  appleX = random( 5, 395);
  appleY = random (5, 395);
  score++;
  
}
fill (0);
text (score , 350, 20);
fill (10, 255, 150);
ellipse (xPos, yPos, 10, 10);
fill (255, 0, 0);
ellipse (appleX, appleY, 10, 10);
  if (keyCode == RIGHT || keyCode == LEFT)
  {
    if ( xDir == 1)
    {
      xPos++;
    }
    else if ( xDir == -1)
    {
      xPos--;
    }
  }
  if (keyCode == UP || keyCode == DOWN)
  {
     if ( yDir == 1)
    {
      yPos++;
    }
    else if ( yDir == -1)
    {
      yPos--;
    }
  }
}
void keyPressed () { 
      if (key == CODED)
      {
          if (keyCode == RIGHT)
          {
               xDir = 1;
          }
          if (keyCode == LEFT)
          {
            xDir=-1;
          }
          if (keyCode == DOWN)
          {
              yDir = 1;
          }
          if (keyCode == UP)
          { 
            yDir = -1;
          }
      }
      
   } 
