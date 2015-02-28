
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(300,200);
  myCar1 = new Car(color(255,255,255),random(10,90),random(10,190),2, false); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255,255,255),random(100,190),random(10,190),2, false);
  myCar3 = new Car(color(255,255,255),random(200,290),random(10,190),3, false);
}

void draw() {
  background(254,246,190);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  if (myCar1.hitCheck() == true || myCar2.hitCheck() == true || myCar3.hitCheck() == true){
  myCar1.changeDir(); 
  myCar2.changeDir(); 
  myCar3.changeDir(); 
  }  
  //myCar1.addSpeed(); 
  //myCar2.addSpeed(); 
  //myCar3.addSpeed(); 
}






class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  boolean hit; 

 
Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, boolean tempHit) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    hit = tempHit; 
  }
  
void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

void move() {
    println(hit); 
    xpos = xpos + xspeed;
    hit = false; 
    if (xpos > width || xpos < 0) {
      c = color(random(255), random(255), random(255));
      hit = true; 
    }
  }
  
void addSpeed(){
  if (xspeed >= 0)
  xspeed = xspeed + random(0.001,0.01); 
  else
  xspeed = xspeed - random(0.001,0.01);
}
  
void changeDir() {
    xspeed = -xspeed;
}

boolean hitCheck() {
  if (hit == true)
  {
    return true; 
  }
  else
    return false; 
}

}


