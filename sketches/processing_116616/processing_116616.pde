
Robot marcus;
Robot frank;
 
void setup(){
  size(700,700);
  marcus= new Robot();
  frank= new Robot();
    
 }

 
void draw() {
  background(255);
 // robots
  marcus.display();
  marcus.drive();
  frank.display();
  frank.drive();
}
 
class Robot{
  // Data
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float w;
  float h;
   
   
  //Constructor
  Robot() {
    c=color(0);
    xpos=random(150,550);
    ypos=random(150,550);
    xspeed=random(1,5);
    yspeed=random(2,6);
    w=15;
    h=15;
  }
  //Functionality
  void display() {
    rectMode(CORNER);
    //body
    fill(c);
    stroke(0);
    rect(xpos,ypos,w+20,h+60);
    // head
    fill(c+255);
    stroke(0);
    ellipse(xpos+17,ypos-30,w+50,h+50);
    fill(c);
    //arms
    rect(xpos-40,ypos+10,w+30,h+10); 
    rect(xpos+30,ypos+10,w+30,h+10); 
  }
   
  void drive() {
    xpos=xpos+xspeed;
    if (xpos>width+30) {
      xpos=0;
    }
    //bounce of robot from top to bottom
  ypos=ypos+yspeed;
  if ((ypos>height-20) || (ypos<50)) {
       yspeed = yspeed * -1;   
  }
}
}
  
