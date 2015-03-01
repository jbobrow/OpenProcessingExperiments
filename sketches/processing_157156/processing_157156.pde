
Particle[] p = new Particle[1000];

Particle lonelyParticle; 

void setup() { 
  size(600, 600); 
  background(255); 
  for ( int i = 0 ; i < p.length; i++ ) {
    p[i] = new Particle(-i * .01, i * .01, -i * .01, i * .01);
  }
  lonelyParticle = new Particle(-1, 1, -10, 1);
} 

void draw() {
  background(255);

  lonelyParticle.update();
  lonelyParticle.display(); 

  for ( int i = 0 ; i < p.length; i++ ) {
    p[i].update(); 
    p[i].display();
  }
} 

void mousePressed() {
    for ( int i = 0 ; i < p.length; i++ ) {
      p[i] = new Particle(-i * .01, i * .01, -i * .01, i * .01); 
    }
  lonelyParticle = new Particle(-1, 1, -10, 1);
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
    size = random(10,20); 
    xSpeed = random(xMin, xMax);
    ySpeed = random(yMin, yMax); 
    
//    xSpeed = random(-1,1);
//    ySpeed = random(-3,0); 
  }
  
  //update function
  void update() {
    ySpeed += 0.05; 
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
    rect(x,y,size,size);
  }
}


