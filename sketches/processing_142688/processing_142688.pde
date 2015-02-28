
class Car {
  //attributes
  float xPos ;
  float yPos ;
  float vel ; 
  float r ; 
  float g ; 
  float b ; 

  //constructor (fill attributes here
  Car(float x, float y) {
    xPos = x ;
    yPos = y;
    vel = random(2) ;
    r = random(255) ;
    g = random(255) ;
    b = random(255) ;
  }

  Car() {
    xPos = random(width) ;
    yPos = random(height);
    vel = random(2) ;
    r = random(255) ;
    g = random(255) ;
    b = random(255) ;
  }


  //methods

  void display() {
    fill(r, g, b) ;
    rect(xPos, yPos, 50, 10) ; 
    ellipse(xPos + 5, yPos + 15, 10, 10) ;
    ellipse(xPos + 45, yPos + 15, 10, 10) ;
  }




  void drive() {
    xPos = xPos + vel;
    if (xPos > width) {
      xPos = 0;
    }
  }
}



Car myCar1 ;
Car myCar2 ;
int amt = 200 ;

Car[] myCars = new Car[amt] ;

void setup() {
  
   size(700, 400) ;
   
 myCar1 = new Car();
 myCar2 = new Car(); 
 
 for (int x = 0; x < amt ; x++)  {
   myCars[x] = new Car() ;
 }
}

void draw() {
  background(0);
  
  myCar1.display() ;
  myCar1.drive() ;
  myCar2.display() ;
  myCar2.drive() ;

   for (int x = 0; x < amt ; x++)  {
   myCars[x].display() ;
   myCars[x].drive() ;
 }
 
  
}



