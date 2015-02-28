
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
Car myCar4;//passes myCar3
Car myCar5;
Car myCar6;
Car myCar7; 
Car myCar8;
Car myCar9;
controls keys = new controls();

void setup() {
  size(600, 800);
  smooth();
 
 
  myCar1 = new Car(color(240, 240, 0), 0, 60, 6); //yellow car
  myCar2 = new Car(color(0, 0, 255), 0, 170, 1); //blue car
  myCar3 = new Car(color(255, 0, 255), 0, 250, 3);//magenta car
  myCar4 = new Car(color(100, 230, 0), 0, 380, 5);//green car
  myCar5 = new Car(color(50, 0, 130), 0, 420, 4); //purple car
  myCar6 = new Car(color(240, 240, 0), 0, 500, 8); //yellow car
  myCar7 = new Car(color(0, 0, 255), 0, 550, 1); //blue car
  myCar8 = new Car(color(255, 0, 255), 0, 610, 3);//magenta car
  myCar9 = new Car(color(100, 230, 0), 0, 680, 5);//green car

   
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
  myCar6.drive();
  myCar6.display();
  myCar7.drive();
  myCar7.display();
  myCar8.drive();
  myCar8.display();
  myCar9.drive();
  myCar9.display();

  drawfrog();
  keys.draw();
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
    rect(xpos, ypos, 60, 30);
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
   
     //rightarm
  fill(0, 200, 0);
  strokeWeight(5);
  ellipse(350, 300, 15, 40);

  //Leftarm
  strokeWeight(5);
  ellipse(250, 300, 15, 40);
  
    //eyes
  strokeWeight(5);
  ellipse(250, 290, 25, 25);

  //eyes
  strokeWeight(5);
  ellipse(350, 290, 25, 25);
  
  fill(255);
    //pupil
  strokeWeight(3);
  ellipse(350, 290, 10, 10);

  //pupil
  strokeWeight(3);
  ellipse(250, 290, 10, 10);
  
  fill(0, 220, 0);
  //head and body
  strokeWeight(5);
  ellipse(300, 300, 100, 50);
  



  //mouth
  fill(0, 220, 0);
  arc(300, 300, 25, 15, 0, HALF_PI);
  noFill();


}




