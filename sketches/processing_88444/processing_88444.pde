
ArrayList systems;

void setup() {
   frameRate(24);
   size(400,400);
   background(0);
   systems = new ArrayList();
  
}

void mouseClicked() {
  // int size = round(random(100,1000));
  // systems.add( new ParticleSystem(size,random(.004*size,.006*size),mouseX,mouseY) ); 
}

void draw() {
 noStroke();
 fill(0,80);
 rect(0,0,width,height);
 
 for(int i = systems.size() -1 ; i >= 0 ; i--) {
   ParticleSystem ps = (ParticleSystem)systems.get(i);
   if(ps.done()) {
      systems.remove(i); 
   } else {
     ps.draw();
   }
 }
 
 if( random(0,1) < 0.08 ) {
   int size = round(random(100,800));
   systems.add( new ParticleSystem(size,random(.002*size,.005*size),mouseX,mouseY) ); 
 }
 
}
// Class to create a Particle System
class Particle {
  int t;
  PVector p;
  PVector v;
  float r = 3.0;
  float g = 0.05;
  color c;
  
  Particle(float max_v, color inC) {
    p = new PVector(0,0);
    float a = random(0,TWO_PI);
    float vel = random(0,max_v);
    v = new PVector(vel*cos(a),vel*sin(a));
   
    int r = (inC >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (inC >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = inC & 0xFF;          // Faster way of getting blue(argb)
    c = color( constrain( r+round(random(-30,30)) , 0 , 255),
               constrain( g+round(random(-30,30)) , 0 , 255),
               constrain( b+round(random(-30,30)) , 0 , 255));
  }
  
  void draw() {
    update();
    noStroke();
    fill(c);
    ellipse(p.x,p.y,r,r);
  }
  
  void update() {
    t++;
    v.add(new PVector(0,g)); // Accelerate
    p.add(v);                // Velocitate
  }
  
  boolean done() {
    if(random(0,t) > 50) {
       return true; 
    }
    
    return false;
  }

  
}

class ParticleSystem {
  ArrayList particles;
  PVector p; //position
  color c;
  
  
  ParticleSystem(int size, float spread, float x, float y) {
    p = new PVector(x,y);
    particles = new ArrayList();
    c = color(random(220)+35,random(220)+35,random(220)+35);
    
    for(int i = 0; i < size; i++) {
       particles.add(new Particle(spread,c)); 
    }
    
  }
  
  void draw() {
    pushMatrix();
    translate(p.x,p.y);
    
    for(int i=particles.size()-1; i >= 0 ; i--) {
      Particle p = (Particle)particles.get(i);
      if( p.done() ) {
         particles.remove(i);
      } else {
         p.draw();
      }
    }
    
    popMatrix();
  }
  
  boolean done() {
    if(particles.size() == 0 ) {
       return true; 
    }
    return false;
  }
  
}





