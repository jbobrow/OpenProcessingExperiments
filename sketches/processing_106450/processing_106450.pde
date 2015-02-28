
int numBalls;
PinBall[] balls;
PinBall pinball;

boolean dragged;

float mouseXstart, mouseYstart, mouseXend, mouseYend;
float calc;

PVector force;

void setup(){
  size(700, 700);
  smooth();
  background(0);
  
  numBalls = 5;
  balls = new PinBall[numBalls];
  pinball = new PinBall(-1);
  
  for (int i = 0; i <numBalls; i++){
    balls[i] = new PinBall(i);
  }
}

void draw(){
  noStroke();
  fill(255,10);
  rect(0,0, width, height);
  
  if (mousePressed){
    pinball.giveBirth();
  }
  for (int i=0; i<numBalls; i++){
    if (mousePressed){
       balls[i].giveBirth();
    }
    balls[i].display();
    balls[i].update();
    balls[i].checkEdges();
    balls[i].addForce(calc, calc);
    detectCollision();
  }
  pinball.display();
  pinball.update();
  pinball.checkEdges();
  pinball.addForce(calc, calc);
  detectCollision();
 }
  
/*
void mouseClicked(){
  //pinball.giveBirth();
  for (int i=0; i<numBalls; i++){
    balls[i].giveBirth();
    balls[i].update();
    balls[i].checkEdges();
    balls[i].display();
  }  
}
*/

void mousePressed(){
  dragged = true;
  mouseXstart = mouseX;
  mouseYstart = mouseY;
  //force.x = dist(mouseX, mouseY);
}



void mouseReleased(){
  dragged = true;
  mouseXend = mouseX;
  mouseYend = mouseY;
  calc = abs(dist(mouseXstart, mouseYstart, mouseXend, mouseYend));
  //calc *= -1;
}

// insane! thanks for the help Anthony!!!
void detectCollision(){
    
    for (int i=0; i<numBalls; i++){
      for (int j=0; j<numBalls; j++){
        if (i!=j){
          float distance = dist(balls[i].location.x, balls[i].location.y, balls[j].location.x, balls[j].location.y);
          
          if (distance <= ((balls[i].rad*balls[i].inc)+(balls[j].rad*balls[j].inc))) {
            balls[i].location.y -=balls[i].ySpeed*2.0;
            
            balls[i].ySpeed*= -0.95;
            balls[j].ySpeed*= -0.95;
          } 
          if (distance <= ((balls[i].rad*balls[i].inc)+(balls[j].rad*balls[j].inc))) {
            balls[i].location.x -= balls[i].xSpeed*2.0;
            
            balls[i].xSpeed*= -0.95;
            balls[j].xSpeed*= -0.95;
          }
        }
      }
    }
  }


class PinBall {
  // object has two PVectors: location and velocity
  PVector location;
  PVector velocity;
  PVector acc;
  
  // variables for position and speed xy
  float xPos, yPos;
  float xSpeed, ySpeed;
  float inc;
  
  color fur;
  
  // variables for radius, time born, life-span, and starting index
  int rad;
  int born;
  int lifeSpan;
  int index;
  
  boolean alive;

// constructor for pin ball monster
  PinBall(int tempIndex) {
    xPos = random(rad, width-rad);
    yPos = random(rad, height-rad);
    xSpeed = random(-2, 2);
    ySpeed = random(-10, 10);
    
    location = new PVector(xPos, yPos);
    velocity = new PVector(xSpeed, ySpeed);
    acc = new PVector(random(-5,5), random(-10,10));
    
    rad = 0;
    fur = color(255);
    born = 0;
    lifeSpan = 8000;
    alive = false;
    index = tempIndex;
    
  }

  void update() {
    if (alive) {
    // Motion 101: Locations changes by velocity.
    xSpeed =random(-2, 2);
    ySpeed =random(-10, 10);
    location.add(acc);
    acc.mult(0);
    velocity.mult(0.999);
    location.add(velocity);
    
    }
}
  

  void display() {
    inc = 25;
    strokeWeight(3);
    stroke(0);
    fill(fur);
    ellipse(location.x, location.y, rad*inc, rad*inc);
    fill(255);
    ellipse(location.x-(rad*2), location.y-(rad*2), rad*12, rad*5);
    fill(0);
    ellipse(location.x-(rad*2), location.y-(rad+rad*0.5), rad*3, rad*3);
    line(location.x-(rad*8), location.y+(rad*5), location.x+(rad*6), location.y+(rad*5)); 
  }

  void checkEdges() {

    if (location.x > width) {
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
    }
    
    if (location.y > height) {
      velocity.y *= -1;
    } else if (location.y < 0) {
      velocity.y *= -1;
    }

  }
  
  void addForce(float x, float y){
    PVector force = new PVector(x, y);
    acc.add(force);

  }

  
  
  void giveBirth() {
    alive = true;
    born = millis();
    fur = color(random(255), random(255), random(255));
    xPos = mouseX;
    yPos = mouseY;
    xSpeed = 10;
    ySpeed = 2;
    rad = 3;
  }

}


