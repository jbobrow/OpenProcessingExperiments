
BurstOfCircles circles;

void setup(){
  size(800, 600);
  smooth();
  circles = new BurstOfCircles();
}

void draw(){
   
  background(0);
  circles.draw(); 
   
}

class BurstOfCircles
{
  CircleParticle[] p = new CircleParticle[ 28000 ]; 
  
  BurstOfCircles()
  {
     int i=0, n=p.length;
     for(i=0;i<n;i++){
       p[i] = new CircleParticle(); 
       p[i].drawRadius = 2;
       p[i].x = width/2;
       p[i].y = height/2;
     }     
  }
  
  void draw() 
  {
     int i=0, n = 14;     
     int j=0, n2 = p.length / n;     
     float angle = 90, radius = 20;
     float x=width/2, y=height/2;
     float radiusIncrease = 20;
     
     float ease = 2;
          
     for(j=0; j<200; j++){ 
       
       radiusIncrease = 19;
       radius = 100*cos(frameCount/PI);  
       angle = (float)(j/PI);    
       for(i=0; i<14; i++){
         //angle = (float)(j/3.14);   0
         p[i].x = x + ( radius * (float)sin( angle ) );
         p[i].y = y + ( radius * (float)cos( angle ) );
         //p[i].drawRadius = 3;
         p[i].posRadius = radius;
         drawParticle( p[i].drawRadius, p[i].x, p[i].y );
         radius += radiusIncrease;
         radiusIncrease += 2;
         if(radiusIncrease < 1) radiusIncrease = 1;         
         ease+=2;
       }
     }
    
  }
  
  void drawParticle(float radius, float x, float y){    
    
    int i=0, n=90;
    float angle = 90;
    float vx1=x, vy1=y;
    float vx2=x, vy2=y;
    
    float h =  radius*2;
    float w = radius*2;
    
    if (keyPressed) {
    if (key  == 'r' || key == 'R')
      fill(255, 0, 0);
    if (key == 'b' || key == 'B') 
      fill(0, 0, 255);
    if (key == 'g' || key == 'G')
      fill(0, 255, 0);    
    if (key == 'y' || key == 'y') 
      fill(255, 255, 0); 
    if (key == 't' || key == 'T')
      fill(0, 255, 255);
    if (key == 'm' || key == 'm')
      fill(255, 0, 255);
    if (key == 'o' || key == 'o')
      fill(255, 100, 50);
    if (key == 'p' || key == 'P')
      fill(126, 50, 126);  
  } 
    else {fill(126);}
    ellipse( x, y, w, h);  
  }
  }
class CircleParticle 
{
  public float drawRadius;  
  public float posRadius;
  public float x;
  public float y;  
  CircleParticle(){ }  
}




