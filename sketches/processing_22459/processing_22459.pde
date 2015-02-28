
//Homework week 6
//Bouncing ball with gravity using PVector and Mover
//Code taken from PVector tutorial
//Edited by me where noted.
//Original code where noted
//A,S,D keys affect the direction of the wind.
Mover mover;

void setup() {
  size(900,600);
  smooth();
  background(255);
  mover = new Mover();
  
}
 
void draw() {
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
 
   
  mover.update();
  mover.checkEdges();
  mover.display();
  mover.wind();
  
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector wind;
   
 
 
  Mover() {
    location = new PVector(20, 20); //my own setting
    velocity = new PVector(3,0); //my own setting
    acceleration = new PVector(0, .15); //my own setting
    wind = new PVector(0, 0);
     
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.sub(wind);
  }
 
  void wind(){
    if(key == 's' || key == 'S'){
      wind.x = 0;
      wind.y = 0;
    }else if(key == 'a' || key == 'A'){
      wind.x = .008;
    }else if(key == 'd' || key == 'D'){
      wind.x = -.008;
    }
  }
  void display() {
    noStroke();
    fill(255,0,0);
    ellipse(location.x,location.y,32,32); //modified by me to get
    //32x32 circle.
  }
 
  void checkEdges() {  //modified by me to simulate basic
  //projectile motion
 
    if (location.x > width - 16) {
      velocity.x = velocity.x * -.8; //simulates bounce energy loss
      location.x = width-16;
       
    }
    else if (location.x < 16) {
      velocity.x = velocity.x * -.8;
      location.x = 16;
    }
 
    if (location.y > height - 16){
      velocity.y = velocity.y * -0.8000;
      velocity.x = velocity.x * .99; //this simulates ground friction
      location.y = height - 16;
      
    }
    else if (location.y < 16) {
      velocity.y = velocity.y * -0.8000;
      location.y = 16;
    }
     
    //This lets you "catch" and "throw" the ball.
    // Original code taken from previous excercises and programs in class.
    dist(location.x, location.y, mouseX, mouseY);
    if(dist(location.x, location.y, mouseX, mouseY) < 16){
      if (mousePressed == true) {
        location.x = mouseX;
        location.y = mouseY;
        velocity.x = mouseX - pmouseX;
        velocity.y = mouseY - pmouseY;
      }
    }
  }
}

