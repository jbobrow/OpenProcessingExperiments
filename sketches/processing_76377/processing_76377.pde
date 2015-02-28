
public class Ball
{

  int shotDirection;
  float posX, posY;
  PImage ball;


  public Ball()
  {
   
    posX = 250;
    posY = 300;
    
  }
  
  public void drawBall()
  {
    imageMode(CENTER);
    ball = loadImage("soccerball.png");
    image(ball, posX, posY);
        
  }
  
  public void position(float x, float y)
  {
    
    
    if (posX < x )
    {
      posX+=2;
      
    }
    else if (posX > x )
    {
      posX-=2;      
    }
    
    if (posY > y)
    {
      posY-=2;
    }
    
    

    
  }
  
}


