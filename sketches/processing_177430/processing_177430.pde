
// Nature of Code: Ch1 vector movement. Ch2 applying forces.
// Ch3 oscillation. Ch4 particles. Ch6 seeking and avoiding.
// mouse controls submarine depth

Submarine sub;
Shoal sardines;
SeaWater sea;

void setup() {
  size(1000, 400);
  sub = new Submarine(-500, height/2); 
  sardines = new Shoal();
  sea = new SeaWater();
}

void draw() {
  //noLoop();
  frameRate(10);
  background(0, 170, 250);
  sub.setDepth(); 
  sardines.moveAwayFrom(sub);
  sea.display();
}



class AirLeak {
  ArrayList<Bubble> bubbles;
  PVector pos;

  AirLeak() {
    pos = new PVector();
    bubbles = new ArrayList<Bubble>();
  }

  void run(PVector l) {
    pos.set(l);// see where the sub is
    // limit particle generation frequency
    if (frameCount % 2 == 0) {
      bubbles.add(new Bubble(pos));
    }
    for (int i = bubbles.size () -1; i >= 0; i--) {
      Bubble b = bubbles.get(i);
      b.run();
      if (b.isDead()) {
        bubbles.remove(i);
      }
    }
  }
}

class Bubble {
  PVector pos;
  PVector vel;
  PVector accel;
  PVector spread;
  float lifespan, diam;

  Bubble(PVector l) {
    accel = new PVector();
    vel = new PVector();
    spread = new PVector(random(0, 5), -5);
    accel.add(spread);
    pos = l.get();
    lifespan = 255.0;
    diam = random(1, 10);
  }

  void run() {
    move();
    display();
  }

  void move() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    lifespan -= 7;
    diam += 0.1;
  }

  void display() {
    stroke(0);
    strokeWeight(0.3);
    fill(255, lifespan);
    ellipse(pos.x, pos.y, diam, diam);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class DepthControl {
  PVector pos;
  DepthControl() { 
    pos = new PVector(width*2, height/2);
  }
  void move() {
    pos.y = mouseY;
  }
}

class Fish {
  PVector accel, vel, pos, moveAnyWhere, moveTowards, moveAway;
  float angle, dist, maxSpeed, maxForce;

  Fish() {
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(width+10, height/2); 
    moveAway = new PVector();
    moveAnyWhere = new PVector(random(-3, -0.9), random(-0.9, 0.9));
    applyForce(moveAnyWhere);
    maxSpeed = 2;
    maxForce = 2;
  }

  void applyForce(PVector f) {
    accel.add(f);
  }

  void update() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
  }

  void avoid(Submarine sub) { // inverse of the seek() method from NOC Ch6
    moveTowards = PVector.sub(sub.pos, pos);  
    dist = moveTowards.mag(); 
    if (dist < 250) {
      moveAway.set(-moveTowards.x, -moveTowards.y);
      moveAway.normalize();  
      moveAway.mult(maxSpeed);
      PVector steer = PVector.sub(moveAway, vel);
      steer.limit(maxForce);
      applyForce(steer); 
      // some problem with this here, but works in submarine class
      // moveAway.sub(vel);
      // moveAway.limit(maxForce);
      // applyForce(moveAway);
    }
  }

  void display() {
    
    pushMatrix(); 
    angle = vel.heading2D() + PI;
    translate(pos.x, pos.y);
    rotate(angle);
    //scale(2);
    beginShape(); // simple tail
    stroke(0);
    strokeWeight(.5);
    vertex(0, 0);
    vertex(10, random(-3, 3));
    endShape();
    fill(random(255)); // glisten
    //strokeWeight(1.5);
    ellipse(-8, 0, 16, 5);
    strokeWeight(1);
    line(-10, 0, -5, 0); // dorsal fin
    strokeWeight(3);
    point(-13,-2); // eyes
    point(-13, 2);
    popMatrix();
  }

  void bounds() {
    if (pos.x < -150 ) {
      pos.x = width + 10;
    }
    if (pos.x > width + 150) {
      pos.x = -150;
    }
    if ((pos.y > height +20 ) || (pos.y < -20 )) {
      vel.y = vel.y * -1;
    }
  }

  void run(Submarine s) {
    update();
    avoid(s);
    bounds();
    display();
  }
}

class SeaWater {
  float a;

  SeaWater() {
  }

  void display() { 
    fill(0, 0, 0, 150);
    strokeWeight(1);
    a = 0;
    for (int i = 0; i < height; i += 1) {
      stroke(40, 12, 170, a);
      line(0, i, width, i);
      if (i > height/5) {
        a +=  0.4;
      }
      if (i > height/3) {
        a +=  0.5;
      }
      if (i > height-height/3) {
        a +=  0.6;
      }
    }
  }
}

class Shoal {
  int  num;
  Fish[]  fish;

  Shoal() {
    num = 50; 
    fish = new Fish[num];
    for (int i = 0; i < num; i++) {
      fish[i] = new Fish();
    }
  }  

