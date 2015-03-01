
class Particle
{
  float x,y,vx, vy, diam, a; 
  boolean dead = false;
  Particle(float _x, float _y)
  {
  
    x = 250;
    y = 250;
    diam = random(2,500);
    a = 50; 
    vx = mouVelx *.9;
    vy = mouVely *.9;
  }
  
  void update()
  {
    vx += noise(x*.01, y*.01, frameCount*.2) -.5;
    vy += noise(y*.01, x*.01, frameCount*.2 + 34356) - .5;
    
    x += vx;
    y += vy;
    
    a*=.50;
    
    if(a < .05)
    {
      dead = true;
    }
  }
  
  
  void display()
  {
    float r = atan2(vx,vy);
    
    fill(50,200,0, a*255);
    stroke(0,100);
    pushMatrix();
    translate(x,y);
    rotate(r);
    
    ellipse(0,0, diam, -diam);
    line(-700,0,0,0);
    
    
    
    popMatrix();
  
  }
  
  
} 



ArrayList particles; 

float mouVelx, mouVely; 

void setup()
{
  size(500, 500);
  particles = new ArrayList(); 
}

void draw()
{
  background(204, 0, 0);
  stroke(255);
  strokeWeight(5);
 
  
  particles.add(new Particle(random(width), random(height) ));
  
  for(int i = 0; i < particles.size(); i++){
    
    Particle p = (Particle) particles.get(i);
    p.update();
    p.display();
  
    if(p.dead == true) 
    {
      
    }
  }

  
}

