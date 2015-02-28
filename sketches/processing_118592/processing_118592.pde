
Car myCar1;
Car myCar2;
Car myCar3;
color c; 
color d; 
color e; 
float xspeed; 
float xspeed2;
float xspeed3;

void setup() {
  size(300,200);
  myCar1 = new Car(color(random(255),255,255),random(10,90),random(10,190),2, false); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255,random(255),255),random(100,190),random(10,190),2, false);
  myCar3 = new Car(color(255,255,random(255)),random(200,290),random(10,190),3, false);
  c = color(random(255),255,255);
  d = color(255,random(255),255); 
  e = color(255,255,random(255)); 
}

void draw() {
  background(255);
  if (myCar1.hit == true)
  {
    c = color(random(255),255,255); 
    xspeed = random(20,255);
  }
  if (myCar2.hit == true)
  {
    d = color(150,random(255),50);
    xspeed2 = random(20,255); 
  }
  if (myCar3.hit == true)
  {
    e = color(255,255,random(255)); 
    xspeed3 = random(20,255);
  }
  
  if (myCar1.hitCheck() == true || myCar2.hitCheck() == true || myCar3.hitCheck() == true){
  myCar1.changeDir(c, xspeed); 
  myCar2.changeDir(d, xspeed2); 
  myCar3.changeDir(e, xspeed3); 
  } 
  
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
 
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
      hit = true;
    }
  }
  
void addSpeed(){
  if (xspeed >= 0)
  xspeed = xspeed + random(0.001,0.01); 
  else
  xspeed = xspeed - random(0.001,0.01);
}
  
void changeDir(color tempC, float tempXspeed) {
    xspeed = -xspeed;
    c = tempC;  
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


