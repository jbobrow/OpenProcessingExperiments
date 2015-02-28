
class Car {
    color c;
    float xpos;
    float ypos;
    float xspeed;
    
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
        rect(xpos,ypos,30,10);
        rect(xpos,ypos-10,15,10);
        ellipseMode(CENTER);
        ellipse(xpos-5,ypos+10,7,7);
        ellipse(xpos+7,ypos+10,7,7);
     }
     
     void drive() {
         xpos = xpos + xspeed;
         if(xpos > width) {
             xpos = 0;
             }
         }
     }
     
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;

void setup() {
    size(800,250);
    myCar1 = new Car(color(255,0,0), 0,100,2);
    myCar2 = new Car(color(0,0,255), 40,20,1);
    myCar3 = new Car(color(255), 0,50,6);
    myCar4 = new Car(color(255,228,122), 0, 75, 2);
    myCar5 = new Car(color(255,100,61), 0, 120, 3);
    myCar6 = new Car(color(0,255,51), 0, 140, 4);
    myCar7 = new Car(color(100), 0, 170, 5);
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
}
