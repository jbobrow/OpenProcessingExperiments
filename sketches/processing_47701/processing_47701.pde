
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
  background(70,0);
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
    fill(255);
    ellipse(xNow,yNow,140,140);  
  }
  
  void verlet(){
    float tempX=xNow;
    float tempY=yNow;
    
    xNow += damping * (xNow-xPrev) + gravityX;
    yNow += damping * (yNow-yPrev) + gravityY;
    
    xPrev = tempX;
    yPrev = tempY;
    
    
  if((xNow >830)||(xNow<70)){
    xNow += dampingT * (xNow-xPrev) + gravityX;
    
    //for (int n=0;  n<200;  ++n) {
    float d;
    float b;
    
    d=random(width);
    b=random(height);
    
    fill(0,0,255);
    rect(d,b,60,60);
    rect(b,d,30,30);
    

   
    
    
  } if((yNow >430)||(yNow<70)){
    yNow += dampingT * (yNow-yPrev) + gravityY;
    float d;
    float b;
    d=random(width);
    b=random(height);
    fill(255,0,0);
    rect(d,b,50,50);
    rect(b,d,20,20);   
    
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

  
  
  
  

