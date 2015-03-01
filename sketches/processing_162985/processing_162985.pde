
//andra lineVectors, testar med flera movers och linjer mellan movers.

Mover[] movers = new Mover[50];
Attractor[] attractors = new Attractor[1];

boolean record = false;
String time;

int rowSpace;
int colSpace;
int randOffsetX;
int randOffsetY;

void setup() {
  frameRate(30);
  size(640, 480);
  time = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  smooth();

  randOffsetX = int(width/3);
  randOffsetY = int(height/3);


  for (int i = 0; i< movers.length; i++) {
    movers[i] = new Mover(random(1, 4), width/2+random(-randOffsetX, randOffsetX), height/2+random(-randOffsetY, randOffsetY));
  }
  // for (int i = 0; i<attractors.length; i++) {
  attractors[0] = new Attractor(width/2, height/2, 40);
  // }
  background(50);
}

void draw() {
  //background(50);
  fill(50, 200);
  rect(0, 0, width, height);
  noStroke();


  for (int i = 0; i < movers.length; i++) {

    for (int j = 0; j < attractors.length; j++) {
      PVector force = attractors[j].attract(movers[i]);
      //attractors[j].display();
      movers[i].applyForce(force);
      attractors[j].location = new PVector(mouseX, mouseY);

      //DrawLine L = new DrawLine(attractors[j], movers[i]);
      //L.drawLine();
    }
    if (i > 0) {
    }

    for (int k = 0; k < movers.length; k++) {
      if (k != i) {
        //PVector force = movers[i].attract(movers[k]);
        //movers[k].applyForce(force);
        //PVector force2 = new PVector(random(-0.05,0.05), random(-0.05,0.05));
        //movers[k].applyForce(force2);

        DrawLine L = new DrawLine(movers[i], movers[k]);
        L.drawLine(50);
      }
    }

    movers[i].checkEdges();
    movers[i].update();
    // movers[i].display();
  }


  if (record == true) {
    saveFrame(time+"/output-####.tga");
  }

  if (frameCount >= 900) {
    //exit();
  }

  println(frameCount);
}

class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor(float x, float y, float m) {
    location = new PVector(x, y);
    mass = m;
    G = 2;
  }

  void display() {
    //stroke(0);
    fill(175, 50);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance,1.0,5.0);
    
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);

if(mousePressed == true){
    force.mult(-strength);
}else{
  force.mult(strength);
}
    return force;
  }
}

class DrawLine {
  PVector trans;
  PVector line;
  PVector obj1;
  PVector obj2;

  DrawLine(Attractor o1, Mover o2) { // o som i objekt 1 och 2
    obj1 = o1.location;
    obj2 = o2.location;
  }

  DrawLine(Mover o1, Mover o2) { // o som i objekt 1 och 2
    obj1 = o1.location;
    obj2 = o2.location;
  }

  void drawLine(int len) {
    trans = obj1;

    line = PVector.sub(obj1, obj2);
    //line.div(4);
    if(line.mag() <= len){
    stroke(255, 10);
    strokeWeight(2);
    pushMatrix();
    translate(trans.x, trans.y);
    line(0, 0, -line.x, -line.y);
    popMatrix();
    noStroke();
    }
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;

  float topspeed;

  float size = 30;
  float halfSize = size/2;
  float G;


  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    G = 4;
    mass = m;
    topspeed = 20;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {   
    halfSize = mass*size/2; 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity); 
    acceleration.mult(0);
  }

  void display() {
    //stroke(0);
    colorMode(HSB, 360, 100, 100, 100);
    fill(180, 75, 75, 25);

    ellipse(location.x, location.y, mass*size, mass*size);
    colorMode(RGB);
  }

  void checkEdges() {
    if (location.x >= width-halfSize) {
      location.x = width-halfSize;
      velocity.x *= -1;
    } else if (location.x <= halfSize) {
      location.x = halfSize;
      velocity.x *= -1;
    }

    if (location.y >= height-halfSize) {

      location.y = height - halfSize;
      velocity.y *= -1;
    } else if (location.y <= halfSize) {
      location.y = halfSize;
      velocity.y *= -1;
    }
  }


  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);

    force.mult(strength);

    return force;
  }
}



