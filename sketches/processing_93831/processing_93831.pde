

 import java.util.*;
//World
//by Sam Slosser
//
//Displays a somber place with a lamp post, a fly attrated to the light of the lamp post
//and a frog tracking the fly with his eyes.
//

PImage background; // spooky background image   
Fly[] fly = new Fly[10];     // fly class constructor
Frog[] frogSit = new Frog[2];          // Frog class constructor
Lamp lampPost;                         // Lamp class constructor 
Tree tree;                             // 


ArrayList<Leaf> leaves;
//setup
//Display the background, the lampost, the frog, the frog's eyes and the fly



void setup() {
  
  size(950,700);
  smooth();



  
background = loadImage("limbo.jpg");
//ArrayList of the Leaf class
leaves = new ArrayList<Leaf>();
//Creating instance of the classes (start loc x, start loc y, image width, image height)
tree = new Tree(200,300,300,400);
//leaf = new Leaf(300,200,45,45); 
lampPost = new Lamp(600,height/2-100,125,300);
//load the fly array with fly objects
 for (int i = 0; i < fly.length; i++) {
    fly[i] = new Fly(random(400,width),random(height),25,25); 
  }

  frogSit[0] = new Frog(750,500,75,75);
  frogSit[1] = new Frog(450,500,75,75);
  


}

void draw() {
  image(background,0,0);

  
  PVector wind = new PVector(-.15,0);
  //display the lamp post
  lampPost.display();
  for (int a = 0; a < fly.length; a++){
  //create a force vector for attracting the fly to the lmap
  // PVector force = lampPost.attract((fly[a]));
  //multiply the force vector by the attraction ammount  
 // force.mult(lightAttraction);
  //apply the force to the fly
  //fly[a].applyForce(force);
  fly[a].seek(lampPost.location);
  fly[a].applyForce(wind);
  //display the fly
  fly[a].display();

 }
 
for (int b = 0; b < frogSit.length; b++){  //for loop                               display the eyes on the frog
   pushMatrix();
   frogSit[b].display();
   frogSit[b].eyes();
   popMatrix();
}


tree.display();        //display for the tree

PVector gravityLeaf = new PVector(0,0.5); //New PVector for gravity

//while millisecond is divisable by 10 load Leaf object into array
  while (millis() % 30 == 0){
leaves.add(new Leaf(random(100,275),random(100,250),35,35));
  }
  
  //display arrayList 
  
   Iterator<Leaf> it = leaves.iterator();
  while (it.hasNext()) {
    Leaf p = it.next();
    p.display();
    if (p.isDead()) {
      it.remove();
    }
    p.applyForce(gravityLeaf);
    p.applyForce(wind);
   
    

}
  
  

  
   

 
 
  
  
  
 }









// FlyClass
//by Sam Slosser
//Display and simulate the movement of a fly flying.

class Fly extends Object{
float locX,locY;
public float angle;
  Noise    accelerationNoiseX;           // x acceleration Noise object
  Noise    accelerationNoiseY;           // y acceleration Noise object
  float    accelerationNoiseDelta = 0.1; // acceleration Noise offset

//Fly constructor that is controlled by perlin noise and is erased on update 
//each time to give the illusion of movement.
Fly(float x, float y,float a, float b){
  super(x, y,"fly.png",a,b);
  
  accelerationNoiseX = new Noise(accelerationNoiseDelta, -0.5, 0.51);
  accelerationNoiseY = new Noise(accelerationNoiseDelta, -0.5, 0.51);;

    maxspeed = 4;
    maxforce = 0.25;

}





//update object information with acceleration noise
void update() {
    
  
  applyForce(new PVector(accelerationNoiseX.next(), accelerationNoiseY.next()));
    
    //call the fly shake
    shake();
   
   
    super.update();
        




}  
//show the fly
void show(){
  //enforce tint to 255
tint(255);
super.show();}
  
void seek(){
 //[full] Arbitrary values for maxspeed and
    // force; try varying these!
    
    //[end]
    

}  

 //
 //shake 
 //This is to make the fly flutter. 
 // 
void shake()

{//every 8 seconds flutter.
   if (second() % ((int)random(8,15)) == 0){
  location.x+=random(-5,5);
  location.y+=random(-5,5);
  
}}
}

