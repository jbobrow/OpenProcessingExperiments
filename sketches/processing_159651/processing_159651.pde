
private float diam = 40.0;
private float xPos = 20.0;
private float yPos = 300.0;
private float xVel = 3.0;
private float yVel = 6.0;

private float diam2 = 80.0;
private float xPos2 = 100.0;
private float yPos2 = 100.0;
private float xVel2 = 1.0;
private float yVel2 = 7.0;

void setup ()
{
    size (600,600); //the size of the box
    background (0,255,0); //background color
    noStroke ();  //no border around the circle
    fill (255,0,0); //the ellipse is now red
    ellipse (xPos, yPos, diam, diam); //an ellipse in the box
   
    noStroke ();
    fill (255,255,0);
    ellipse (xPos2, yPos2, diam2, diam2);
    
    
    
    
}

void draw ()
{
  background (0,255,0);
  
  if ( (xPos + diam/2) > width) // if left side of the circle is more than 600 then negates it to go right
  {
    xVel = -xVel; 
  }
  
  if ( (xPos -diam/2) < 0)
  {
    xVel = -xVel;
  }
  
  if ( (yPos + diam/2) > width)
  {
    yVel = -yVel;
  }
  
  if ( (yPos - diam/2) <0)
  {
    yVel = -yVel;
  }
  xPos = xPos + xVel; //keep adding x velocity to x position to make it move
  yPos = yPos + yVel; //keep adding y velocity to x to make it move
  fill (255,0,0);
  ellipse (xPos,yPos, diam, diam); //end of ellipse 1
  
  if ( (xPos2 + diam2/2) > width) // if left side of the circle is more than 600 then negates it to go right
  {
    xVel2 = -xVel2; 
  }
  
  if ( (xPos2 -diam2/2) < 0)
  {
    xVel2 = -xVel2;
  }
  
  if ( (yPos2 + diam2/2) > width)
  {
    yVel2 = -yVel2;
  }
  
  if ( (yPos2 - diam2/2) <0)
  {
    yVel2 = -yVel2;
  }
  xPos2 = xPos2 + xVel2; //keep adding x velocity to x position to make it move
  yPos2 = yPos2 + yVel2 ; //keep adding y velocity to x to make it move
  noStroke ();
  fill (255,255,0);
  ellipse (xPos2,yPos2, diam2, diam2);
  
 if (sqrt ( (xPos-xPos2)*(xPos-xPos2) + (yPos- yPos2)*(yPos - yPos2) ) < (diam/2 + diam2/2 ))
 {
   xVel =-xVel;
   yVel =-yVel;
   xVel2 =-xVel2;
   yVel2 =-yVel2;
 }
