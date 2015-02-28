
void keyPressed()
{
  if(keyCode==RIGHT || key=='d' || key=='D') 
    rightPressed = true;

  if(keyCode==LEFT || key=='a' || key=='A') 
    leftPressed = true;  

  if(keyCode==UP || key=='w' || key=='W' && p.canjump == true) 
    upPressed = true;
  p.canjump = false;
}

void keyReleased()
{
  if(keyCode==RIGHT || key=='d' || key=='D' ) 
  {   
    rightPressed = false;
    currentSprite = WalkS;
    p.xVel = 0;
    p.timer = 0;           
  }


  if(keyCode==LEFT || key=='a' || key=='A' ) 
  {   
    leftPressed = false;
    currentSprite = BackS;
    p.xVel = 0;
    p.timer = 0;           
  }

  if(keyCode==UP || key=='w' || key=='W' ) 
    upPressed = false;   
}


//  image(skyClouds, mapX,Y, 1000,800); 
 

