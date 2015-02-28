
Particle[] particles;
Particle[] part;

PImage img;
PImage img1;
int NUM_PARTICLES = 50; 
int NUM_PARTICLES1 = 10;
void setup() { 
  size(1000, 1000); 
  stroke(0); 
  strokeWeight(3); 
  fill(150); 
  smooth();
  img = loadImage("starok.png");
  img1= loadImage("Color_icon_red_svg.png");
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
if (part !=null){
  for (int j = 0; j<NUM_PARTICLES1; j++){
    part[j].exist();
}
  for(int j=5;j>5;j++){
    part[j].exist();
  }
}
}

void mouseMoved() {  
  particles = new Particle[NUM_PARTICLES];  
  for (int i = 0; i < NUM_PARTICLES;i++) {    
    particles[i] = new Particle();

  }
 
}

void mouseReleased(){
   for (int j = 5; j < NUM_PARTICLES1 ;j++) {    
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
  //image(img1,vx,y,50,50);
  }

}


