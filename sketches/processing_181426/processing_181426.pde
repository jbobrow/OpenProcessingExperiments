
ParticleSystem balloons = new ParticleSystem();
boolean mouseDown = false;

void setup()
{
  
  size(800,600,P2D);
  background(255);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw()
{
  background(255);
  if(mousePressed) //Executes as long as the mousePressed is true.
  {
    balloons.add(new Particle(mouseX, mouseY));
  }
  balloons.run();
}

void keyPressed() //If you want to clear the screen of balloons, press key 'c'.
{
  if(key != CODED)
  {
    switch(key)
    {
      case 'c' : balloons.removeAll(); break;
    }
  }
}


class Particle //Establishing Particle object
{
  float x = width/2;
  float y = height/2;
  float xv = -3+random(6);
  float yv = -random(4);
  float maxYV = 20;
  float gravity = 0.1;
  float friction = 1;
  float radius = 14;
  color c = color(random(255),random(255),random(255),80);
   
  Particle(){  
  }
 
  Particle(float xp,float yp)
  {
    x = xp;
    y = yp;
  }
 
  Particle(float xp,float yp,float xvel,float yvel)
  {
    this(xp, yp);
    xv = xvel;
    yv = yvel;
  }
 
 public void update() //Let's the balloon move through the canvas.
  {
    if((yv < maxYV))
    {
      yv -= gravity*.2;
    }
    yv *= friction;
    y += yv;
    x += xv;
    
/*  If you want the balloons to stop at the ceiling, uncomment this. 
    if(y <= 0+radius){
      xv = 0;
      yv = 0;
      y = 0 + radius;
    }
*/    
  }

  void render() 
  {
    stroke(232,232,232); //For the balloon string
    line(x,y+radius,x,y + radius*4);
    noStroke();
    fill(c); //For the actual balloon
    ellipse(x,y,radius,radius*1.15);
  }
 
  void run() 
  {
    update();
    render();
  }
 
  
}

class ParticleSystem
{
  ArrayList particles = new ArrayList();
  
  ParticleSystem(){
  }
   
  void add(Particle p)
  {
    particles.add(p);
  }
   
  void removeAll()
  {
    particles.clear();
  }
   
  void run()
  {
    for(int i = 0; i < particles.size(); i++)
    {
      Particle p = (Particle)particles.get(i);
      p.run();
    }
  }
}



