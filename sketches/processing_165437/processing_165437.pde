
// Basically acts like a particle system, but each particle seeks the cursor during its lifetime.
// Click the mouse to knock particles away, explosion-style.
// Particles are called 'Vehicles' as per Ch.6 of that book. VehicleSources are the particle emitters.


ArrayList<VehicleSource> vsources; // ArrayList holding references to all of the VehicleSources.
int numSources = 15; // Number of VehicleSources.
PVector mouseVec; // 2D vector given the (x,y) position of the cursor on the screen.

boolean justClicked; // True if mouse was clicked during the last frame.

void setup() {
  size(800, 800); // 'width' and 'height' are reserved variable names automatically assigned to the values you put in here.
  colorMode(HSB, 100); // Use HSB color space rather than RGB, makes it easier to do the color change effect.
  smooth();
  
  vsources = new ArrayList<VehicleSource>(); // Initialize the ArrayList.
  
  int vehicleLifetime = 500; // Lifetime of Vehicles emitted from each VehicleSource
  int maxVehicles = 100; // VehicleSources produce no more Vehicles when this many are still alive.
  
  // The biggest performance constraint here will be the maximum number of total Vehicles alive on the screen,
  // (numSources) * (maxVehicles). On my computer using the values here, i'm getting 60fps but just barely, maybe dipping to 57 or 58.
  
  
  
  for(int i = 0; i < numSources; i++)
  {
  // Choose two random numbers x0, y0 from the ranges (0, width), (0, height) for the VehicleSource location.
  float x0 = random(width); 
  float y0 = random(height);
  // Create a new VehicleSource using the parameters defined previously.  
  vsources.add(new VehicleSource(x0, y0, vehicleLifetime, maxVehicles));
  }
  background(0,0,0); // Draw a black background (HSB coordinates)
  mouseVec = new PVector(0,0); // Initialize the cursor location PVector.
}

void draw() { // This is by default called continuously until the sketch ends.
  background(0,0,0); // Redraw the background every frame to clear the previous one.
  
  // Construct mouseVec in a sort of cumbersome way. They use a lot of PVectors in the book for didactic purposes,
  // but for 2D things it can be easier just to store and use the 2 coordinates.
  mouseVec.x = mouseX; 
  mouseVec.y = mouseY;
  
  // Update all of the VehicleSources by iterating through the vsources ArrayList.
  for(int i = 0; i < numSources; i++)
  {
    VehicleSource vsource = vsources.get(i); // get the i'th VehicleSource from vsources
    vsource.update(mouseVec); // update the current VehicleSource
    if(justClicked){vsource.timeSinceClick = 1;}
  }
  justClicked = false;
  println(frameRate); // Displays the current framerate in the console below as the sketch runs.
}

void mouseClicked() {
  justClicked = true;
}
// This class defines the particles of the simulation and their behavior.
// Properties whose comments start with ** indicate ones that are most interesting to fiddle with.
class Vehicle {
  PVector location; // (x,y) location components
  PVector velocity; // (x,y) velocity components
  PVector acceleration; // (x,y) acceleration components
  float size; //** Vehicles are currently squares, so this is 1/2 the side length of that square.
  float maxforce; //** Maximum force that can be applied at a given iteration
  float maxspeed; //** Maximum speed a Vehicle can have
  float slowradius; //** When the distance from a Vehicle to the cursor is less than this number, the Vehicle starts slowing down.
  int life; // Current amount of 'life' the Vehicle has left. Decremented by 1 each iteration.
  int lifetime; //** The total lifetime of this Vehicle.
  float hue; // Current hue value (H) for this Vehicle's HSB color. Changes over time according to a differential equation.
  float dhue; // The derivative of hue. Or, since time advances in discrete steps, not really a derivative, it's something simpler.
  float maxdhue; //** The absolute value of dhue stays below this value.
  float sighue; //** The color change update equation has a random noise component, bigger sighue = more noise.
  float dt; //** This sets the timescale of the color changes - make it larger for them to oscillate more quickly.
  float shrink; // Parameter that sets how much the Vehicle shrinks each iteration.
  
  PVector noise; // The Vehicle's motion update also contains a noise term that is a PVector.
  PVector explosion; // Explosion force applied to a Vehicle after a mouse click.
  
