
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;

Car myCar4; //su
Car myCar5;
Car myCar6;

Car myCar7; //train
Car myCar8;

Car myCar9;//motorbikes
Car myCar10;
Car myCar11;
Car myCar12;


void setup() {
  size(200,800);

  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(0),10,10,random(2)); 
  myCar2 = new Car(color(0),30,10,random(1));
  myCar3 = new Car(color(0),50,10,random(3));
  
  myCar4 = new Car(color(0),150,700,random(2.5)); 
  myCar5 = new Car(color(0),170,700,random(0.8));
  myCar6 = new Car(color(0),189,700,random(3.3));
  
  myCar7 = new Car(color(0),86,0,random(10));
  myCar8 = new Car(color(0),116,0,random(10));
  
  myCar9 = new Car (color(0),3,10,random(5));
  myCar10 = new Car (color(0),60,10,random(5));
  myCar11 = new Car (color(0),136,10,random(5));
  myCar12 = new Car (color(0),197,10,random(5));
}

void draw() {
  background(215);
  fill(140);
  rectMode(CORNERS);
  rect(70,0,132,800);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  
  myCar4.drivesu();
  myCar4.display();
  myCar5.drivesu();
  myCar5.display();
  myCar6.drivesu();
  myCar6.display();
  
  myCar7.drive();
  myCar7.displayTrain();
  
  myCar8.drivesu();
  myCar8.displayTrain();
  
  myCar9.drive();
  myCar9.displayMoto();
  myCar10.drive();
  myCar10.displayMoto();
  myCar11.drivesu();
  myCar11.displayMoto();
  myCar12.drivesu();
  myCar12.displayMoto();
}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float xspeedue;
  

  
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
    rect(xpos,ypos,10,20);
  }
  
  void displayTrain() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,26,190);
  }
  
    void displayMoto() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,2,5);
  }
  
  void drivesu(){
    ypos = ypos - xspeed;
    if (ypos < -80) {
      ypos = 990;
    }
  }
  
  void drive() {
    ypos = ypos + xspeed;
    if (ypos > 880) {
      ypos = -190;
    }
  }
}



