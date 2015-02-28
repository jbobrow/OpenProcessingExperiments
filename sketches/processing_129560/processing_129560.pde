
Skin [] cell = new Skin [460];
Ball ball;

int amount = 4;
int h = 75;
float theta = 0.0;



void setup() {
  size(600, 500);
  for (int i = 0; i < cell.length; i++) {
    cell[i] = new Skin();
  }
  ball = new Ball();
}
void draw() {
  background(255);
  beginShape();
  float angle = 0.0;
  for (int i = 0; i < cell.length; i++) {
    float x = i + 80; // density of points on x
    angle = map(i, 0, cell.length-1, 0, PI); // density of points on y and period of sine wave
    float y = height - sin(angle)*h;
    cell[i].setXYangle(cell[i], x, y, angle);    //cell[i] = new Skin(x, y);
  }

  for (Skin i : cell) {
    if (i.intersect(ball)) {
      i.react(i);
      ball.bounceOffSkin(i);
    }
    vertex(i.x, i.y);
    fill(50, 200);
    noStroke();
  }
  endShape();
  PVector wind = new PVector(random(0.02), 0);
  PVector gravity = new PVector(0, 0.02);
  ball.applyForce(wind);
  ball.applyForce(gravity);
  ball.update();
  ball.bounce();
  ball.resurface();
  ball.display();
}

void mousePressed() {
  ball = new Ball(mouseX,mouseY);
}
class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  float diameter=60;
  float angle = 0.0;
  Ball() {
    location = new PVector(diameter, height/3);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  Ball(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }



  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    velocity.limit(4);
  }
  void bounceOffSkin(Skin i) {
    angle = i.getAngle(i);
    angle = map(angle,0,PI,0.5,PI-0.5); // remap the angle to compute inclination
    //angle = atan((height/2-location.y)/(width/2-location.x)); alternative formula 
    PVector elasticForce = new PVector(0, 0);
    
    if (location.x <=width/2) {
      if (velocity.x < 0) {
        elasticForce.set(cos(angle)*velocity.x, velocity.y*sin(angle+PI));
      }
      else {
        elasticForce.set(-cos(angle)*velocity.x, velocity.y*sin(angle+PI));
      }
    } 
    else {
      if (velocity.x < 0) {
        elasticForce.set(cos(angle)*velocity.x, -velocity.y*sin(angle));
      }
      else {
        elasticForce.set(cos(angle+PI)*velocity.x, -velocity.y*sin(angle));
      }
    }
    float damp = 0.5;
    elasticForce.mult(damp);
    ball.applyForce(elasticForce);
  }
  void bounce() {
    if (location.x > width-diameter/2) {
      velocity.x *=-1;
      location.x = width-diameter/2;
    }
    if (location.x < diameter/2) {
      velocity.x *=-1;
      location.x = diameter/2;
    }
    if(location.y < diameter/2) {
      location.y = diameter/2;
      velocity.y*=-1;
    }
    if(location.y > height-diameter/2) {
      amount = 0;
    }
    else {
      amount = 4;
    }
  }

  void resurface() {
    if (location.y > height + diameter*3) {
      if (location.x > width/2) {
        location.x = 35;
      }
      else {
        location.x = 535;
      }
      PVector upForce = new PVector(0, -10);
      ball.applyForce(upForce);
    }
  }



  void display() {
    stroke(0);
    strokeWeight(1);
    smooth();
    fill(100,150);
    ellipse(location.x, location.y, diameter, diameter);
  }
}
class Skin {
  float x, y;
  float angle;
  
  Skin() {
  }

  
  float getAngle(Skin cell) {
    return cell.angle;
  }
  

void setXYangle(Skin cell, float x, float y, float a) {
  cell.x = x;
  cell.y = y;
  cell.angle = a;
}


  boolean intersect(Ball b) {
    float d = dist(x,y,b.location.x,b.location.y);
    if (d <= b.diameter/2) {
      return true;
    }
    else {
      return false;
    }
  }

  void react(Skin c) {
    c.y-=random(-amount, amount);
  }
}