  // Every class has a constructor function, this is the thing you call to actually create objects of a certain class. 
  // The input parameters are the setup parameters that you pass to every Vehicle when it is created.
  //      initial x location   initial y location   initial x velocity   initial y velocity   lifetime       initial hue
  Vehicle(float x,             float y,             float vx,            float vy,            int lifetime_, float hue0) {
    location = new PVector(x,y); // Assemble location coordinates into a PVector.
    velocity = new PVector(vx,vy); // Assemble velocity coordinates into a PVector.
    acceleration = new PVector(0,0); // Create a new PVector for acceleration and set it to 0
    noise = new PVector(0,0); // Create a new PVector for motion noise and set it to 0.
    explosion = new PVector(0,0);
    size = 8; //**
    maxspeed = 10; //**
    maxforce = 0.25; //**
    slowradius = 300; //**
    
    // Give the following variables the initial values that were passed in.
    life = lifetime_;
    lifetime = lifetime_;
    hue = hue0;
    
    maxdhue = 20; //**
    
    dhue = random(2 * maxdhue) - maxdhue; // Random initial derivative.
    sighue = 7; //**
    dt = 0.075; //**
    float finalSize = 0.22; //** At the end of its lifetime, a Vehicle will be (finalSize) * its original size. So currently, 22%.
    shrink = pow(finalSize, 1/float(lifetime_)); // Do a little math to figure out the necessary shrink factor each iteration.
  }
  
  void update() { // Physics and hue updates that run each iteration
    // Basic physics idea: add acceleration to velocity, add velocity to location, then clear the acceleration 
    velocity.add(acceleration); // velocity <-- velocity + acceleration
    velocity.limit(maxspeed); // limit velocity to maxspeed
    location.add(velocity); // location <-- location + velocity
    acceleration.mult(0); // Set acceleration to 0
    
    // A slightly trickier equation for determining how hue changes at each step. I can explain it some time, if you like, but
    // the idea is basically to let it wander randomly between 0 and 100, with some precautions to keep it from getting stuck at 0 or 100.
    dhue = constrain(dhue + random(2 * sighue) - sighue + sighue / pow(hue, 2) - sighue / pow(100 - hue, 2), - maxdhue, maxdhue);
    hue += dt * dhue;
    life -= 1; // Decrement life
    size *= shrink; // Shrink the Vehicle's size.
  }
  
  void applyForce(PVector force) { // Add the input force vector (force) to the acceleration vector.
    // Create the x and y components of the motion noise, which get added along with the input force.
    noise.x = random(2 * maxforce / .2) - maxforce / .2;
    noise.y = random(2 * maxforce / .2) - maxforce / .2;
    //force.limit(maxforce); // Constrain the input force to be smaller than maxforce.
    acceleration.add(force); // Add the input force to acceleration.
    acceleration.add(noise); // Add the motion noise to acceleration.
  }
  
  // Applies a force to the Vehicle that pushes it towards the screen location with coordinates specified by the input (target).
  void seek(PVector target, float timeSinceClick) { 
    // More comments to come on all this, but it's basically the content of the first half of Ch.6.
    PVector desired = PVector.sub(target, location);
    float d = desired.magSq();
    desired.normalize();
    
    // Calculate explosion force
    float e = -1999999999 / pow(d / 10000,4.5) * pow(timeSinceClick, -8);
    explosion.x = e * desired.x;
    explosion.y = e * desired.y;
    
    float srsq = pow(slowradius, 2);
    float m; // Initialize this here for reasons.
    if (d < srsq)
    {
      m = (d * maxspeed) / srsq;
    }
    else
    {
      m = maxspeed;
    }
    desired.mult(m);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
    applyForce(explosion);
    
    
    update();
  }
  
  // Create the colored square that is the Vehicle's appearance
  void display() { 
    // Get the Vehicle's current heading so that asymmetric Vehicle shapes can point towards where the Vehicle is moving.
    float theta = velocity.heading() + PI/2;
    fill(hue, 95, 80); // Set the fill color (again in HSB coordinates).
    noStroke(); // No outline on the particles.
    pushMatrix(); // Some openGL business that I don't fully understand
    translate(location.x, location.y); // Set this Vehicle's shape's location at (x,y)
    rotate(theta); // Rotate the shape to the appropriate heading.
    beginShape(); // Call this before listing shape vertices. You can make fairly arbitrary polygons this way.
    // Four vertices of a slightly asymmetric diamond, how asymmetric determined by those 0.8's and 1.1's
    vertex(0, -1.1 * size);
    vertex(-0.8*size, 0);
    vertex(0, 1.1 * size);
    vertex(0.8*size, 0);
    endShape(CLOSE); // Call this with 'CLOSE' to end the shape and also add a line from the last vertex to the first
    popMatrix(); // openGL mysteries.
  }
}
// Basically, a particle emitter that emits Vehicles. Since it controls the starting hue of each
// Vehicle, there's a little bit of dynamics updating happening which controls the starting hue
// over time.

