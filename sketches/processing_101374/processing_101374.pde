
//A2-15: Extend the Vehicle class tree with a collision detection and avoidance mechanism.

/* Made By: Naghmi Shireen
 Dated: 19 oct, 2010*/

// Example: Two Vehicle objects
// From: http://processing.org/learning/objects/

Vehicle[] myCar= new Vehicle[40];

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  //an array of cars have been initialized with 7 arguments
  // Parameters go inside the parentheses when the object is constructed.
  // the parameters are (color,xposition, yposition, xspeed, present vehicle, an array of all vehicles)
  for (int i=0; i<myCar.length;i++){
    myCar[i]=new Vehicle(color(random(255),random(255),random(255)),random(width), random(height),1,1,i, myCar);
  }
}
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////


void draw() {
  background(255);

  for ( int i=0;i<myCar.length;i++){
    myCar[i].display();
    myCar[i].drive();
    myCar[i].collide();
  }
}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Vehicle { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  int presentCar;
  Vehicle[] otherCars;
  float carWidth=10;
  float carLength=13;
  float spring=0.005;


  // The Constructor is defined with arguments.
  Vehicle(color tempC, float tempXpos, float tempYpos, float tempXspeed,float tempYspeed, int tempPCar, Vehicle[] tempOtherCars) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed= tempYspeed;
    presentCar=tempPCar;
    otherCars=tempOtherCars;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    //this is the central part of the car
    rect(xpos,ypos,carLength,carWidth);
    //this rectangle is the roof of the car
    rect(xpos,ypos,carLength-4,carWidth-3);
    //this beginShape will make the front BONNET of the car
    beginShape();
        vertex(xpos+carLength/2,ypos-carWidth/2);
        vertex(xpos+carLength/2+6,ypos-carWidth/2+1);
        vertex(xpos+carLength/2+6,ypos+carWidth/2-1);
        vertex(xpos+carLength/2,ypos+carWidth/2);
    endShape(CLOSE);
    //this will create back bonnet of car
    beginShape();
        vertex(xpos-carLength/2,ypos-carWidth/2);
        vertex(xpos-carLength/2-3,ypos-carWidth/2+1);
        vertex(xpos-carLength/2-3,ypos+carWidth/2-1);
        vertex(xpos-carLength/2,ypos+carWidth/2);
   endShape(CLOSE);
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void drive() {
    xpos += xspeed;

    if (xpos  > width) {
      xpos = 0;
      }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  void collide() {
    for (int i = 0; i < myCar.length; i++) {
      float dx = otherCars[i].xpos - xpos; //this will store the value of distance of xposition of other cars with the x pos of current car
      float dy = otherCars[i].ypos - ypos;//this will store the value of distance of yposition of other cars with the y pos of current car
      float distance = sqrt(dx*dx + dy*dy); // this is a physics formula to calculate the distance from two x and y components
    
      float minDist = carLength+10; //the minimum distance before collision is the length of a car
      
      
      //this "if" will compare the distance between the car and other cars,
      // if the distance is lesser than minimum distance, it will execute
      if (distance < minDist) { 
        float angle = atan2(dy, dx); //again a physics formula for calculating the angle by two x,y components
        float targetX = xpos + cos(angle) * minDist;//this specifies the target xposition for a car who is about to collide
        float acceleratex = (targetX - otherCars[i].xpos) * spring; //this will add a little speedy springy effect
        xspeed -= acceleratex; //this will make the car which is behind the other car, to slow down a little/to deccelerate.
        otherCars[i].xspeed += acceleratex; //so the other car who was about to be hit, speeds up

      }
  
    }
  }
}
