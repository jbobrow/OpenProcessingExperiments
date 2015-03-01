
Particle[] particles = new Particle[200];
 
void setup()
{
  size(600,600);
  smooth();
   
  
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
}
 
void draw()
{
  background(25);
  
  for (int i=0; i<particles.length; i++) particles[i].draw();
  for (int i=0; i<particles.length; i++) particles[i].update();
}
 
class Particle {
  float x, y;    
  float vx,vy; 
  float timer;   
  float dt = 2; 
  float g = 0.05;
  float r = 5;  
  boolean on=false;
   
  Particle() { }
 

  void initialize()
  {
    on = true;
    x = random(width); 
    y = random(-30,-5);
    vy = random(0,1);
    vx=0;
    timer = 255;
    dt = random(0.1,5);
  }
   
  void draw()
  {
    if(!on) return;
    fill(64,timer); stroke(255,timer);
    line(x,y,x,y+20);
  }
   
  void update()
  {
    
    if(!on) { if(random(0,1) < 0.5) initialize(); return; }
     
    timer -= dt;   
     
    
    vy += g;
    y += vy;
     
    
    keyPressed();
    x += vx;
    
    if (timer < 0) {
      on = false;
    }
  }
   
  void keyPressed()
  {
    if (key=='w') {vx-=0.01;}
    if (key=='W') {vx+=0.01;}
    
    if (vx<-0.5) {vx=-0.5;}
    if (vx>0.5) {vx=0.5;}
}
}
