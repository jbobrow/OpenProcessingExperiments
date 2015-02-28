
// Example: Two Car objects
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
Car myCar4;//passes myCar3
Car myCar5; 

void setup() {
  size(600, 600);
  smooth();


  myCar1 = new Car(color(240, 240, 0), 0, 10, 2); //yellow car
  myCar2 = new Car(color(0, 0, 255), 0, 100, 1); //blue car
  myCar3 = new Car(color(255, 0, 255), 0, 150, 3);//magenta car
  myCar4 = new Car(color(100, 230, 0), 0, 170, 5);//green car
  myCar5 = new Car(color(50, 0, 130), 0, 50, 4); //purple car
  
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
  myCar5.drive();
  myCar5.display();
  
  drawfrog();
}

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

  //shape of each car
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 30, 15);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
//==================================================



void drawfrog () {

  fill(0, 150, 0);
  
    //eyes
  strokeWeight(9);
  ellipse(350, 150, 100, 100);

  //eyes
  strokeWeight(9);
  ellipse(250, 150, 100, 100);
  
  fill(255);
    //pupil
  strokeWeight(9);
  ellipse(350, 150, 50, 50);

  //pupil
  strokeWeight(9);
  ellipse(250, 150, 50, 50);
  
   fill(0, 220, 0);
  //head and body
  strokeWeight(10);
  ellipse(300, 300, 350, 300);
  

  //rightarm
  fill(0, 200, 0);
  strokeWeight(8);
  ellipse(450, 300, 50, 100);

  //Leftarm
  strokeWeight(8);
  ellipse(150, 300, 50, 100);

  //mouth
  fill(0, 220, 0);
  arc(300, 350, 100, 60, 0, HALF_PI);
  noFill();


}
