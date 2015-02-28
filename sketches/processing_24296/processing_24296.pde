
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;

void setup() {
  size(700,200);
  
myCar1 = new Car(color(255,0,0),0,100,2); 
myCar2 = new Car(color(0,0,255),0,10,1);
myCar3 = new Car(color(0,255,0),0,75,3);
myCar4 = new Car(color(0,50,100),width,150,-1);
myCar5 = new Car(color(0,255,255),width,30,-2);
}

void draw() {	
  background(255);	

myCar1.move();
myCar1.display(); 
myCar2.move(); 
myCar2.display();
myCar3.move();
myCar3.display();
myCar4.move();
myCar4.display();
myCar5.move();
myCar5.display();
}

class Car { //class name cpaitalised
  

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
  rect(xpos,ypos,20,10);
}

void move() {
  xpos = xpos + xspeed;
  if (xpos > width) {
xpos = 0;}
}
}

