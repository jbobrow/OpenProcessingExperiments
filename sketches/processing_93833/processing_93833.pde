
import java.util.*;
/* @pjs preload="garden.png"; */
PImage        bg;                           //background image
Flower1       daisy;                        //One Flower1
Flower1 []    daisies;                      //Flower1 array
Flower2       wild;                         //One Flower2
Flower2 []    wilds;                        //Flower2 array
Flower3       bloom;                         //One Flower3
Flower3 []    blooms;                        //Flower3 array
Flower4       tulip;                         //One Flower4
Flower4 []    tulips;                        //Flower4 array
float         flower1X = 45;               // Start Point for Flower1 array
float         flower1Y = 300;               // Start Point for Flower1 array
float         flower2X = 130;               // Start Point for Flower2 array
float         flower2Y = 300;               // Start Point for Flower2 array
float         flower3X = 225;               // Start Point for Flower3 array
float         flower3Y = 300;               // Start Point for Flower3 array
float         flower4X = 310;               // Start Point for Flower4 array
float         flower4Y = 300;               // Start Point for Flower4 array
int           numFlower1 = 5;               // Number of Flower1 to make
int           numFlower2 = 3;               // Number of Flower2 to make
int           numFlower3 = 3;               // Number of Flower3 to make
int           numFlower4 = 3;               // Number of Flower4 to make
Cloud []      clouds;                       // The Cloud Array
int           cloudY = 20;
int           cloudX;
int           numClouds = 3;
ArrayList<ParticleSystem> systems;
      


void setup()  {
  size(1000,500);
  bg = loadImage("garden.png");
  smooth();
   
  //flowers = new PinWheel[numFlowers];
  //for (int i = 0; i<numFlowers; i++)  {
    //flowers[i] = new PinWheel(flowerX,flowerY);
    //flowerX = flowerX+200;
    //flowerY = flowerY+25;
   //}
   
   clouds = new Cloud[numClouds];
   for (int i=0; i<numClouds; i++)  {
     clouds[i] = new Cloud(random(0, width), cloudY);
     cloudY=cloudY+5;
   }
   
   systems = new ArrayList<ParticleSystem>();
   for (int i = 0; i<numClouds; i++)  {
     systems.add(new ParticleSystem(1, new PVector((clouds[i].location.x) + 70, (clouds[i].location.y) + 50)));
   }
   
   daisies = new Flower1[numFlower1];
   for (int i = 0; i<numFlower1; i++)  {
     daisies[i] = new Flower1(flower1X,flower1Y);
     flower1X = flower1X+340;
   }
   //
   // Wild Flowers
   //
   wilds = new Flower2[numFlower2];
   for (int i = 0; i<numFlower2; i++)  {
     wilds[i] = new Flower2(flower2X,flower2Y);
     flower2X = flower2X+340;
   } 
   //
   // Bloom Flowers
   //
   blooms = new Flower3[numFlower3];
   for (int i = 0; i<numFlower3; i++)  {
     blooms[i] = new Flower3(flower3X,flower3Y);
     flower3X = flower3X+340;
   }
   tulips = new Flower4[numFlower4];
   for (int i = 0; i<numFlower4; i++)  {
     tulips[i] = new Flower4(flower4X,flower4Y);
     flower4X = flower4X+340;
   }
   
  }
  
   
void draw() {
  background(bg);
  //Flowers
  //
  // for  (int i = 0; i<numFlowers; i++)  {
   // flowers[i].display();
  //}
  
  //Flowers
  //
  for  (int i = 0; i<numFlower1; i++)  {
    daisies[i].display();
  }
  
   for  (int i = 0; i<numFlower2; i++)  {
    wilds[i].display();
  }
  
  for  (int i = 0; i<numFlower3; i++)  {
    blooms[i].display();
  }
  
  for  (int i = 0; i<numFlower4; i++)  {
    tulips[i].display();
  }
  
   for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle(); 
  }
  
  //Show Clouds 
  for  (int i = 0; i<numClouds; i++)  {
    clouds[i].display();
  }
  
}  
// Cloud
// by: Elizabeth Turpin
//
// Displays a Cloud to float around using Perlin Noise
/* @pjs preload="BiggerCloud.png"; */

class Cloud extends Object {

  Cloud(float x, float y) {
    super (x, y, "BiggerCloud.png");
  }

}
// Flower1
// by: Elizabeth Turpin
//
/* @pjs preload="daisy1.png"; */

class Flower1 extends Object {
  int growX = 5;
  int growY = 5;
  int gX = 20;
  int gY = 20;

  Flower1(float x, float y) {
    super (x, y, "daisy1.png");
  }
  
  //void show()  {
      // pushMatrix();
      // translate(-size.x/2, -size.y/2);
      // resize(gX,gY);
      // image(myImage, 0, 0);
     //  popMatrix();
  //}
  


}
// Flower2
// by: Elizabeth Turpin
//
/* @pjs preload="wild1.png"; */

class Flower2 extends Object {

  Flower2(float x, float y) {
    super (x, y, "wild1.png");
  }

}
// Flower3
// by: Elizabeth Turpin
//
/* @pjs preload="bloom.png"; */

class Flower3 extends Object {

  Flower3(float x, float y) {
    super (x, y, "bloom.png");
  }

}


// Flower3
// by: Elizabeth Turpin
//
/* @pjs preload="Flower4.png"; */

class Flower4 extends Object {

