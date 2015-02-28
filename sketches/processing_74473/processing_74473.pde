
class Ball
{
  float posx, posy;
  float BallSize,speed;
  color Ballcolor=color(random(0,200),random(0,200),random(0,200));
  Ball(float x, float y, float _speed)
  {
    BallSize=50;
    posy=y;
    posx=x;
    speed=_speed;
  }

  
  void positionUpdate()
  {
    if(posx >=width+BallSize/2) posx=0;
    else if(posx<=0-BallSize/2) posx=width;
    posx=posx+speed;
    noStroke();
    fill(Ballcolor);
    ellipse(posx,posy,BallSize,BallSize);
  }
  
  boolean collisionDetect(float x, float y)
  {
    if(dist(posx,posy,x,y)<=BallSize/2) return true;
    else return false;
  }
 
  

}


