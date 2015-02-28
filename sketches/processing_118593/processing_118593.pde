
Car myCar1;
Car myCar2;
Car myCar3;
color c; 
//color d; 
//color e; 
float xspeed; 
float xspeed2;
float xspeed3;

void setup() {
  size(300,200);
  myCar1 = new Car(color(random(40, 240),0,0),random(10,90),random(10,56),2.0, false); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(0,random(40, 240),0),random(100,190),random(66,122),2.0, false);
  myCar3 = new Car(color(0,0,random(40, 240)),random(200,290),random(132,190),3.0, false);
  /*c = color(random(255),255,255);
  d = color(255,random(255),255); 
  e = color(255,255,random(255)); */
}

void draw() {
  background(255);
  //println(hit);
 
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if (myCar1.hit == true)
  {
    myCar1.c = color(random(10, 240),0,0); 
    xspeed = random(2.0,5.0);
    myCar1.changeDir(xspeed); 
    myCar2.changeDir(xspeed); 
    myCar3.changeDir(xspeed); 
    println("car1"); 
    myCar1.hit = false; 
    myCar2.hit = false; 
    myCar3.hit = false; 
  }
  else if (myCar2.hit == true)
  {
    myCar2.c = color(0,random(10, 240),0);
    xspeed2 = random(2.0,5.0); 
    myCar1.changeDir(xspeed2); 
    myCar2.changeDir(xspeed2); 
    myCar3.changeDir(xspeed2); 
    println("car2"); 
    myCar1.hit = false; 
    myCar2.hit = false; 
    myCar3.hit = false;
  }
  else if (myCar3.hit == true)
  {
    myCar3.c = color(0,0,random(10, 240)); 
    xspeed3 = random(2.0,5.0);
    myCar1.changeDir(xspeed3); 
    myCar2.changeDir(xspeed3); 
    myCar3.changeDir(xspeed3); 
    println("car3"); 
    myCar1.hit = false; 
    myCar2.hit = false; 
    myCar3.hit = false;
  }
  
  /*if (myCar1.hitCheck() == true || myCar2.hitCheck() == true || myCar3.hitCheck() == true){
  myCar1.changeDir(xspeed); 
  myCar2.changeDir(xspeed2); 
  myCar3.changeDir(xspeed3); 
  }*/ 
  
  
 
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
    xpos = xpos + xspeed;
    if (xpos >= width || xpos <= 0) {
      hit = true;
    }
  }
  
void addSpeed(){
  if (xspeed >= 0)
  xspeed = xspeed + random(0.001,0.01); 
  else
  xspeed = xspeed - random(0.001,0.01);
}
  
void changeDir(float tempXspeed) {
    //xspeed = -tempXspeed;
    if (xspeed >= 0)
    {
    xspeed = -tempXspeed; 
    }
    else
    {
    xspeed = tempXspeed;
    }
    //hit = false;
    //c = tempC;  
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


