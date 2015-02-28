
import netscape.javascript.*;

int w = 500;
int h = 500;
int timeInc = 0;
int birthRate = 100;
int numRings = 4;
int numParticles = 2000;
int maxNumParticles = numParticles * numRings;

Particles particles;

class Particle{
  PVector A;
  PVector B;
  int id;
  float speed;
  float damping = 0.8;
  
  Particle(PVector a, int i, float s){
     A = a;
     B = new PVector(0, 0);
     id = i;
     speed = s;
  }
  
  void Move(){
    A.normalize();
    A.mult(speed * damping + random(0.1));
    B.x += A.x;
    B.y += A.y;
  }
  
  void Bounce(){
    if(B.x > w/2 || B.x < -w/2){
      A.x *= -1;
    }
    if(B.y > h/2 || B.y < -h/2){
      A.y *= -1;
    }
  }
  
  void Damping(){
    if(damping > 0.1){
      if(B.x > w/2){
        damping -= 0.1;
        B.x -= 1;
      }else if(B.x < -w/2){
        damping -= 0.1;
        B.x += 1;
      }
      
      if(B.y > h/2){
        damping -= 0.1;
        B.y -= 1;
      }else if(B.y < -h/2){
        damping -= 0.1;
        B.y += 1;
      }
    }
  }
  
  void Draw(){
    //stroke(50);
    //strokeWeight(1);
    //line(B.x, B.y, 0, 0);
    
    stroke(0, 64, 255);
    strokeWeight(4);
    point(B.x, B.y);
    
    //stroke(100, 0, 0);
    //strokeWeight(10);
    //point(0, 0);
    
    
//   for(int i=0; i<10; i+=1){
//      stroke(0, 25);
//      strokeWeight(2);
//      point(((PVector)Trail.get(i)).x, ((PVector)Trail.get(i)).y);  
//    }
    
   
    //println(Trail.get(0) + " : " +  Trail.size());
    //println(A + " : " + B);
  }
}

class Particles{
  ArrayList particles = new ArrayList();
  Particles(int n){
    CreateParticles(n);
  }
  
  void CreateParticles(int n){
    float radius = 100;
    for(int i=0; i<n; i+=1){
      float theta = ((float)(i+1) / (float)n) * 2 * PI;
      if(i % numParticles == 0){
        ring += 1;
      }else if(ring > maxNumParticles / numParticles){
        ring = 0;
      }
      particles.add(new Particle(new PVector(sin(theta) * radius, cos(theta) * radius), i, (ring + 1) * 0.75)); //random(-w/2, w/2), random(-h/2, h/2))  
    }
  }
  
  int ring = 0;
  int ringID = 0;
  void Draw(){
    stroke(50);
    strokeWeight(1);
    
    for(int i=0; i<particles.size(); i+=1){
      if(i % numParticles == 1){
        ring += 1;
      }else if(ring > maxNumParticles / numParticles){
        ring = 0;
      }
      
      ringID = ring * numParticles;
      //println(ring + " : " + ringID);
       
//      if(i>0){
//        
//        Particle p01 = (Particle)particles.get(i - ringID);
//        Particle p02 = (Particle)particles.get(i - 1 - ringID);
//        PVector p1 = ((Particle)particles.get(p01.id)).B;
//        PVector p2 = ((Particle)particles.get(p02.id)).B;
//        
//        line(p1.x, p1.y, p2.x, p2.y);
//      }  
    }
  }
}

void setup(){
  size(w, h);
  //smooth();
  colorMode(RGB, 100);
  background(100);
  translate(w / 2, h / 2);
  
  particles = new Particles(0); 
  
}

void draw(){
  //background(100);
  
  noStroke();
  fill(100, 100, 100, 10);
  rect(0, 0, w, h);
  
  translate(w / 2, h / 2);
  
  int numParticlesUpdated = particles.particles.size();
  
  if(numParticlesUpdated < maxNumParticles){
    timeInc += 1;
    if(timeInc % birthRate == 1){
      if(birthRate > 11){
        birthRate -= 10;  
      }
      particles.CreateParticles(numParticles);  
    }
  }
  
  particles.Draw();
  
  for(int i=0; i<numParticlesUpdated; i+=1){
    Particle p = ((Particle)particles.particles.get(i));
    p.Move();
    p.Bounce();
    p.Damping();
    p.Draw();  
  }
  
  
  //DisplayItems();
}


void DisplayItems(){
  Cross();
  Grid(10);
}

void Cross(){
  stroke(0, 50);
  strokeWeight(1);
  line(0, -h / 2, 0, h / 2);
  line(-w / 2, 0, w / 2, 0);  
}

void Grid(int n){
  stroke(0, 12.5);
  strokeWeight(1);
  for(int i=0; i<w/n; i+=1){
    line(-w / 2 + ((w / n) * i), -h / 2, -w / 2 + ((w / n) * i), h / 2);
    line(-w / 2, -h / 2 + ((h / n) * i), w / 2, -h / 2 + ((h / n) * i));
  }
   
}

