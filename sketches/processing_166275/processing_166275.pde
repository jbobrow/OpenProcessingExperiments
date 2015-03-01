
Car myCar1;
Car myCar2;
Car myCar3;
void setup() {
  size(500,400);
  myCar1 = new Car(color(255),100,100,random(2,8)); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255),100,200,random(2,8));
  myCar3 = new Car(color(255),100,300,random(2,8));
}

void draw() {
  background(150);
    if (myCar1.xpos>width||myCar1.xpos<0
  ||myCar2.xpos>width||myCar2.xpos<0
  ||myCar3.xpos>width||myCar3.xpos<0){
     myCar1.xspeed = (myCar1.xspeed)*-1;
      myCar2.xspeed = (myCar2.xspeed)*-1;
      myCar3.xspeed = (myCar3.xspeed)*-1;
} 
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
}
class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.IsnÃ¢â�¬â�¢t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
   strokeWeight(2);
    rect(xpos,ypos,25,15);
   if(xpos>width||xpos<0){
    c=color(random(255),random(255),random(255));
    }
  }
 
  void move() {
    xpos = xpos + xspeed;
     
}  
}

