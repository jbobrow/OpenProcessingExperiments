
// solution to creating objects in a loop:  http://processing.org/discourse/beta/num_1243792004.html
// edited to add randomness to colors, speeds, and cars travelling in two directions
 
// total number of cars
int numCar = 800;                 
Car[] cars = new Car[numCar];
Car[] cars2 = new Car[numCar];
 
void setup() {
 size(500,500);
 
// set random colors, speeds
// all cars start at x2 and are 5px apart in y
 for(int i = 2; i <cars.length; i++){
   cars[i] = new Car(color((random(0,100)),(random(1,200)),(random(200,255))),0,i*10,(random(10,15)));
   cars2[i] = new Car(color((random(100,110)),(random(1,5)),(random(10,20))),width,i*2,(random(1,5)));
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




