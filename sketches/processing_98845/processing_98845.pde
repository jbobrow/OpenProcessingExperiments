
Particle[] particles;
 
//PImage img;
float r = random(-1,1);
float a = PI/4;
 
int NUM_PARTICLES =  5;
int NUM_PARTICLES1 = 5;
void setup() {
  size(1000, 1000);
  noStroke();
  background(0);
  strokeWeight(2);
  fill(150);
  smooth();
//  img = loadImage("starok.png");
   
}
void draw() { 
  //background(0); 
  
 
  if (particles !=null) {   
    for (int i = 0; i < NUM_PARTICLES; i++) {     
      particles[i].exist();
    }
  //  for(int i = 1; i > 6; i--)  {
      // particles[i].exist();
 // }
 
  }
}
 
 
 
 
void mouseMoved() { 
  particles = new Particle[NUM_PARTICLES]; 
  for (int i = 0; i< NUM_PARTICLES;i++) {   
    particles[i] = new Particle();
 
  }
  
}
 
void mouseReleased(){
  
   for (int i = 6; i < NUM_PARTICLES ;i++) {   
   particles[i] = new Particle();
   
}
}
public class Particle { 
  float x, y; 
  float vx, vy; 
  float ax, ay;  
  public Particle() {     
    x = mouseX;     
    y = mouseY;     
   vx = vy = 1;     
    ax = random(-0.5, 2);     
    ay = random(-3,2);
  }  
  
   
  public void exist() {    
    vx -= ax;    
    vy -= ay;    
    x -= vx;    
    y -= vy;   
     
 ellipse(x,y,10,10);
  fill (255,random(200),random(200),50);
   ellipse(random(x*a+200),y/r-300, 60,60);
   //rotate(90);
   fill (255,random(200),random(200),180);
    
  }
 
}
