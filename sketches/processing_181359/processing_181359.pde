

PVector startPosition;
PVector position;
PVector velocity;
 
PVector gravity;
 
float mass = 10;
 
ArrayList<Obstacle> obstacles;

Emitter emitter;

void setup() {
  size( 800, 600 );
  frameRate(25);
  smooth();
   
  emitter = new Emitter();
  obstacles = new ArrayList<Obstacle>();
  
  for ( int i = 0; i < 20; i++ ) {
    obstacles.add( new Obstacle( new PVector( random( 0, width ), random( 0, width ), 0.0 ), random( 20, 50 ) ) );
  }
  
  startPosition = new PVector();
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity  = new PVector(0, 0.3);  // gravity goes down
}
 
void draw() {
  background(44);
 
  /* Calculate the movement */   
  PVector acceleration = new PVector();
  acceleration.add( gravity );
  velocity.add( acceleration );
  position.add( velocity );

  for ( int i = 0; i < obstacles.size(); i++ ) {
    Obstacle o = (Obstacle) obstacles.get( i );
     
    if ( o.collision( position ) ) {
      velocity.mult( 0.5 );
      o.radius *= 0.5;
      
      Obstacle o2 = new Obstacle( new PVector( o.position.x, o.position.y, o.position.z ), o.radius );
      o2.position.x += 10;
      o.position.x -= 10;
      
      o.applyForce( velocity );
      o2.applyForce( velocity );
      
      obstacles.add( o2 );
      
      emitter.addParticlesAt( position, velocity, (int) o.radius );
    }
    o.radius += 0.01;
    o.applyForce( gravity );
    o.update();
  }
 
  emitter.update();
  
  /* Draw the object */
  noStroke();
  fill(255);
 
  ellipse( position.x, position.y, mass, mass );
   
 
  /* Draw slingshot */
  if(mousePressed) {
    stroke(255, 0, 0);
    line(mouseX, mouseY, startPosition.x, startPosition.y);
     
    noStroke();
    fill(255);
     
    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 10, 10);
  }
   
   
  /* Draw vectors (DO NOT COPY)  */
  stroke(255, 0, 0);
  //drawVector(velocity, position, 20);
  stroke(0, 255, 0);
  //drawVector(acceleration, position, 200);
 
  for ( Obstacle o : obstacles ) {
    o.display();
  } 
  
  emitter.display();
}
 
 
void mousePressed() {
  startPosition.set(mouseX, mouseY, 0);
}
 
 
void mouseReleased() {
  position.set( startPosition );   // Begin where we started dragging
   
  PVector mouseDirection = new PVector(mouseX, mouseY);   // Calculate the shooting direction & strength
  mouseDirection.sub(startPosition);
  mouseDirection.mult(-1);   // Other way
  mouseDirection.mult(0.15);  // Scale it down
 
  velocity.set(mouseDirection);
}
 
void drawVector(PVector vec, PVector base, float len) {
  pushMatrix();
  float arrowSize = 4;
  translate(base.x, base.y);
  rotate(vec.heading2D());
  float lineLength = vec.mag() * len;
  line(0, 0, lineLength, 0);
  line(lineLength, 0,lineLength - arrowSize, arrowSize * 0.5);
  line(lineLength, 0,lineLength - arrowSize,-arrowSize * 0.5);
  popMatrix();
}
class Emitter {

  ArrayList<Particle> particles;
  
  Emitter() {
    particles = new ArrayList<Particle>();
  }  
  
  void addParticlesAt( PVector p, PVector force, int amount ) {
    for ( int i = 0; i < amount; i++ ) {
      particles.add( new Particle( p, force, (int) random( 20, 40 ) ) );
    }
  }
  
  void update() {
    for ( int i = 0; i < particles.size(); i++ ) {
      Particle p = (Particle) particles.get( i );
      if ( p.isDead() ) {
        particles.remove( i );
      }
      else {
        p.update();
      }
    }
  }
  
  void display() {
    for ( Particle p : particles ) {
      p.display();
    }
  }
  
}

class Particle {

  int life;
  int maxLife;
  float friction;
  PVector position;
  PVector velocity;
  
  Particle( PVector p, PVector force, int l ) {
    position = new PVector( p.x, p.y, p.z);
    velocity = new PVector( random( -1, 1 ), random( -1, 1 ), 0.0 );
    velocity.normalize();
    velocity.mult( random( 5, 10 ) );
    velocity.add( force );
    friction = random( 0.95, 1.0 );
    life = maxLife = l;
  }
  
  void update() {
    life--;
    velocity.add( gravity );
    velocity.mult( friction );
    position.add( velocity );
  }
  
  boolean isDead() {
    return life <= 0;
  }
  
  void display() {
    noStroke();
    fill( 200, map( life, 0, maxLife, 200, 0 ), 20 );
    ellipseMode( CENTER );
    float radius = map( life, 0, maxLife, 0, 5 );
    ellipse( position.x, position.y, radius, radius );
  }
}
class Obstacle {

  boolean hit;
  float radius;
  float friction;
  PVector position;
  PVector velocity;

  Obstacle( PVector p, float r ) {
    position = p;
    radius = r;
    hit = false;
    friction = 0.95;
    velocity = new PVector( 0, 0, 0 );
  }
  
  void applyForce( PVector force ) {
    velocity.add( force );
  }
  
  void update() {   
    velocity.mult( friction );
    position.add( velocity );
    
    bordercollision();
  }
  
  void bordercollision() {
    if ( position.x > width ) position.x = 0;
    if ( position.x < 0 ) position.x = width;
    if ( position.y > height + radius ) position.y = -radius;
    if ( position.y < -radius ) position.y = height + radius;
  }
  
  boolean collision( PVector p ) {
    hit =  position.dist( p ) < radius;
    return hit;
  }
  
  void display() {
    noStroke();
    if ( hit ) {
      fill( 200, 50, 50 );    
    }
    else {
      fill( 100 );
    }
    ellipseMode( CENTER );
    ellipse( position.x, position.y, radius * 2, radius * 2 );
  }
}


