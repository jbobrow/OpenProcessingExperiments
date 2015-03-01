
//Credit to Daniel Shifman for applyForce function.
//Credit to prcessing sketch http://www.openprocessing.org/sketch/88665 for inertia.
//Credit to Caio for mouse logic

Ball b;
PVector wind;
PVector gravity;



void setup() {
  size(600,600);
  wind = new PVector(.005,0);
  gravity = new PVector(0,.01);
  println(wind.x);
  b = new Ball();
}


void draw() {
  background(0);
  b.run();
  stroke(255);
  noFill();
  rectMode(CENTER);
  rect(width/2,height/2,400,400);
  
  text("x speed" + abs(b.speed.x), 10,10);
  text("y speed" + abs(b.speed.y), 10,30);
  text("Gravity" + gravity.y, 10,50);
  text("Wind" + wind.x, 10,90);
  text("mass" + b.mass, 10,70);
  
  
} 

void mousePressed() {
     v.mass++;
     println(v.mass);
  }
//inertia modification of http://www.openprocessing.org/sketch/88665
class Ball {
  PVector position, speed, acceleration;
  float direction;
  float mass;
  float totalAcceleration;
  float maxSpeed;


  Ball() {
    position = new PVector(width/2, height/2);
    speed = new PVector();
    acceleration = new PVector();
    totalAcceleration = .5;
    mass = 20;
  }
  void run() {
    update();
    drawBall();
    movement();
    
    applyForce(wind);
    applyForce(gravity);
    collision();
    mouseDragged();
    mouseReleased();
  
  }

  void update() {
    speed.add(acceleration);
    position.add(speed);
    acceleration.set(0, 0, 0);
    if (speed.mag() !=0) {
      speed.mult(.99);
    }
  }

  void drawBall() {
    ellipse(position.x, position.y, mass, mass);
  }



  void movement() {

    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) {
        acceleration.x = -totalAcceleration;
      } else if (keyCode == RIGHT) {
        acceleration.x = totalAcceleration;
      } else if (keyCode == UP) {
        acceleration.y = -totalAcceleration;
      } else if (keyCode == DOWN) {
        acceleration.y = totalAcceleration;
      }
    }
  }

  void collision() {
    if (position.x + (mass/2)>= width-100) {
      speed.x *= -1;
      //acceleration.x *= -1;
    } else if (position.x - (mass/2)< 100) {
      speed.x *= -1;
      //acceleration.x *= -1;
    } else if (position.y + (mass/2) >= 500) {
      speed.y *= -1;
    } else if (position.y - (mass/2) <= 100) {
      speed.y *= -1;
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.mult(force, mass);
    speed.add(f);
  }
  void mouseDragged() {
    if (mouseX > position.x - (mass/2) && mouseX < position.x + (mass/2) && mouseY > position.y - (mass/2) && mouseY < position.y + (mass/2)) {
      position.x=mouseX;
      position.y=mouseY;
      speed.x = 0;
      speed.y = 0;
    }
  }
  
  void mouseReleased() {
    if (mouseX > position.x - (mass/2) && mouseX < position.x + (mass/2) && mouseY > position.y - (mass/2) && mouseY < position.y + (mass/2)) {
    speed.x += gravity.x +((mouseX - (pmouseX)));
    speed.y += gravity.y +((mouseY - (pmouseY)));
    }
    }

}


