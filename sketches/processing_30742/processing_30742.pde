

// No matter how many cookies we make, only one cookie cutter is needed.
class Car {
  color c;
  float xpos;
  float ypos;
  float yspeed;
  float gravity = 0.1;
  float bouncefriction = 0.9;
  float h = 20;
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempYspeed, float grav) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempYspeed;
    gravity = grav;
  }
 
  void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,20,20);
  }
 
  void drive() {
    yspeed+= gravity;
    ypos+=yspeed;
    if (ypos > height-h/2) {
      yspeed *= -bouncefriction;
      ypos=height - h/2;
    }
    if(ypos<h/2){
      yspeed *= -bouncefriction;
      ypos=h/2;
    }
  }
}

Car bus;
Car taxi;
Car van;
Car racecar;
void setup(){
  size(500,800);

  bus=new Car(color(20,150,30),100,30.0,10.0,.1);
  taxi=new Car(color(50,120,100),200,100,10,.2);
  van=new Car (color(0,0,200),300,180,10,.5);
  racecar=new Car(250,400,250.0,10,.9);
  frameRate(80);
}
void draw(){
 background(color(100,10,120));
  bus.drive();
  bus.display();
  taxi.drive();
  taxi.display();
  van.drive();
  van.display();
  racecar.drive();
  racecar.display();
}
                