  void moveAwayFrom(Submarine s) {
    for (Fish f : fish) {
      f.run(s);
    }
  }
}

class SubDraw {
  float x, y, period, amplitude, num1, num2, num3, fade;

  SubDraw() {
    period  = 50;    
    amplitude = 54;
    x = -140;
    y = 40;
  }

  void drawBody() {
    // axle
    stroke(0);
    strokeWeight(2);
    line(x-5, y, x+20, y);
    
    
    // shroud
    strokeWeight(.5);
    fill(150);
    rect(x+12, y-60, 28, 120);
    rect(x-15, y-60, 55, 5);
    rect(x-15, y+55, 55, 5);
    triangle(x+40, y-59, x+40, y-10, x +80, y-10); 
    triangle(x+40, y+59, x+40, y+10, x+80, y+10);

    //periscope
    rect(x+110, y-120, 10, 50);
    arc(x+130, y-120, 60, 20, radians(90), radians(270));
    stroke(0);
    strokeWeight(.5);
    ellipse(x+130, y-120, 10, 20);
    fill(255);
    ellipse(x+130, y-120, 8, 18);
    fill(150);

    // tower 
    rect(x+90, y-80, 80, 50, 10);

    // body
    ellipse(x +125, y, 200, 100);

    //portholes
    stroke(0);
    strokeWeight(.5);

    fill(70);
    ellipse(x+170, y-25, 25, 25);
    ellipse(x+170, y-25, 17, 17);
    fill(255);
    ellipse(x+170, y-25, 15, 15);

    fill(70);
    ellipse(x+130, y-30, 25, 25);
    ellipse(x+130, y-30, 17, 17);
    fill(255);
    ellipse(x+130, y-30, 15, 15);

    fill(70);
    ellipse(x+90, y-25, 25, 25);
    ellipse(x+90, y-25, 17, 17);
    fill(255);
    ellipse(x+90, y-25, 15, 15);

    //fin
    strokeWeight(.5);
    beginShape();
    fill(150);
    ellipse(x+125, y, 100, 20);
    vertex(x+175, y);
    vertex(x+155, y+20);
    vertex(x+65, y+20);
    vertex(x+75, y); 
    endShape();
    ellipse(x+110, y+20, 90, 15);
  }
  
  // OK, it doesn't actually illuminate anything...
  void glow() {
    fill(255);
    stroke(0);
    strokeWeight(.5);
    arc(x+228, y, 38, 38, radians(-85), radians(85));
    stroke(0);
    fill(150);
    strokeWeight(1);
    rect(x+220, y-20, 10, 40);
    noFill();
    strokeWeight(1);
    fade = 255;
    for (int i = 0; i < 100; i += 1) {
      stroke(220, 250, 250, fade);
      arc(x+228, y, 40+i, 40+i, radians(-70), radians(70));
      fade -= 3;
    }
  }

  void animateProp() {
    noStroke();
    fill(70);
    
    // first blade
    num1 =  amplitude * cos(TWO_PI * frameCount/period);
    triangle(x, y, x-10, y+num1, x+10, y+num1);

    // advance second blade by approx. 2/3 of a cycle
    num2 =  amplitude * cos(TWO_PI * (0.6 + (frameCount/period))); //0.675
    triangle(x, y, x-10, y+num2, x+10, y+num2);

    // advance  third blade by approx. 1/3 of a cycle
    num3 =  amplitude * cos(TWO_PI * (0.3 + (frameCount/period))); //0.285
    triangle(x, y, x-10, y+num3, x+10, y+ num3);
    
    // hub
    stroke(0);
    strokeWeight(10);
    line(x-5, y, x+1, y);
  }

  void display() {
    drawBody();
    animateProp();
    glow();
  }
}


class Submarine {
  SubDraw subDraw;
  DepthControl depth;
  AirLeak  leak;
  PVector accel, vel, pos, move, desired;
  float maxSpeed, maxForce, angle, dist;

  Submarine(int x, int y) {
    subDraw = new  SubDraw();
    depth = new DepthControl();
    leak = new AirLeak();
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y); 
    maxSpeed = 7;
    maxForce = 0.07;
  }

  void applyForce(PVector f) {
    accel.add(f);
  }

  void setDepth() { // the seek() method from NOC Ch6
    depth.move();
    desired = PVector.sub(depth.pos, pos);  
    dist = desired.mag(); 
    desired.normalize();  
    desired.mult(maxSpeed);
    // PVector steer = PVector.sub(desired, vel);
    // steer.limit(maxForce);
    // applyForce(steer); 
    desired.sub(vel);
    desired.limit(maxForce);
    applyForce(desired);
    update(); 
    wrap();
    display();
  }

  void update() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
  }

  void display() {
    pushMatrix();
    leak.run(pos);
    angle = vel.heading2D();
    translate(pos.x, pos.y);
    rotate(angle);
    scale(.7); 
    subDraw.display();
    popMatrix();
  }

  void wrap() {
    if (pos.x > width + 150 ) { 
      pos.x = -150;
    }
  }
}