//
//Frog
//by Sam Slosser
//Places a frog and eyes on the frog (drawn as for seperate objects).  The eyes us oscillation and 
//the locaiton information from the fly to track its movements.  The eyes are constrained to the 
//the frog so if you resize the frog the eyes and iris will re-size accordingly.
//
class Frog extends Object{


float sizeX;    // size of image width
float sizeY;    // size of the image height
float locX;     // x cordinate of frog 
float locY;     // y cordinate of frog


//Constructor for Frog object recieves x location, y location.
//Also the width and height of the image from world driver.

Frog(float x, float y,float a, float b){
  //pass x and y, image, and image size to Object
  super(x,y,"frog.png",a,b);
  locX = x;
  locY = y;
  sizeX = a;
  sizeY = b;



}

//
//show
//
void show(){
tint(255);
  super.show();
 
  

}
//
//eyes
//display offsetting eyes and irises, irises are constrained to radius of the eye and follows
//the fly
void eyes(){
  float yi=0;  // used as y cordinate for iris oscillation initalized as zero
  float xi=0;  // used as x cordinate for iris oscillation initalized as zero
  float radius1 = ((sizeX+sizeY)/20);       // radius1 is 1/20 the total size of the image
  float radius2 = radius1/3;                // radius2 is 1/3 the size of radius1
  float x = locX-radius1+2;                 // x location for the placment of the eyes on the frog
  float y = locY-((sizeY/2)-radius1+1);     // y location for the placment of the eyes on the frog
  float theta=0;  // theta for eyes figured from atan2
    //cycle 
    for (int i = 0; i < fly.length; i++){
   
    theta = atan2(fly[i].location.y-locY,fly[i].location.x-locX);
    }
    xi  = radius1 * cos(theta);       
    yi = radius1 * sin(theta); 

   
    //display for eye ball 
    pushMatrix();
    fill(255);
    ellipse(x, y, radius1*2, radius1*2);
    popMatrix();
    fill(255);
    //offset for second eyeball
    ellipse(x+radius1*2, y, radius1*2, radius1*2);
    pushMatrix();
     
     //Irises  
    translate(x+radius1*2,y);
    fill(100);
    ellipse(xi,yi,radius2*2, radius2*2);
    popMatrix();
    translate(x,y);
    fill(100);
    ellipse(xi,yi,radius2*2, radius2*2);


}


}
//
//Lamp
//by Sam Slosser
//Displays an older style black and white street lamp.
//

class Lamp extends Object{



//
//Lamp class constructor
//
Lamp(float x, float y,float a, float b){
super(x, y, "street-lamp.png",a,b);


}
//
// method for the object class to call for display
//
void show() {
  translate(0,100);
super.show();



}

  




}











class Leaf extends Object{

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pendulum

// A Simple Pendulum Class
// Includes functionality for user can click and drag the pendulum


  PImage img;
     
  PVector origin;      // Location of arm origin
 

  float r;                // Length of arm
  float angle;            // Pendulum arm angle
  float aVelocity;        // Angle velocity
  float aAcceleration;    // Angle acceleration
  float damping;          // Arbitary damping amount
  float swaySpeed = .2;   // Speed at which the leaf sways

  // This constructor could be improved to allow a greater variety of pendulums
  Leaf(float x, float y,float a, float b) {
    super(x, y, "leaf.png",a,b);
    // Fill all variables
    origin = new PVector(x,y);  //create origin vector for leaf swing
  
    
    r = 100;               //leaf swing
    
    angle = PI/4;          //radians conversion
    
    aVelocity = 0.0;       //set angle velocity and accel to zero
    aAcceleration = 0.0;   //set angle of acceleration to zero
    damping = .990;        // Arbitrary damping
    
    lifespan = 2000.0;     // life span for leaf death
}

  
  // Function to update  angle location and apply gravity to each leaf
  void update() {
    
    aAcceleration = (-1 * swaySpeed / r) * sin(angle);   // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
    aVelocity += aAcceleration;                          // Increment velocity
    aVelocity *= damping;                                // Arbitrary damping
    angle += aVelocity;                                  // Increment angle
    location.set(r*sin(angle), r*cos(angle), 0);         // Polar to cartesian conversion
    location.add(origin);                                // Make sure the location is relative to the pendulum's origin
    location.add(acceleration);                          // add acceleration to location
    lifespan -= 2.0;                                     // lifespan counts down by 2 
    boundry();                                           // call the boundry method
  }

