
ArrayList particles; 


void setup() {
  size(600,600); 
  background(240); 
  particles = new ArrayList();   
} 

void draw() {
  background(39); 
  
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle) particles.get(i); 
    p.update(); 
    p.display(); 
    
    if (p.y > height || p.y < 0 || p.x > width || p.y < 0 ) {
      particles.remove(i); 
    }
  }
 
 println(particles.size()); 
} 

void mousePressed() { 
  particles.add(new Particle(-1, 1, -5, -1));
 
} 

void mouseDragged() { 
  particles.add(new Particle(-1, 1, -5, -1));
}
class Particle {
  float x; 
  float y; 
  float size; 
  float xSpeed; 
  float ySpeed; 
  
  //CREATE CONSTRUCTOR
  Particle(float xMin, float xMax, float yMin, float yMax) {
    x = mouseX; 
    y = mouseY;
    size = random(1,20); 
    xSpeed = random(xMin, xMax);
    ySpeed = random(yMin, yMax); 
    
//    xSpeed = random(-1,1);
//    ySpeed = random(-3,0); 
  }
  
  //update function
  void update() {
    ySpeed -= 0.05; 
    x += xSpeed;
    y += ySpeed; 
  } 
  
  //display function
  void display() {     
    noStroke(); 
    float totalSpeed = abs(xSpeed) + abs(ySpeed); 
    float newFill = map(totalSpeed, 0, 5, 0, 255); 
    fill(newFill); 
    noSmooth(); 
    rectMode(CENTER);
    ellipse(x,y,size,size);
  }
}


