
class Bullets
{
//VARIABLES
  float bulletStartX;
  float bulletStartY;
  float bulletDX;
  float bulletDY;
  float bulletDiameter;
  
//CONSTRUCTOR
  Bullets(float bulletStartX, float bulletStartY, float bulletDX, float bulletDY,float bulletDiameter)
  {
    this.bulletStartX = bulletStartX;
    this.bulletStartY = bulletStartY;
    this.bulletDX = bulletDX;
    this.bulletDY = bulletDY;       
    this.bulletDiameter = bulletDiameter;
  }//End constructor
  
//CHANGE BULLET LOCATION METHOD
  void moveBullets()
  {
    bulletStartX = bulletStartX + bulletDX;
    bulletStartY = bulletStartY + bulletDY;
  }//End moveBullets()
  
//DISPLAY BULLET 
  void drawBullets()
  {
    ellipseMode(CENTER);
    ellipse(bulletStartX, bulletStartY,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX+5,bulletStartY,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX-5,bulletStartY,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX,bulletStartY+5,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX,bulletStartY-5,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX+3,bulletStartY-3,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX-3,bulletStartY+3,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX+3,bulletStartY+3.5,bulletDiameter/4,bulletDiameter/4);
    ellipse(bulletStartX-3,bulletStartY-3,bulletDiameter/4,bulletDiameter/4);
  }//End drawBullets()
  
//CHECK TO SEE IF BULLET IS ON SCREEN
  boolean locationOfBullets()
  {
    if(bulletStartX<0||bulletStartX>962||bulletStartY<0||bulletStartY>611)  return true;
    else return false; 
  }//End locationOfBullets()
  
}//End bullets CLASS

