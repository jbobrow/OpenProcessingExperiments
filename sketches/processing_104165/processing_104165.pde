
Car[] cars = new Car[100];
// an arrary of 100 car objets

void setup() {
 size(500, 500);
 smooth();

 for (int i = 0; i < cars.length; i++) {
  cars[i] = new Car(color(i*2), 0, i*4, i/2.0);
  // initialize each car using a for loop
 } 
}

void draw() {
 background(255);
 for (int i = 0; i < cars.length; i++) {
  cars[i].move();
  cars[i].display();
  //run each Car using a for loop
 } 
}

class Car {
 color c;
 float xpos;
 float ypos;
 float xspeed;

 Car(color c_, float xpos_, float ypos_, float xspeed_) {
  c = c_;
  xpos = xpos_;
  ypos = ypos_;
  xspeed = xspeed_; 
 }

void display() {
 rectMode(CENTER);
 stroke(0);
 fill(c);
 rect(xpos, ypos, 30, 20); 
}

void move() {
 xpos = xpos + xspeed;
 if (xpos > width) {
  xpos = 0;
 } 
}
}