 //show 
  void show(){
//tint the leaf to die
tint(255, lifespan);                                     // tint for lifespan
  super.show();
   
}
void boundry(){
location.y = constrain(location.y, 0, 500);          // constrain the leaf
    if(location.y==500){angle=0;}                    // set the sway angle to zero if the leaf reaches to ground

}



}

   













//Noise Class borrowed from Dr. Brown.
// Noise
// by: Dr. David Brown
//
// Wraps the noise function in an object that maps the returned
// noise value into a predetermined range. Makes it easier to tie
// Perlin noise to object parameters. (I may extend it to 2D noise.)
//
class Noise {
  PVector location;   // current location within noise data
  PVector offset;     // how much to offset within noise data
  float   lowRange;   // the low range of mapped returned value
  float   highRange;  // the high range of mapped returned value
  
  //
  // Noise
  // Constructor. Sets up the amount to increment within noise
  // data and the range into which to map returned values.
  //
  Noise(float delta, float low, float high) {
    // start at a random location in the noise data
    location = new PVector (random(10000), 0, 0);
    offset = new PVector (delta, 0, 0);
    lowRange = low;
    highRange = high;
  }
  
  //
  // next
  // Return the next value within the 1D Perlin noise data.
  //
  float next() {
    float val = map(noise(location.x), 0, 1, lowRange, highRange);
    location.add(offset);
    return(val);
  }
}
//
// Object class borrowed from Dr. Brown and adapted to my world.
// by Dr. David Brown 
// and Sam Slosser
// 
// Top level virtual world construct. Handles mass, force,
// location, velocity, and acceleration. Has default
// display capabilities of a filled rectangle or a tinted or
// untinted image.
 
 
       // public global variable to store the angle between the frog and fly
class Object {
   
  PVector size;               // size of object
  float   mass;               // mass of object (mostly ignored)
  PImage  myImage;            // image of object (if applicable)
  PVector location;           // location of object  
  PVector velocity;           // speed of object
  PVector acceleration;       // acceleration of object
  int velocityLimit = 5;      // the velocity limit
  final   float G = 0.4;      // force of gravity
  float imageX;               // image size (width)
  float imageY;               // image size (height)
  float lifespan;
  float maxforce;
  float maxspeed;
  
  //
  // Object
  // Constructor. Allows designation of location and an image for the
  // object.
  //
  Object(float x, float y, String img,float a, float b) {
   this(x,y,0,0);
    myImage = loadImage(img);
    imageX = a;
    imageY = b;
   
   
  }

  //
  // Object
  // Constructor. Allows only designation of object location. Called
  // from other more specialized constructors.
  //
  Object(float x, float y, float w, float h) {
    location = new PVector(x, y);
    size = new PVector(x, y);
    mass = x * y;
    // Defaults to no movement.
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
  
  
     
  }
  
  

  //
  // applyForce
  // Accumulate movement forces.
  //
  void applyForce(PVector force) {
    
    //force.div(mass);
   acceleration.add(force);
 
   
  }

  //
  // update
  // Implement the physics of movement.
  //using the velocity limit function
  //
  void update(){
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    location.add(velocity);
    //reset the acceleration
    acceleration.mult(0);
  
    
  }
  
 // Our seek steering force algorithm
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
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
    isDead();
    
    // Draw object.
    pushMatrix();
    translate(location.x, location.y);
    
  
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
       translate(-imageX/2, -imageY/2);
       image(myImage,0,0,imageX,imageY);
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
    float widthBuffer = imageX/2;
    float heightBuffer = imageY/2;
    
    if (location.x < widthBuffer)
      velocity.x = abs(velocity.x);
    else if (location.x > (width - widthBuffer))
      velocity.x = abs(velocity.x) * -1;
    if (location.y < heightBuffer)
      velocity.y = abs(velocity.y);
    else if (location.y > (height - heightBuffer))
      velocity.y = abs(velocity.y) * -1;
  }
  
  //
  // isWithin
  // Check to see if an x,y location is within the bounds of an object.
  //
  boolean isWithin(float x, float y) {
    float w = imageX/2;
    float h = imageY/2;
    return ((x >= (location.x - w)) && (x <= (location.x + w)) &&
        (y >= (location.y - h)) && (y <= (location.y + h)));
  }
  //
  //isDead()
  //check to see it the lifespan of an object is used up
  //
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;} 
    else {
      return false;}
  }


}
class Tree extends Object{

//
//Tree class constructor
//
Tree(float x, float y,float a, float b){
super(x, y, "tree.png",a,b);


}



}


