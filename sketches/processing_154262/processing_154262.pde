
import java.util.*;

ArrayList<Snow> snows;

void setup() {
  size(640, 640);
  snows = new ArrayList<Snow>();
  loadSnow();
}

void draw() {
  //background(0);
  background(25, 151, 255);
  if ((frameCount % 3) == 0) {
    addSnow();
  }
  
  //lights();  //Only for 3D
  drawSnow();
  for(int i = 0; i < snows.size(); i++){
    Snow s = snows.get(i);
    if(s.dead){
      snows.remove(s);
    } 
  }
}

void loadSnow() {
  for (int i = 0; i < 1; i++) {
    snows.add(new Snow());
  }
}

void drawSnow() {
  for (Snow s: snows) {
    s.display();
  }
}

void addSnow() {
  snows.add(new Snow());
}

class Snow {
  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector wind;
  PVector gravity;

  float snowHeight, snowWidth;
  float mass;

  boolean death = false;

  Snow() {
    snowHeight = random(5, 60);
    snowWidth  = snowHeight;

    //location   = new PVector(random(z), -1000, random(-z, z)); //Only for 3D
    location = new PVector(random(width), -snowHeight);
    velocity   = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    wind = new PVector(random(-0.004, 0.004), 0);

    mass = 100/snowWidth;
    gravity = new PVector(0, 0.05);
  }

  void display() {
    drawSnow();
    moveSnow();
    applyForce(gravity);
    applyForce(wind);
  }

  void drawSnow() {
    noStroke();
    fill(255, 200);
    ellipse(location.x, location.y, snowWidth, snowHeight);
    //Only for 3D
    /*pushMatrix();
     translate(location.x, location.y, location.z);
     fill(255);
     noStroke();
     sphere(snowHeight);
     popMatrix();*/
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void moveSnow() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //if (location.y > 1000+snowHeight) { //Only for 3D
    if (location.y > height+snowHeight) {
      death = true;
    }
  }
}



