
//Homework week 6
//Bouncing ball with gravity using PVector and Mover
//Code taken from PVector tutorial
//Edited by me where noted.
//Original code where noted.
Mover mover;

void setup() {
  size(900,600);
  smooth();
  background(255);
  mover = new Mover();
}

void draw() {
  noStroke();
  fill(0,255);
  rect(0,0,width,height);


  mover.update();
  mover.checkEdges();
  mover.display();
  mover.control();
  mover.reset();
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector thrust;



  Mover() {
    location = new PVector(20, 20); //my own setting
    velocity = new PVector(1,0); //my own setting
    acceleration = new PVector(0, .02); //my own setting
    thrust = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.sub(thrust);
  }
  void reset() {
    if(key == 'r' || key == 'R') {
      location.x = 20;
      location.y = 20;
      velocity.x = 1;
      velocity.y = 0;
      thrust.x = 0;
      thrust.y = 0;
    }
  }

  void control() {
    if(key == 's' || key == 'S') {
      thrust.x = 0;
      thrust.y = 0;
    }
    else if(key == 'a' || key == 'A') {
      thrust.x = .05;
    }
    else if(key == 'd' || key == 'D') {
      thrust.x = -.05;
    }
    else if(key == 'w' || key == 'W') {
      thrust.y = .05;
    }
    else if(key == 'x' || key == 'X') {
      thrust.y = -.008;
    }
  }

  void display() {
    noStroke();
    fill(0,255,0);
    rect(location.x,location.y,32,32); //modified by me to get
    //32x32 circle
    fill(255,0,0);
    rect(700, height-20, 100, 30);
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

    if (location.y > height-32) {
      velocity.y = velocity.y * 0;
      velocity.x = velocity.x * 0; //this simulates ground friction
      location.y = height - 32;
    }
    dist(location.x, location.y, 700, height-20);
    if((dist(location.x, location.y, 700, height-20) < 50)) {
      fill(255);
      text("YOU WIN", width/2, height/2);
      velocity.x = 0;
      velocity.y = 0;
    }
    else if(location.y > height-32) {
      fill(255);
      text("YOU LOSE", width/2, height/2);
      velocity.x = 0;
      velocity.y = 0;
    }


    /*else if (location.y < 16) {
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
     */
  }
}


