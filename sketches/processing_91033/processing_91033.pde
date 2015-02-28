
Particle[] particles;

PImage img;
float r = random(3,3);
float a = PI/1;

int NUM_PARTICLES =  50; 
int NUM_PARTICLES1 =20;
void setup() { 
  size(1000, 1000); 
  noStroke(); 

  strokeWeight(3); 
  fill(150); 
  smooth();
  img = loadImage("starok.png");
  
} 
void draw() {  
  background(0);  
 

  if (particles !=null) {    
    for (int i = 0; i < NUM_PARTICLES; i++) {      
      particles[i].exist();
    }
    for(int i = 2; i > 10; i--)  {
       particles[i].exist();
  }

  }
}




void mouseMoved() {  
  particles = new Particle[NUM_PARTICLES];  
  for (int i = 0; i< NUM_PARTICLES;i++) {    
    particles[i] = new Particle();

  }
 
}

void mouseReleased(){
   for (int j = 4; j < NUM_PARTICLES1 ;j++) {    
    particles[j] = new Particle();
  
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
    ax = random(-0.3, 1);      
    ay = random(-1,0);
  }   
 
  
  public void exist() {     
    vx -= ax;     
vy -= ay;     
    x -= vx;     
    y -= vy;    
    
   image(img,x,y,50,50);
     ellipse (random(x*a+300),y/r+300, 40,40); 
   fill (random(255),random(200),random(200),255); 
   
  }

}



