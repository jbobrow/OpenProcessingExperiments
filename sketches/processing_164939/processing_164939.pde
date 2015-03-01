
//ICM - Week 4
//Craig Pickard, September 2014
//mathematical equations taken from 
//the pendulum class is for the most part adapted from Daniel Shiffmans 2005 example,
//but has been updating using PVectors.


//the program begins with the angle to the vertical, for each pendulum,
//equal to zero. Manually drag any of the pendulums to the desired starting angle



Pendulum[] pendulums = new Pendulum[15]; //create an array of 15 pendulum objects
float gravity = 0.15; //set the gravitational constant
//float longestLength = 30; // set the length of the longest arm
float oscillations = 51; //set the number of oscillations the shortest pendulum completes
float cycle = 30; //number of seconds to complete a cycle
float frequency;
Button b;


void setup(){
  size(600,500);
  smooth();
  
  b = new Button();
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
    
    pendulums[i] = new Pendulum(new PVector(width/2,0), thisLength*40000 ,gravity);
  //println("freq: " + thisFrequency, "length: " + thisLength);
 // println(pendulums[i]);
}


}

  void draw(){
background(75);
for (int i = 0; i < pendulums.length; i++){
pendulums[i].move();
}
b.display();
println(b.pressed);
  }
  
  void mousePressed(){
    float d1 = dist(mouseX,mouseY,b.x,b.y);
    
    // if(b.checkClicked(mouseX,mouseY)){
    //   for (int i = 0; i < pendulums.length; i++){
    //     pendulums[i].growTail();
    //   }
  
    b.checkClicked(mouseX,mouseY);
    
    //this conditional statement allows you to lift a single pendulum
    //and all of the others move in the same line
   for (int i=0; i < pendulums.length; i++){
     pendulums[i].clicked(mouseX,mouseY);
     
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
    //to prevent eratic behaviour of pendulums when restarting
        float d2 = dist(b.x,b.y, mouseX,mouseY);
    if (d2 > b.diam/2){
    pendulums[i].angularVelocity = 0.0f;
    pendulums[i].angularAcceleration = 0.0f;
    }
  }
  }
  
  
class Button {

  int x;
  int y;
  int diam;
  boolean pressed;

  Button() {

    x = width-50;
    y = height - 50;
    diam = 50;
    pressed = false;
  }

  void display() {
    fill(255);
    stroke(75);
    strokeWeight(4);
    ellipse(x, y, diam, diam);
  }

  void checkClicked(float mx, float my) {
    float d = dist(x, y, mx, my);
    if (d < diam/2) {
      pressed = !pressed;
    }
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
  float decay; //an artificial variable to simulate air friction so the pendulums slow down over time
  boolean lifting = false;
  float [] xpos;
  float [] ypos;



  // period = 1/frequency and frequency = 1/period
  // period = 2*PI*sqrt(rodLength/gravity);
  // frequency = (sqrt(gravity/rodLength))/2*PI;
  // rodLength = gravity / (4*PI*PI*frequency*frequency);
  // velocity = sqrt((2*gravity*rodLength*(1-cos(angle))));


  Pendulum(PVector tempConnectionPoint, float tempRodLength, float tempGravity) {

    xpos = new float [30];
    ypos = new float [30];

    for (int i = 0; i < xpos.length; i++) {
      xpos[i] = 0;
      ypos[i] = 0;
    }

    connectionPoint = tempConnectionPoint.get();
    rodLength = tempRodLength;
    gravity = tempGravity;
    angle = 0; //set initial angle to zero so that the pendulums are stationary at start of sketch


    float x = rodLength*sin(angle);
    float y = rodLength*cos(angle);

    position = new PVector(connectionPoint.x, connectionPoint.y);
    angularVelocity = 0.0f;
    angularAcceleration = 0.0f;
    decay = 0.9995f; //the angularVelocity changes by this factor over time
    diam = 15.0f; //set diameter of pendulum
  }

  //methods

  void move() {
    display();
    render();
    float d2 = dist(b.x,b.y, mouseX,mouseY);
    if (d2 > b.diam/2){
    lift();
    }
    
  }

  void display() {
    if (!lifting) {
      angularAcceleration = (-1 * gravity / rodLength) * sin(angle); //angularAcceleration is determined by the ratio of gravity to rodLength
      angularVelocity += angularAcceleration; //the rate of change of angular velocity is determined by angularAcceleration
      angularVelocity *= decay; //reduce angular velocity by a factor determined by decay
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

    for (int i = 0; i < xpos.length-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }

    xpos[xpos.length-1] = position.x;
    ypos[ypos.length-1] = position.y;
    noStroke();
    fill(255);
    ellipse(position.x, position.y, diam, diam);
    if (b.pressed ==true) {
      for (int i = 0; i < xpos.length; i++) {
        fill(255, 0+i*2);
        ellipse(xpos[i], ypos[i], diam-1, diam-1);
      }
    }
  }

  void clicked(int mx, int my) {
    float d = dist(mx, my, position.x, position.y);
    if (d < diam/2) {
      lifting = true;
    } 
    //println(d);
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


