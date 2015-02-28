
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(200,200);
 
  myCar1 = new Car(color(int(random(255)),int(random(255)),int(random(255))),0,100,2);
  myCar2 = new Car(color(int(random(255)),int(random(255)),int(random(255))),0,10,1);
  myCar3 = new Car(color(int(random(255)),int(random(255)),int(random(255))),0,50,3);
 
}

void draw() {
  background(140);
  myCar1.move();
  if(myCar1.Reverse()){
    myCar1.c = color(int(random(255)),int(random(255)),int(random(255)));
    myCar1.bounce();
    myCar2.bounce();
    myCar3.bounce();
  }
  myCar1.display();

  myCar2.move();
  if(myCar2.Reverse()){
    myCar2.c = color(int(random(255)),int(random(255)),int(random(255)));
    myCar1.bounce();
    myCar2.bounce();
    myCar3.bounce();
  }
  myCar2.display();
  
  myCar3.move();
  if(myCar3.Reverse()){
    myCar3.c = color(int(random(255)),int(random(255)),int(random(255)));
   myCar1.bounce();
  myCar2.bounce();
  myCar3.bounce();
  }
  myCar3.display();
  
 
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
 
  void bounce() {
      xspeed = xspeed * -1;
      
  }

 boolean Reverse(){
    if ((xpos > width) || (xpos < 0))
 {
            return (true);

    }
    else{
        return (false);

}
 }
    void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void move() {
    xpos = xpos + xspeed;
    
  }
}



