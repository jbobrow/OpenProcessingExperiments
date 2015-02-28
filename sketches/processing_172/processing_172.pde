
float BUTTERFLYSIZE = 80;
float BUTTERFLYSPEED = 10;
float MAXANGLE = 2;
float MAXANGLESPEED = 0.1;
float BUTTERFLYSPEEDVARY = 0.5;

class Butterfly
{
  float x,y,z;
  float xspeed,yspeed,zspeed;
  PImage img;
  float size;
  int life;
  float rotX;
  float rotY;
  float rotZ;
  float angle;
  float angleSpeed;
  
  Butterfly(float _x, float _y,float _z)
  {
    life = (int)random(300,400);
    x = _x;
    y = _y;
    z = _z;
    
    //rotX = random(1,-1);
    rotY = random(TWO_PI);
    rotZ = random(-1,1) ;
    rotX = 0;
    //rotY = 0;
    //rotZ = 0;
    
    angle = random(MAXANGLE);
    angleSpeed = random(MAXANGLESPEED,2*MAXANGLESPEED);
    
    size = random(BUTTERFLYSIZE);
    
    xspeed = random(-BUTTERFLYSPEED,BUTTERFLYSPEED);
    yspeed = random(-BUTTERFLYSPEED,BUTTERFLYSPEED);
    zspeed = random(-BUTTERFLYSPEED,BUTTERFLYSPEED);
    
    img = butterflySource;
  }
  
  void update()
  {
    life-=1;
    x+=xspeed;
    y+=yspeed;
    z+=zspeed;
    
    if(angle>MAXANGLE || angle<=0)
      angleSpeed *=-1;
    angle += angleSpeed;
    
    
    xspeed+=random(-BUTTERFLYSPEEDVARY,BUTTERFLYSPEEDVARY);
    yspeed+=random(-BUTTERFLYSPEEDVARY,BUTTERFLYSPEEDVARY);
    zspeed+=random(-BUTTERFLYSPEEDVARY,BUTTERFLYSPEEDVARY);
    
    render();
  }
  
  void render()
  {
    pushMatrix();
    translate(x,y,z);
    
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    translate(-size/2,-size/2);
    pushMatrix();
    rotateX(angle);
    translate(0,-size*0.9);
    tint(255,z*-sin(camerax)+200);
    image(img,0,0,size,size);
    popMatrix();
    pushMatrix();
    rotateX(-angle);
    translate(0,-size*0.85);
    tint(255,z*-sin(camerax)+200);
    image(img,0,0,size,size);
    popMatrix();
    popMatrix();
  }
}

