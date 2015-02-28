
// http://processing.org/tutorials/objects/
 
// Example: Two Car objects
Car myCar1;
Car myCar2;// Two objects!
Car myCar3;
Car myCar4;
Car myPoliceCar;
Car myPoliceCar2;
Car myPoliceCar3;
Car myPoliceCar4;
Car myPoliceCar5;
Car myPoliceCar6;
int myPoliceflashTimer=0;
int myPoliceflashTimer2=0;
int myPoliceflashTimer3=0;
int myPoliceflashTimer4=0;
int myPoliceflashTimer5=0;
int myPoliceflashTimer6=0;
 
void setup() {
  size(1000,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,3); 
  myCar2 = new Car(color(0,0,255),0,10,3.1);
  myCar3 = new Car(color(0,255,0),0,50,3.2);
  myCar4 = new Car(color(0),0,150,-7);
  myPoliceCar = new Car(color(255,0,0),40,150,-7);
  myPoliceCar2 = new Car(color(0,0,255),30,130,-7);
  myPoliceCar3 = new Car(color(255,0,0),20,170,-7);
  myPoliceCar4 = new Car(color(255,0,0),100,130,-7);
  myPoliceCar6 = new Car(color(255,0,0),90,150,-7);
}
 
void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
  myPoliceCar.drive();
  myPoliceCar.display();
  myPoliceflashTimer = myPoliceflashTimer + 1;
  if (myPoliceflashTimer==10){
    myPoliceCar.Policeflash();
    myPoliceflashTimer=0;
  }
   myPoliceCar2.drive();
  myPoliceCar2.display();
  myPoliceflashTimer2 = myPoliceflashTimer2 + 1;
  if (myPoliceflashTimer2==10){
    myPoliceCar2.Policeflash2();
    myPoliceflashTimer2=0;
  }
  
  myPoliceCar3.drive();
  myPoliceCar3.display();
  myPoliceflashTimer3 = myPoliceflashTimer3 + 1;
  if (myPoliceflashTimer3==10){
    myPoliceCar3.Policeflash3();
    myPoliceflashTimer3=0;
  }
  
   myPoliceCar4.drive();
  myPoliceCar4.display();
  myPoliceflashTimer4 = myPoliceflashTimer4 + 1;
  if (myPoliceflashTimer4==10){
    myPoliceCar4.Policeflash4();
    myPoliceflashTimer4=0;
  }
  
  myPoliceCar6.drive();
  myPoliceCar6.display();
  myPoliceflashTimer6 = myPoliceflashTimer6 + 1;
  if (myPoliceflashTimer6==10){
    myPoliceCar6.Policeflash6();
    myPoliceflashTimer6=0;
  }
  
  
   if(myCar4.xpos < 0){
      //myCar4.xpos = width;
      fill(255,0,0);
      ellipse(0,150,100,100);
    }
  
}
 
// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
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
    if (xpos > width * 1.5) {
      xpos = 0;
    }
    if(xpos < -50){
      xpos = width;
    }
   
  }
  
  void Policeflash(){
    if (c==color(255,0,0)) {
      c=color(0,0,255);
    }
    else if (c==color(0,0,255)) {
      c=color(255,0,0);
    }
  }
  
  void Policeflash2(){
    if (c==color(255,0,0)) {
      c=color(0,0,255);
    }
    else if (c==color(0,0,255)) {
      c=color(255,0,0);
    }
  }
  
  void Policeflash3(){
    if (c==color(255,0,0)) {
      c=color(0,0,255);
    }
    else if (c==color(0,0,255)) {
      c=color(255,0,0);
    }
  }
  
  void Policeflash4(){
    if (c==color(255,0,0)) {
      c=color(0,0,255);
    }
    else if (c==color(0,0,255)) {
      c=color(255,0,0);
    }
  }
  
  void Policeflash5(){
    if (c==color(255,0,0)) {
      c=color(0,0,255);
    }
    else if (c==color(0,0,255)) {
      c=color(255,0,0);
    }
  }
  
  void Policeflash6(){
    if (c==color(255,0,0)) {
      c=color(0,0,255);
    }
    else if (c==color(0,0,255)) {
      c=color(255,0,0);
    }
  }
  
}
