
float damping=0.99;
float dampingT=-2;
float gravityX=0.0;
float gravityY=0.0;
Particle p;
void setup(){
  size(900,500);
  p=new Particle(100,200);
  smooth();  
}
void draw(){
  background(80);   
  p.verlet();
  p.draw();
  if(mousePressed){
    p.getVector(0,400);
    p.xPrev *= p.dx;
    p.yPrev *= p.dy;
  }
}
class Particle{
  float xNow,yNow,xPrev,yPrev;
  float dx,dy,vx,vy,len;  
  Particle(float x,float y){
    xNow = xPrev = x;
    yNow = yPrev = y;
  }  
  void draw(){
    noStroke();
    fill(200,10,40,140);
    ellipse(xNow,yNow,140,140);  
  }  
  void verlet(){
    float tempX=xNow;
    float tempY=yNow;    
    xNow += damping * (xNow-xPrev) + gravityX;
    yNow += damping * (yNow-yPrev) + gravityY;   
    xPrev = tempX;
    yPrev = tempY;    
  if(xNow >830){
    xNow += dampingT * (xNow-xPrev) + gravityX;   
    PImage foto;
    foto=loadImage("sepid04.JPG");
    image(foto,400,150);    
  }if(xNow<70){
    xNow += dampingT * (xNow-xPrev) + gravityX;
    PImage foto;
    foto=loadImage("sepid05.JPG");
    image(foto,400,150);   
  } if(yNow >430){
    yNow += dampingT * (yNow-yPrev) + gravityY;
    PImage foto;
    foto=loadImage("sepid03.JPG");
    image(foto,400,150);
  }    
  if(yNow<70){
  yNow += dampingT * (yNow-yPrev) + gravityY;
  PImage foto;
    foto=loadImage("sepid02.JPG");
    image(foto,400,150);   
  }
  }
  void getVector(float x,float y){    
    vx = x - xNow;
    vy = y - yNow;
    len = dist(x,y,xNow,yNow);
    dx = vx/len;
    dy = vy/len;
  }
}

  
  
  
  

