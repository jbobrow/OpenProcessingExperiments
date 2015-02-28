
Particle_System system;                       // to compress all balls/particles into one class

color fillColor, borderColor, textColor; // universal colors for UI
int lastPress, lastKeyPress;             // to prevent accidental double clicks

// AUTOMATIC SETUP WITH A 7 PARTICLE BEGINNING
void setup(){
  size(900, 600);
  system = new Particle_System (7, 60);
}


void draw(){
  // run the main function for each button and particle
  background(0);
  system.run();
}
class Particle{
  
  PVector forces, acceleration, velocity, location;
  float radius, mass;
  boolean grabbed, fixed;
  color thisColor;
  float[] Xs, Ys;
  
  Particle (float x, float y, int r){
    location = new PVector(x, y, 0);
    forces = new PVector(0,0,0);
    acceleration = new PVector(0,0,0);
    velocity = new PVector(0,0,0);
    radius = r;
    mass = PI*sq(r);
    thisColor = color(random(255),random(255),random(255));
    Xs = new float[5];
    Ys = new float[5];
    for(int i = 0; i < Xs.length; i++){
      Xs[i] = location.x;
      Ys[i] = location.y;
    }
  }
  
  void run(){
    strokeWeight(10);
    stroke(thisColor);
    move();
    display();
    forces.set(0,0,0);
    velocity.mult(.99);
  }
  
  
  void move(){
    // BOUNCE IF OFF LEFT, RIGHT, OR BOTTOM
    if(location.x < radius){
      velocity.x = .9*abs(velocity.x);
    }
    else if(location.x > width - radius){
      velocity.x = -.9*abs(velocity.x);
    }
    else if(location.y > height - radius){
      velocity.y = -.9*abs(velocity.y);
    }
    else{
      // OTHERWISE, REACT TO FORCES
      acceleration.set(forces);
      acceleration.div(mass);
      velocity.add(acceleration);
    }
    // MOVE 
    location.add(velocity);
  }
  
  
  void display(){
    strokeWeight(10);
    stroke(thisColor);
    ellipse(location.x, location.y, radius*2, radius*2);
    // update tail
    for(int i = 1; i < Xs.length; i++){
      Xs[i-1] = Xs[i];
      Ys[i-1] = Ys[i];
    }
    Xs[Xs.length-1] = location.x;
    Ys[Xs.length-1] = location.y;
    for(int i = 1; i < Xs.length; i++){
      strokeWeight(map(i, 0, Xs.length, 0, 10));
      line(Xs[i-1], Ys[i-1], Xs[i], Ys[i]);
    }
  }
  
  
  void accelerateDown(float a){
    forces.add(0, mass*a, 0);
  }
}

class Particle_System {

  ArrayList <Particle> particles;
  int grabIndex = -1;
  float min;      // minimum distance to apply gravity (to prevent dividing by near zero)

  Particle_System (int num, float m) {
    min  = m;
    particles = new ArrayList();
    for (int i = 0; i < num; i++) {
      particles.add( (Particle) new Particle(random(width), random(height), 2) );
    }
  }


  void run() {
    runParticles();  // make particles gravitate toward eachother, toward the ground, and display them
    if(keyPressed){     // add new particles if 'n' or 'N' is pressed
      if( millis()-lastPress > 200){
        if(key == 'n'  ||  key == 'N'){
          particles.add( (Particle) new Particle(mouseX, mouseY, 2) );
          particles.get(particles.size()-1).velocity.set(mouseX - pmouseX, mouseY - pmouseY, 0);
        }
        else if(key == 'd' ||  key == 'D'){
          if(particles.size() > 0){
            particles.remove(0);
          }
        }
        lastPress = millis();
      }
    }
  }


  // GLOBAL VARIABLES FOR THE FUNCTION BELOW
  // It seemed like a bad idea to generate new objects repeatedly...
  //
  Particle current = new Particle (0, 0, 0);
  Particle other = new Particle(0, 0, 0);
  float angle, distance, netForce;



  // FUNCTION TO APPLY GRAVITATIONAL FORCES
  void runParticles() {
    for (Particle current : particles) {
      current.accelerateDown(1);
      current.run();
      for (Particle other : particles) {
        if (other != current) {
          distance = current.location.dist(other.location);
          if (distance > min) { // to prevent infinite G
            netForce = 500000/sq(distance);
            angle = atan2(other.location.y - current.location.y, other.location.x - current.location.x);
            current.forces.add(netForce*cos(angle), netForce*sin(angle), 0);
          }
        }
      }
    }
  }
}



