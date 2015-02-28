
 
class Map {
 
  void showMap() {
 
    rectMode(CORNER);
    smooth();
// Where the frog will start
    fill(0, 255, 0);
    rect(0, 550, 600, 100);
// The other side of the road before the water 
    fill(0, 255, 0);
    rect(0, 250, 600, 50);
 
// The landing pads where the frog will finish
    noFill();
    ellipse(100, 30, 30, 30);  
    ellipse(200, 30, 30, 30);
    ellipse(300, 30, 30, 30);
    ellipse(400, 30, 30, 30);
    ellipse(500, 30, 30, 30);
    noStroke();
    fill(0, 175, 0);
    rect(0, 0, 75, 50);
    rect(126, 0, 50, 50);
    rect(226, 0, 50, 50);
    rect(326, 0, 50, 50);
    rect(426, 0, 50, 50);
    rect(526, 0, 80, 50);
    rect(0, 0, 600, 10);
 
// The road the frogger needs to cross 
    fill(175);
    rect(0, 300, 600, 250);
// The Water the frog needs to cross to reach its destination
    fill(0, 0, 255);
    rect(0, 50, 600, 200);
  }
}
 
class Car {

// The car variables
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float cr;
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }  
 
  void display() {
 
// The car structure
    
    stroke(0);
    fill(c);    
    rectMode (CENTER);                             
    rect(xpos, ypos, 64, 32);
    
// Give every car wheels
    fill(175);                                       //make the wheels grey
    ellipse(xpos-15, ypos-15, 11, 11);
    ellipse(xpos+15, ypos+15, 11, 11);
    ellipse(xpos+15, ypos-15, 11, 11);
    ellipse(xpos-15, ypos+15, 11, 11);
// Giving each car a front and rear window
    stroke(0);
    fill(0);
    rect(xpos+26, ypos+0, 11, 15);
    stroke(0);
    fill(0);
    rect(xpos-26, ypos+0, 11, 15);
  }
 
// Moving the cars  
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = 600;
    }
  }
}  
 
class Log {

// The Log variables
  float xpos;
  float ypos;
  float xspeed;
  float lr;
  float c = random(0, 255);
  Log(float tempXpos, float tempYpos, float tempXspeed) {
    c = random(50, 255);
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
 
  void display() {  
// Log Structure
  
    stroke(0);
    rectMode(CENTER);
    fill(127, 0, 0);
    rect(xpos, ypos, 90, 35);
  }
 
// Moving the logs  
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = 600;
    }
  }
} 
 
class Frogger {                                         
 
  int x_, y_;
  int drowningCounter=0;                              // Frog will drown if it hits the water
 
  Frogger(int froggerxpos, int froggerypos) {
    x_ = froggerxpos;
    y_ = froggerypos;
  }      
 
  void show() {
// Body of the frog
    
    smooth();
    stroke(0);
    fill(0, 175, 0);                                   // Colour the frog green
    rect(x_, y_, 30, 35);
    fill(0, 255, 0);
    rect(x_-15, y_-7, 10, 8);                          //Top Left Leg 1
    rect(x_-15, y_+7, 10, 8);                          //Bottom Left Leg 2
    rect(x_+15, y_-7, 10, 8);                          //Top Right Leg 2
    rect(x_+15, y_+7, 10, 8);                          //Bottom Right Leg 3
    fill(0);
    rect(x_-5, y_-15, 5, 5);                           //Left eye
    rect(x_+5, y_-15, 5, 5);                           //Right eye
 
 // Where the frogger will restart, prevents the frog from going past the landing pads
    if (y_ < 10) {  
      x_ = 300;
      y_ = 600;
    }
  }
  
// This how much the frog can move 
  void Down() {
    y_= y_+10;
  } 
  void Up() {
    y_= y_-10;
  }
  void Left() {
    x_= x_-10;
  } 
  void Right() {
    x_= x_+10;
  }
  void collideCar( Car car ) {

// Frogger can collide with the cars
    if ((x_-15 >= car.xpos-42) &&  (x_+15 <= car.xpos+42) &&
      (y_ >= car.ypos-16) &&  (y_ <= car.ypos+20)) 
    {
// Message will appear when frogger is hit by a car and will restart
      println ("Dead Frogger");
      
      x_ = 300;  
      y_ = 600;
    } 
  } 
 
  void collideLog ( Log log ) {
    
 // Frog will ride the logs 
    if ((x_-15 >= log.xpos-42) &&  (x_+15 <= log.xpos+42) &&
      (y_ >= log.ypos-16) &&  (y_ <= log.ypos+20)) 
    {
 // Message will appear when frogger is on a log
      println ("Frogger on a Log");
      x_+= log.xspeed; 
      drowningCounter=0;                                         // Frogger can drown
      
    } 
    else {
 // If frogger is not on a log, it will drown 
      if (y_<250) {
 // This message will appear if the frog drowns
        println ("Frogger drowning");
        drowningCounter++; 
        if (drowningCounter>13) {
          println ("Frogger Dead: drowned");
          x_ = 300;                                               // Frogger will restart if it drowns
          y_ = 600;
        }
      }
      else {
        drowningCounter=0;                       
      }
    }
  }
}




