
Mover[] movers = new Mover[7];

int direction=1;
void setup() {
  size(1000, 500);
  randomSeed(1);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    // I have used HSB mode to have similar colored balls with same saturation and brightness
    colorMode(HSB, 100);
    color tint=color(random(50, 100),55,100);
    movers[i] = new Mover(tint,random(1, 4), random(width), 0);
  }
}

void draw() {
  background(color(15));
  // used the closer to black as background
  
  // Now, the following if else changes how Movers show up when key is pressed and not pressed 
  if(!keyPressed)
  {
    for (int i = 0; i < movers.length; i++) {
    PVector wind = new PVector(0.01, 0);
    PVector gravity ;
    if (direction==1){
      // when direction is 1 the gravity is downward
      gravity = new PVector(0, 0.1*movers[i].mass);
    }
    else{
      // when direction is -1 the gravity is upward, makes it topsy-turvy
      gravity = new PVector(0, -0.1*movers[i].mass);
    }
    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);
    
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  }
  else
  {
    // when a key is pressed the movers are paused.
    for (int i = 0; i < movers.length; i++) 
      movers[i].display();
  }
  
}
// This is to toggle the direction of gravity right when key is released
void keyReleased()
   {    // when direction = 0 the statement below changes it to 1 and
        // when direction = 1 the statement below changes it to 0
       direction= 1-direction;
   }
  
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color tint; 

  // added color to Movers
  Mover(color t,float m, float x , float y) {
    tint = t; // added tint to display colors on the movers
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(tint);
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  void checkEdges() {
// the term "width-mass*8" helps keep Movers inside the boundaries of canvas

    if (location.x > width-mass*8) {
      // when the Mover reach bottom of the frame, it needs to bounce, i.e. velocity reverses
      location.x = width-mass*8;
      velocity.x *= -1;
    } 
    else if (location.x < 0) {
      // when the Mover reach at the top in the frame, it needs to bounce, i.e. velocity reverses
      location.x = 0;
      velocity.x *= -1;
    }
    
   
    if (location.y > height - mass*8 ) {
      // when the Mover reach in the right of the frame
      velocity.y *= -1;
      location.y = height - mass*8;
    }
      else if (location.y <0 ){
      // when the Mover reach in the left of the frame
      velocity.y *= -1;
      location.y = 0;
      }
  }
}


