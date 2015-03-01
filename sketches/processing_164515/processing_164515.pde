
//ICM - Week 4
//Craig Pickard, September 2014
//mathematical equations taken from 
//the pendulum class is for the most part adapted from Daniel Shiffmans 2005 example,
//but has been updating using PVectors.


//the program begins with the angle to the vertical, for each pendulum,
//equal to zero. Manually drag any of the pendulums to the desired starting angle

//notes for future versions:
// >> show counter for number of cycles of each pendulum
// display angle on screen as pendulums are lifted


Pendulum[] pendulums = new Pendulum[15]; //create an array of 15 pendulum objects
float gravity = 0.15; //set the gravitational constant
//float longestLength = 30; // set the length of the longest arm
float oscillations = 51; //set the number of oscillations the shortest pendulum completes
float cycle = 30; //number of seconds to complete a cycle
float frequency;


void setup(){
  size(800,600);
  smooth();
  
  //initialise the array of pendulum objects.  The second parameter of the new Pendulum
  //PVector sets the length each pendulum's arm.  The length of the  arm is a function of
  //the pendulum's frequency (This is what I'm having trouble with). So far I've got
  //Li = L(L/L + i)*(L/L + i), where L is the length of the longest arm. Which I derived from
 // the explanation found at- http://www.arborsci.com/cool/pendulum-wave-seems-like-magic-but-its-physics
  for(int i = 0; i < pendulums.length; i++){
    
    //L = frequency*frequency*gravity/4*PI*PI
    
    float thisFrequency = (oscillations-i)/cycle;
    float thisLength = (thisFrequency*thisFrequency*gravity)/(4*PI*PI);
    //float mappedLength = map(thisFrequency,0.004816274, 0.009150569, 0, height);
    
    pendulums[i] = new Pendulum(new PVector(width/2,0), thisLength*50000 ,gravity);
  //println("freq: " + thisFrequency, "length: " + thisLength);
  println(pendulums[i]);
}


}

  void draw(){
background(75);
for (int i = 0; i < pendulums.length; i++){
pendulums[i].move();
}
  }
  
  void mousePressed(){
    for (int i = 0; i < pendulums.length; i++){
    pendulums[i].clicked(mouseX,mouseY);
    
    //this conditional statement allows you to lift a single pendulum
    //and all of the others move in the same line
    if(pendulums[i].lifting = true){
    pendulums[i].angle = pendulums[i].angle;
    }
  }
  }
  
  void mouseReleased(){
    //this function releases the pendulum when the mouse button is released
    for (int i = 0; i < pendulums.length; i++){
    pendulums[i].stopLifting();
    //reset the pendulum's angular velocity and acceleration to 0
    //to prevent eratic behaviour of pendulums
    pendulums[i].angularVelocity = 0.0f;
    pendulums[i].angularAcceleration = 0.0f;
    
  }
  }
  
  
class Pendulum {

  PVector position; //position of pendulum ball in 2d space
  PVector connectionPoint; //connecting point of pendulum arm (ie the ceiling)
  float period; //how long it takes to swing back and forth (measured in seconds)
  float frequency; //number of back-and-forth swings in a second
  float rodLength; // length of the pendulum's rod
  float gravity; //force of gravity
  float angle; //starting angle (from the vertical) of swing
  float angularVelocity; //the change in angle over time
  float angularAcceleration; //the change in angular velocity over time
  float diam; //diamter of the pendulum head
  float c; //fill colour of pendulum
  float airFriction; //an artificial variable to simulate air friction so the pendulums slow down over time
  boolean lifting = false;


  // period = 1/frequency and frequency = 1/period
  // period = 2*PI*sqrt(rodLength/gravity);
  // frequency = (sqrt(gravity/rodLength))/2*PI;
  // rodLength = gravity / (4*PI*PI*frequency*frequency);
  // velocity = sqrt((2*gravity*rodLength*(1-cos(angle))));


  Pendulum(PVector tempConnectionPoint, float tempRodLength, float tempGravity) {

    connectionPoint = tempConnectionPoint.get();
    rodLength = tempRodLength;
    gravity = tempGravity;
    angle = 0; //set initial angle to zero so that the pendulums are stationary at start of sketch


   float x = rodLength*sin(angle);
    float y = rodLength*cos(angle);

    position = new PVector(connectionPoint.x, connectionPoint.y);
    angularVelocity = 0.0f;
    angularAcceleration = 0.0f;
    airFriction = 0.9999f; //the angularVelocity changes by this factor
    diam = 25.0f; //set diameter of pendulum
  }

  //methods

  void move() {
    display();
    lift();
    render();
  }

  void display() {
    if (!lifting) {
      angularAcceleration = (-1 * gravity / rodLength) * sin(angle); //angularAcceleration is determined by the ratio of gravity to rodLength
      angularVelocity += angularAcceleration; //the rate of change of angular velocity is determined by angularAcceleration
      angularVelocity *= airFriction; //reduce angular velocity by a factor determined by airFriction
      angle += angularVelocity; //change the angle at a rate set by angularVelocity
    }
    position.set(rodLength*sin(angle), rodLength*cos(angle));
    position.add(connectionPoint);
  }

  void render() {
    stroke(255, 50);
    //draw the rod
    line(connectionPoint.x, connectionPoint.y, position.x, position.y);
    ellipseMode(CENTER);
 

    //   fill(200);
    // if (lifting) {
    //fill(50,100);
    noStroke();
  
      ellipse(position.x, position.y, diam, diam);
      //  }
    }
 
  void clicked(int mx, int my) {
    float d = dist(mx, my, position.x, position.y);
    if (d < diam/2) {
      lifting = true;
    }
    println(d);
  }

  void stopLifting() {
    lifting = false;
  }

  void lift() {
    if (lifting) {
      PVector diff = PVector.sub(connectionPoint, new PVector(mouseX, mouseY));
      angle = atan2(-1*diff.y, diff.x) - radians(90);
    }
  }
}


