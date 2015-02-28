
//A2-14: Using the Vehicle class tree (the code is provided in the Resources folder on the Sakai site, under Assignments), 
//define a subclass called Truck that changes some functionality of the parent class 
//(has different color, different shape, moves in a different way, etc.).

/* Made By: Naghmi Shireen
 Dated: 19 oct, 2010*/
 
// Example: Two Vehicle objects
// From: http://processing.org/learning/objects/

Vehicle myVehicle1;
Vehicle myVehicle2; // Two objects!
Vehicle myTruck;// new variable TRUCK introduced of class vehicle

void setup() {
  size(200,200);
  // Parameters go inside the parentheses when the object is constructed.
  myVehicle1 = new Vehicle(color(255,0,0),0,100,2); 
  myVehicle2 = new Vehicle(color(0,0,255),0,10,1);
  
  myTruck= new Truck(color(140,120,200),0,150,0.5); // this passes the color value, x,y positions and speed to the sub-class Truck
}



void draw() {
  background(255);
  myVehicle1.drive();
  myVehicle1.display();
  myVehicle2.drive();
  myVehicle2.display();
  myTruck.display();
  myTruck.drive();
}




// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Vehicle { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Vehicle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


// truck class starts from here, it extends the vehicle class
class Truck  extends Vehicle{
 
//constructor of truck class  
  Truck(color cTruck, float xTruck, float yTruck, float speedTruck){
    super(cTruck,xTruck,yTruck,speedTruck);//it uses the same arguments of super class
  }
  
//there are two methods of sub-class Truck. one is display method, second is Drive method  
//display method
  void display(){
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos+random(2),30,15);//creates a rectangle with random yposition, to give a jerking effect to truck
    fill(240, c, 100);
    rect( xpos +20, ypos+random(2), 8,12);//this creates a front part of the truck
    fill(c,80);
    rect(xpos,ypos+random(1), 27, 12); //this rectangle makes an inside rectangle to give an effect of TRUCK
    fill(0);
    rect (xpos-10 , ypos-7, 4,1);// this rectangle draws the back left tyre
    rect(xpos-10, ypos+9,4,1);// it makes back right tyre
    rect(xpos+10, ypos-7,4,1);// it draws the front left tyre
    rect(xpos+10, ypos+9,4,1);//front right tyre

     }

 //drive methos is the same as the cars drive method
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
