
//Put in the bullet's move function:  bulletPosX = xpos; bulletPosY = ypos;
//My computer isn't letting me test this version for some reason, so if you find a bug, tell me, and I'll fix it.
float bulletPosX;
float bulletPosY;
Robot marcus;
Robot frank;

 
void setup(){
  size(700,700);
  marcus= new Robot();
  frank= new Robot();
    
 }

class Robot{
  // Data
  color c;
  color outline;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float w;
  float h;
  boolean robotCollision;
    
    
  //Constructor
  Robot() {
    c=color(0);
    outline=color(0);
    xpos=random(50,100);
    ypos=random(50,100);
    xspeed=random(1,5);
    yspeed=random(2,6);
    w=15;
    h=15;
    robotCollision = false;
  }
  //Functionality
  void display() {
    rectMode(CORNER);
    //body
    fill(c);
    stroke(outline);
    rect(xpos,ypos,w+20,h+60);
    // head
    fill(c+255);
    stroke(outline);
    ellipse(xpos+17,ypos-30,w+50,h+50);
    fill(c);
    //arms
    rect(xpos-40,ypos+10,w+30,h+10);
    rect(xpos+30,ypos+10,w+30,h+10);
  }
    
  void drive() {
    xpos=xpos+xspeed;
    if (xpos>width+30 && robotCollision == false) {
      xpos=0;
    }
    //bounce of robot from top to bottom
  ypos=ypos+yspeed;
  if ((ypos>height-20) || (ypos<50)) {
       yspeed = yspeed * -1;  
  }
  //If the bullet hits the robot, the robot will go away
  if (xpos < xpos+(w+20)/2 && xpos > xpos-(w+20)/2 && ypos < ypos+(h+60)/2 && ypos > ypos-(h+60)/2) {
    robotCollision = true;
    xpos = 1000;
  }
}
}
  
