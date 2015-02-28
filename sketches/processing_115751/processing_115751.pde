
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(400,300);
   int r = 40;
   int g = 200;
   int b = 100;
  myCar1 = new Car(color(255,0,0),0,100,5);
  myCar2 = new Car(color(0,0,255),0,10,4);
  myCar3 = new Car(color(0,255,0),0,200,2);
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
 if (myCar1.xpos > width - 1 || myCar1.xpos == 0 ){
   myCar1.change();
   myCar2.xspeed = -(myCar2.xspeed);
   myCar3.xspeed = -(myCar3.xspeed);
 }
  
  if (myCar2.xpos > width - 1 || myCar2.xpos == 0){
   myCar2.change();
   myCar1.xspeed = -(myCar1.xspeed);
   myCar3.xspeed = -(myCar3.xspeed);
  }
   
   if (myCar3.xpos > width - 1 || myCar3.xpos == 0){
   myCar3.change();
   myCar2.xspeed = -(myCar2.xspeed);
   myCar1.xspeed = -(myCar1.xspeed);
   }
}



class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float r;
  float g;
  float b;
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
    if (xpos > width - 1 || xpos - 1 < 0) {
      xspeed = - xspeed;
      
    } 
    
  }
  void change(){
    c = color(random(0,255),random(0,255),random(0,255));
  }
}
  


