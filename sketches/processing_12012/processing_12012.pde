
public class Bullet{
  
  int x,y,z;
  int vX,vY;
  int rotation;
  int rotationChange = 3;
  int r,g,b,a;
  int direction = -1;
  int speed;
  int bulletSize = 50;
  
  public Bullet(int startX, int startY, int startSpeed){
    x = startX;
    y = startY;
    z = 0;
    rotation = 0;
    r = (int)random(100,200);
    g = (int)random(100,200);
    b = (int)random(100,200);
    a = 15;
    speed = startSpeed;
  }
  
  public void act(){
    if((x < 0 && vX < 0) || (x > width && vX > 0))
      vX*= -1;
    if((y < 0 && vY < 0) || (y > height && vY > 0))
      vY*= -1;
    
    x+=vX;
    y+=vY;
    z+=speed*direction;
    rotation+=rotationChange;
  }
  
  public void show(){
    pushMatrix();
    fill(r,g,b,a);
    translate(x,y,z);
    rotate(rotation);
    box(bulletSize);
    popMatrix();
  }
  
  public int getZ(){
    return z;
  }
  
  public void switchDirection(){
    direction = -direction;
    r = (int)random(1,100);
    g = (int)random(1,100);
    b = (int)random(1,100);
    a = 255;
    speed = speed * 2;
  }
  
  public int getDirection(){
    return direction;
  }
  
  public boolean collision(int hitX, int hitY){
    if(x > hitX-50
    && x < hitX+50
    && y > hitY-50
    && y < hitY+50
    && z > -50){
      r = 255;
      g = 0;
      b = 0;
      println("Hit!");
      return true;
    }
    return false;
    
  }
  
  public void randMove(){
    int variable =(int)(difficulty/10);
    vX+= random(-variable,variable);
    vY+= random(-variable,variable);
  }
       
}

