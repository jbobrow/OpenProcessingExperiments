
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 8-2: Two Car objects

Car myCar1;
Car myCar2;
Car myCar3;// Two objects!
float r;
float g;
float b;
float a;

void setup() {
  size(200,200);

  myCar1 = new Car(color(255,255,255),0,100,2, 0); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255,255,255),0,10,1, 0);
  myCar3 = new Car(color(255,255,255),0,190,1, 0);
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
}

class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float xspeed2; 

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempXspeed2) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    xspeed2 = tempXspeed;
  }

  void display() {
    stroke(0);
    
    if (xspeed2==1) {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  fill(r,g,b,a);}else{
    fill(c);}
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
  

  void move() {
    //xspeed2=0;
    xpos = xpos + xspeed;
    if ((xpos > width) || (xpos<0)) {
      xspeed = xspeed*-1;
      
      xspeed2= 1; 
    } }
   
   
    
  }



