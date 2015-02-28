
// Marcela Godoy
// The Nature of Code // midterm project spring 2012
// Based on "Simple two particles and spring example" by D. Shiffman
import netscape.javascript.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

// Reference to physics world
VerletPhysics2D physics;

ArrayList<Particle> allParticles;
ArrayList<Particle> allFace;

ArrayList allSprings;
ArrayList allConnections;

Particle n1; //nucleo
Particle n2; //nucleo
int particles_number= 60;
float angle=radians(random(360));
float u = radians(360/particles_number);
float v;
PImage b;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);
  b = loadImage("c.png");

  allParticles = new ArrayList<Particle>();
  allFace = new ArrayList<Particle>();
  allSprings = new ArrayList();
  allConnections = new ArrayList();

  // Initialize the physics
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.09)));
  
  

  // This is the center of the world
  Vec2D center = new Vec2D(width/2, height/2);
  // these are the worlds dimensions (50%, a vector pointing out from the center in both directions)
  Vec2D extent = new Vec2D(width/2, height/2);

  // Set the world's bounding box
  physics.setWorldBounds(Rect.fromCenterExtent(center, extent));

  
  fill(0, 100);
  noStroke();
  float x = random(width);
  float y = 0;
  
  n1 = new Particle(x,y);
  n1.r = 150;
  n1.opacity=0;

  //physics.addBehavior(new AttractionBehavior(n1, width, 0.1));
  
  n2 = new Particle(random(width),random(height));
  
  
  VerletSpring2D spring_n = new VerletSpring2D(n2, n1, 40, 0.1);
  physics.addSpring(spring_n);
  
  
//////////////////////////physics.addParticle(n1);
  
  for (int i= 0; i< particles_number; i++) { 
    
    v = 100+5*sin(u*i*(particles_number/2.5));
    Particle p = new Particle(x + v * cos(angle + i*u), y + v * sin(angle + i*u)); //arrange different ratios in a sinusoidal way
    physics.addParticle(p);
    allParticles.add(p);
    

    // add a spring between n1 and every p
    
    VerletSpring2D spring = new VerletSpring2D(n1, allParticles.get(i), v-20, 0.01);
    physics.addSpring(spring);
    allSprings.add(spring);
    
    // add a spring between p's
    
    VerletParticle2D pi = (VerletParticle2D) allParticles.get(i);
    for (int j = 0; j < i; j++) {
       VerletParticle2D pj = (VerletParticle2D) allParticles.get(j);
        VerletSpring2D connection = new VerletSpring2D(pi, pj, 100, 0.00001);
        physics.addSpring(connection);
        allConnections.add(connection);
    }
    
    
    
  }//////////////////////////physics.addParticle(n1);
  
  
 //////////////////////////physics.addParticle(n2);
  
  for (int i= 0; i< 150; i++) { 
    
    v = 90+5*sin(u*i*(particles_number/5.5));
    Particle p = new Particle(x + v * cos(angle + i*u), y + v * sin(angle + i*u)); //arrange different ratios in a sinusoidal way
    physics.addParticle(p);
    allFace.add(p);
    p.r=random(1,3);

    // add a spring between n1 and every p
    
    VerletSpring2D spring2 = new VerletSpring2D(n2, allFace.get(i), v-20, 0.01);
    physics.addSpring(spring2);
    allSprings.add(spring2);
    
    // add a spring between p's
    
    VerletParticle2D pi = (VerletParticle2D) allFace.get(i);
    for (int j = 0; j < i; j++) {
       VerletParticle2D pj = (VerletParticle2D) allFace.get(j);
        VerletSpring2D connection2 = new VerletSpring2D(pi, pj, 100, 0.00001);
        physics.addSpring(connection2);
        allConnections.add(connection2);
    }
    
    
    
  }//////////////////////////physics.addParticle(n2);
  
  
  
  
  //n1.lock();
  
}



void draw() {

  // Update the physics world
  physics.update();

  background(255);
  float angle2 = u;
  
  for (Particle p : allParticles) {
    p.display(); 
    stroke(0,40);
    line(n1.x, n1.y, p.x, p.y);
  }
  
  for (Particle p : allFace) {
    p.display(); 
    stroke(0,40);
    line(n2.x, n2.y, p.x, p.y);
  }
  

  
  n1.display();
  n2.displayFace();
 
  float distance = dist(n2.x, n2.y, mouseX, mouseY);
    if(distance < 100){
      n2.lock();
      n2.x = mouseX;
      n2.y = mouseY;
      n2.unlock();
      
    }


}


 