  Flower4(float x, float y) {
    super (x, y, "Flower4.png");
  }

}
//
// Object
// by Dr. David Brown (adapted from "The Nature of Code")
// ???? **Added a Check Edges Method that allows objects to float off screen
// - BUT, I think I need to take enforceBoundaries out of update and put in show??f
// 
// Top level virtual world construct. Handles mass, force,
// location, velocity, acceleration and rotation. Has default
// display capabilities of a filled rectangle or a tinted or
// untinted image.
//
class Object {
  PVector size;               // size of object
  float   mass;               // mass of object (mostly ignored)
  PVector myColor;            // color of object (RGB)
  PImage  myImage;            // image of object (if applicable)
  PVector location;           // location of object  
  PVector velocity;           // speed of object
  PVector acceleration;       // acceleration of object
  float rotation;             // rotation of object
  float rotationVelocity;     // speed of rotation
  float rotationAcceleration; // acceleration of object rotation

  float maxVelocity = 5;      // maximum object velocity default
  final   float G = 0.4;      // force of gravity

  //
  // Object
  // Constructor. Allows designation of location and RGB color of the
  // object.
  //
  Object(float x, float y, float w, float h, int red, int green, int blue) {
    this(x,y,w,h);
    myColor = new PVector(red, green, blue);
  }
  
  //
  // Object
  // Constructor. Allows designation of location and an image for the
  // object.
  //
  Object(float x, float y, String img) {
    this(x,y,0,0);
    myImage = loadImage(img);
    size.x = myImage.width;
    size.y = myImage.height;
  }
  
  //
  // Object
  // Constructor. Allows only designation of object location. Called
  // from other more specialized constructors.
  //
  Object(float x, float y, float w, float h) {
    location = new PVector(x, y);
    size = new PVector(w, h);
    mass = x * y;
    // Defaults to no movement.
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    // Defaults to no rotation.
    rotation = 0;
    rotationVelocity = 0;
    rotationAcceleration = 0;
    // No color or image yet specified.
    myColor = null;
    myImage = null;
     
  }
  
  //
  // applyRotation
  // Accumulate acceleration forces.
  //
  void applyRotation(float rot) {
    rotationAcceleration += rot;
  }

  //
  // applyForce
  // Accumulate movement forces.
  //
  void applyForce(PVector force) {
    //PVector f = PVector.div(force, mass);  //Take gravity into account (NOT)
    acceleration.add(force);
  }

  //
  // update
  // Implement the physics of movement.
  //
  void update() {
    velocity.add(acceleration);
    if (velocity.x > maxVelocity)
       velocity.x = maxVelocity;
    if (velocity.y > maxVelocity)
       velocity.y = maxVelocity;
    location.add(velocity);
    acceleration.mult(0);
  }
  
  //
  // updateRotation
  // Rotate the object if directed.
  //
  void updateRotation() {
    rotationVelocity += rotationAcceleration;
    rotation += rotationVelocity;
    rotationAcceleration = 0;
  }

  //
  // display
  // High-level routine called by owning objects. Calls low-level routines
  // to keep the object in bounds, update its movement and rotation, and
  // finally to show itself.
  //
  void display() {
    // Keep in bounds and move/rotate.
    enforceBoundaries();
    update();
    updateRotation();
    // Draw object.
    pushMatrix();
    translate(location.x, location.y);
    rotate( radians(rotation) );
    if (myColor != null) {
      fill(myColor.x, myColor.y, myColor.z);
    }
    show();    // Usually overridden in subclasses...
    popMatrix();
  }
  
  //
  // show
  // Draw the object. The default behavior here allows for a filled rectangle
  // or a tinted or untinted image. This method is usually either overridden
  // or called in conjuction with additional code in object subclasses.
  //
  void show() {
    // Either draw an image...
    if (myImage != null) {
       pushMatrix();
       translate(-size.x/2, -size.y/2);
       image(myImage, 0, 0);
       popMatrix();
    }
    // or a filled rectangle
    else 
      rect(-size.x/2, -size.y/2, size.x, size.y);
  }

  //
  // attract
  // Calculate a normalized vector from an object to an object that it
  // is attracted to. The calling function can then scale the returned
  // vector to simulate the strength of the desire force.
  //
  PVector attract(Object m) {
    PVector force = PVector.sub(location, m.location);   // Calculate direction of force
    float distance = force.mag();                        // Distance between objects
    distance = constrain(distance, 5.0, 25.0);           // Limiting the distance 
    force.normalize();                                   // Normalize vector (we just want direction)

    //float strength = (G * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    //force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }

  //
  // enforceBoundaries
  // Try to keep the objects within the boundaries of the window.
  // Am going to expand this in the future to allow objects within
  // other objects.
  //
  void enforceBoundaries() {
    float widthBuffer = size.x/2;
    float heightBuffer = size.y/2;
    //location.x = constrain(location.x, 0, width-widthBuffer)
    //location.y = constrain(location.y, 0, height-heightBuffer)
    if (location.x < widthBuffer)
      velocity.x = abs(velocity.x);
    else if (location.x > (width - widthBuffer))
      velocity.x = abs(velocity.x) * -1;
    if (location.y < heightBuffer)
      velocity.y = abs(velocity.y);
    else if (location.y > (height - heightBuffer))
      velocity.y = abs(velocity.y) * -1;
  }
  
  //Allows Objects to move off screen and return on the opposite side
  
  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
      }
      else if (location.x < 0) {
      location.x = width-random(0,3);
      }

    if (location.y >height) {
       location.y = 10;
    }
      else if (location.y < 25) {
      location.y = height;
    }
  }
  //
  // isWithin
  // Check to see if an x,y location is within the bounds of an object.
  //
  boolean isWithin(float x, float y) {
    float w = size.x/2;
    float h = size.y/2;
    return ((x >= (location.x - w)) && (x <= (location.x + w)) &&
        (y >= (location.y - h)) && (y <= (location.y + h)));
  }
}
// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    // Using the Iterator b/c we are deleting from list while iterating
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}


// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-1,1));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(0,random(255),random(255),lifespan);
    ellipse(location.x,location.y,3,6);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
