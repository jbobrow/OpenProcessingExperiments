
// total number of cars
int numCar = 165;                 
Car[] cars = new Car[numCar];
Car[] cars2 = new Car[numCar];
 
void setup() {
 size(500,500);
 
// set random colors, speeds
// all cars start at x0 and are 3px apart in y
 for(int i = 0; i <cars.length; i++){
   cars[i] = new Car(color((random(0,10)),(random(0,200)),(random(0,255))),0,i*3,(random(1,5)));
   cars2[i] = new Car(color((random(0,50)),(random(0,50)),(random(0,150))),width,i*3,(random(1,5)));
 }
}
 
void draw() {
 background(255);
// i = 1 so that the first car doesn't fall off the top of the window
 for(int i = 3; i <cars.length; i++){
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



