
class Bullet{
  float x;
  int y;
  int speed;
  int bulletSize;
  
  
  
  Bullet(float x,int y,int speed, int bulletSize){
  this.x = x;
  this.y = y;
  this.speed = speed;
  this.bulletSize = bulletSize;
  }//constructor
  
  void drawBullet(){
    rectMode(CENTER);
    fill(255);
    stroke(0);
    rect(x,y,bulletSize,bulletSize);
  }
  
  void movement(){
    y= y - speed;
    
  }
  
  
}//class