// Once again, variables marked with ** should be more interesting to tweak.
class VehicleSource 
{
  ArrayList<Vehicle> vehicles; // ArrayList of all the living Vehicles created by this VehicleSource
  float x; // x location of the VehicleSource. Doesn't currently change over time, but it could.
  float y; // y location of the VehicleSource.
  float spawnRadius; // How far away from (x,y) can Vehicles spawn?
  float spawnSpeed; // Vehicles spawn with a random initial speed between 0 and spawnSpeed
  int vehicleLife; // Lifetime of the Vehicles spawned here.
  int maxVehicles; // Maximum number of living vehicles this VehicleSource can own.
  float baseHue; // Starting hue (0-100) of the Vehicles that spawn here.
  float dhue; // Derivative of baseHue. baseHue updates according to the same equation as the one that Vehicles use for their color changes.
  float maxdhue; // Cap on the magnitude of dhue.
  float sighue; // Same as in Vehicle
  float dt; // Same as in Vehicle. 
  float timeSinceClick; // Keeps track of the number of frames since a click, used to generate explosion effects.
  
  // Initialize with an x location, y location, the vehicleLife value, and the maxVehicle value.
  VehicleSource(float x_, float y_, int vehicleLife_, int maxVehicles_)
  {
    x = x_;
    y = y_;
    vehicleLife = vehicleLife_;
    vehicles = new ArrayList<Vehicle>(); // Initialize the vehicles ArrayList.
    spawnRadius = 30; //**
    spawnSpeed = 15; //**
    maxVehicles = maxVehicles_;
    baseHue = random(100); // random initial baseHue.
    maxdhue = 20; //**
    dhue = random(2 * maxdhue) - maxdhue; // random initial dhue.
    sighue = 5;
    dt = 0.01; //**
    timeSinceClick = 99999;
    
  }
  
  // Update all the Vehicles in this VehicleSource. Needs the PVector mouseVevc to pass to the Vehicles.
  void update(PVector mouseVec)
  {
    // baseHue and dhue dynamics update equations.
    dhue = constrain(dhue + random(2 * sighue) - sighue + sighue / pow(baseHue, 2) - sighue / pow(100 - baseHue, 2), - maxdhue, maxdhue);
    baseHue += dt * dhue;
    
    // Increment timeSinceClick
    timeSinceClick += 1;
    
    // If there are currently less than maxVehicles living, spawn another with some probability.
    if(vehicles.size() < maxVehicles)
    {
      // The goal with this formula is this: The spawn probability is high when there are few Vehicles, 0 when there are maxVehicles
      // Vehicles, and decreases in between.
      float spawnProbability = 1 - float(vehicles.size()) / maxVehicles;
      if(random(1) < spawnProbability ){spawn();}
    }
    
    // Iterate through vehicles and update all of the Vehicles. Iterate backwards so that the updates aren't screwed up
    // When a Vehicle is killed and removed from the ArrayList.
    for(int i = vehicles.size() - 1;  i >= 0; i--)
    {
      Vehicle v = vehicles.get(i); // Get the i'th Vehicle.
      v.seek(mouseVec, timeSinceClick); // Apply the force that makes it seek the cursor, or explode away from it.
      v.display(); // Update the Vehicle's display
      if(v.life == 0)
      { 
        // If the life variable == 0, kill the current Vehicle.
        kill(i);
      }
    }
  }
  
  // The kill function.  Currently it just removes the dead Vehicle from the ArrayList vehicles, but it could do other things.
  void kill(int killIndex)
  {
    vehicles.remove(killIndex);
  }
  
  // The function for spawning a new Vehicle.
  void spawn()
  {
    float spawnAngle = random(2*PI); // spawn at a random angle away from the VehicleSource's (x,y) location.
    float r0 = random(spawnRadius); // spawn, at that angle, at this radius from the VehicleSource's (x,y) location.
    // Use polar coordinate business to figure out the Vehicle's initial (x0,y0) given that angle and radius.
    float x0 = x + r0 * cos(spawnAngle);
    float y0 = y + r0 * sin(spawnAngle);
    // Find the initial speed
    float s0 = random(spawnSpeed);
    // Create a velocity vector pointing away from the VehicleSource with speed s0.
    float xv0 = s0 * cos(spawnAngle);
    float yv0 = s0 * sin(spawnAngle);
 
    vehicles.add(new Vehicle(x0, y0, xv0, yv0, vehicleLife, baseHue)); // Construct the new Vehicle.
  }
}


