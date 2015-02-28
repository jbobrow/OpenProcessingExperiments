
public class Ball
{
  PVector position , acceleration , speed;
  float ballSize , fluncuate , fluncuate2 , colr;
  int fill , life;
  color col;
  
  Ball(float x , float y)
  {
    position = new PVector(x,y);
    ballSize = random(5,20);
    acceleration = new PVector(0 , map(ballSize,5,20,-6,-9));
    //println(acceleration.y);
    fluncuate = random(0,2);
    fluncuate2 = random(15*TWO_PI,17*TWO_PI);
    fill = int(random(0,2));
    life = int(random(10,90));
    colr = random(1001);
    if (colr>900)
    col = color(255,0,0);
    else col = color(255);
    
  }
  
  void draw()
  {
    if (fill == 1)
    {
      fill(col);
      noStroke();
    }
    else
    {
      noFill();
      stroke(col);
    }
    if (life>0)
    {ellipse(position.x,position.y,ballSize,ballSize);}
  }
  
  void calculate()
  {
    position.add(acceleration);
    //position.x += fluncuate*sin(map(position.y,700,0,0,fluncuate2));
    position.x += fluncuate*sin(radians(position.y));
    if (life>0) life--;
    else life=0;
    //println(life);
  }
  
}

