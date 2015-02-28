
// solution to creating objects in a loop:  http://processing.org/discourse/beta/num_1243792004.html
// edited to add randomness to colors, speeds, and cars travelling in two directions

// total number of cars
int numCar = 300;                  
Car[] cars = new Car[numCar];
Car[] cars2 = new Car[numCar];

void setup() {
 size(600,300);

// set random colors, speeds
// all cars start at x0 and are 3px apart in y
 for(int i = 0; i <cars.length; i++){
   cars[i] = new Car(color((random(0,150)),(random(0,100)),(random(0,200))),0,i*3,(random(1,10)));
   cars2[i] = new Car(color((random(0,50)),(random(0,25)),(random(0,75))),width,i*3,(random(1,10)));
 }
}

void draw() {
 background(0);
// i = 1 so that the first car doesn't fall off the top of the window
 for(int i = 5; i <cars.length; i++){
   cars[i].move();
   cars[i].display();
   cars2[i].move2();
   cars2[i].display();   
 }
}

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
   stroke(0,0,0,0);
   fill(c);
   rectMode(CENTER);
   rect(xpos,ypos,20,10);
 }

 void move() {
   xpos = xpos + xspeed;
   if (xpos > width) {
     xpos = 0;
   }
 }
 void move2() {
   xpos = xpos - xspeed;
   if (xpos < 0) {
     xpos = width;
   }
 } 
}


