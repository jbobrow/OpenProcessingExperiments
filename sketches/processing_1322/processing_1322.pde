
BurstOfCircles circles;

void setup(){
  size(800, 600);
  noStroke();
  smooth();
  circles = new BurstOfCircles();
}

void draw(){
  background(0); 
  circles.draw();
}

class BurstOfCircles
{
  // each angle is 14 particles
  CircleParticle[] p = new CircleParticle[ 2800 ]; 
  
  BurstOfCircles()
  {
     int i=0, n=p.length;
     for(i=0;i<n;i++){
       p[i] = new CircleParticle(); 
       p[i].drawRadius = 5;
       p[i].x = width/2;
       p[i].y = height/2;
     }     
  }
  
  void draw() 
  {
     int i=0, n = 14;     
     int j=0, n2 = p.length / n;     
     float angle = 0, radius = 0;
     float x=width/2, y=height/2;
     float radiusIncrease = 20;
     
     float ease = 0;
          
     for(j=0; j<200; j++){ 
       
       radiusIncrease = 14;
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
    float angle = 0;
    float vx1=x, vy1=y;
    float vx2=x, vy2=y;
    
    float h =  radius*2;
    float w = radius*2;
    
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


