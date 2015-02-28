
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
ArrayList allSprings;
ArrayList allConnections;

Particle n1; //nucleo
int particles_number= 60;
float angle=radians(random(360));
float u = radians(360/particles_number);
float v;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  allParticles = new ArrayList<Particle>();
  allSprings = new ArrayList();
  allConnections = new ArrayList();

  // Initialize the physics
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0)));

  // This is the center of the world
  Vec2D center = new Vec2D(width/2, height/2);
  // these are the worlds dimensions (50%, a vector pointing out from the center in both directions)
  Vec2D extent = new Vec2D(width/2, height/2);

  // Set the world's bounding box
  physics.setWorldBounds(Rect.fromCenterExtent(center, extent));

  
  fill(0, 100);
  noStroke();
  float x = 200;
  float y = 200;
  
  n1 = new Particle(x,y);
  n1.r = 130;
  n1.opacity = 200;
  //physics.addBehavior(new AttractionBehavior(n1, width, 0.1));
  
  

  
  for (int i= 0; i< particles_number; i++) { 
    
    v = 100+5*sin(u*i*(particles_number/2.5));
    Particle p = new Particle(x + v * cos(angle + i*u), y + v * sin(angle + i*u)); //arrange different ratios in a sinusoidal way
    physics.addParticle(p);
    allParticles.add(p);
    //physics.addBehavior(new AttractionBehavior(p, 10, -1));

    
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
    
    
    
  }
  

  
  
  
  n1.lock();
  
}



void draw() {

  // Update the physics world
  physics.update();

  background(255);
  float angle2 = angle;
  
  for (Particle p : allParticles) {
    p.display(); 
    
    stroke(0,40);
   
    line(n1.x, n1.y, p.x, p.y);
    float distance = dist(p.x, p.y, mouseX, mouseY);
    if(distance < 10){
      p.lock();
      p.x = mouseX + distance*1.1;
      p.y = mouseY + distance*1.1;
      p.unlock();
    }
    
    //drawConnections();
  }
  
  n1.display();


}

void drawConnections(){
  stroke(0,40);
  

     // line(pi.x,pi.y,pj.x,pj.y);

  
}




