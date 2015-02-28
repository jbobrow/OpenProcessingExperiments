
public class Rain
{
  PVector position,pposition,speed;
  float col;
  
  public Rain()
  {
    position = new PVector(random(0,width),0);
    pposition = position;
    speed = new PVector(0,0);
    col = random(30,100);
  }
  
  void draw()
  {
    stroke(100,col);
    strokeWeight(2);
    line(position.x,position.y,pposition.x,pposition.y);
    //ellipse(position.x,position.y,5,5);
  }
  
  void calculate()
  {
    pposition = new PVector(position.x,position.y);
    gravity();

  }
  
  void gravity()
  {
    speed.y += .2;
    speed.x += .01;
    position.add(speed);
  }
}

public class Splash
{
  PVector position,speed;
  
  public Splash(float x,float y)
  {
    float angle = random(PI,TWO_PI);
    float distance = random(1,5);
    float xx = cos(angle)*distance;
    float yy = sin(angle)*distance;
    position = new PVector(x,y);
    speed = new PVector(xx,yy);
    
  }
  
  public void draw()
  {
    strokeWeight(1);
    stroke(100,50);
    fill(100,100);
    ellipse(position.x,position.y,2,2);
  }
  
  void calculate()
  {
    gravity();
     
    speed.x*=0.98;
    speed.y*=0.98;
           
    position.add(speed);
  }
  
  void gravity()
  {
    speed.y+=.2;
  }
  
}

