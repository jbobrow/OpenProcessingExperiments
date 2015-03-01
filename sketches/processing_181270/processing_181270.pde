
// Daniel Shiffman Nature of Code
// Ch 8 recursive trees
// Ch 4 particle emitters

Emitter rain;
Tree tree;
Vehicle bird;
boolean rainFin, sprtFin;

void setup() {
  size(500, 430);
  rain = new Emitter();
  tree = new Tree();
  bird = new Vehicle();
  rainFin = false;
  sprtFin = false;
}

void draw() {
  frameRate(10);
  background(0);
  stroke(204);
  strokeWeight(2);
  line(0, 400, width/2-5, 400);
  line(width/2+5, 400, width, 400);
  bird.fly();
  if (!rainFin) rainFin = rain.fall();
  if (rainFin && !sprtFin) sprtFin = tree.sprout();
  else if (sprtFin)tree.unfurl();
}

class Vehicle {
  PVector  vel, pos; 
  color  c;

  Vehicle() {
    vel = new PVector(5, 0);
    pos = new PVector(-10, 150);
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    c = color(random(255), random(255), random(255));
    strokeWeight(.4);
    stroke(255);
    fill(c);
    ellipse(pos.x, pos.y, 5, random(8, 18));  
    stroke(255);
    fill(80);
    ellipse(pos.x, pos.y, 12, 3); 
  }

  void wrap() {
    if (pos.x > width + random(500, 1000)) {
      pos.x = -10;
      pos.y = random(50, 100);
      vel.set(random(5, 10), random(-2, 2));
    }
  }

  void fly() {
    update();
    wrap();
    display();
  }
}

class Emitter {
  ArrayList<Particle> particles;
  PVector pos;
  int strtRow, strtCol, fnshCol, incX;
  float columnXpos;

  Emitter() {
    pos = new PVector();
    particles = new ArrayList<Particle>();
    // set-up raindrop column structure, columnXpos is the
    // incrementing position for all drops in each column
    columnXpos = -400;
    strtRow = -50;
    fnshCol = 200;
  }

  boolean fall() {
    pos.set(strtCol + incX, strtRow);
    incX = incX + 10;
    if (incX > fnshCol) incX = 0; 

    int randNum = int(random(1, 5));
    if (frameCount  %  randNum == 0) {
      particles.add(new Particle(pos));
    }

    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run(columnXpos);
      if (p.isDead()) {
        particles.remove(i);
      }
    }

    columnXpos += 3;
    if (columnXpos > width  ) { 
      return true;
    } else return false;
  }
}


class Particle {
  PVector pos, vel;
  float lifespan, alpha, s, r;
  boolean landed; 
  color c;

  Particle(PVector loc) {
    landed = false;
    pos = loc.get();
    vel = new PVector(0, 4);
    lifespan = 255.0;
    alpha = 150.0;
    r = random(-10, 20); // not straight rows
    s = 1;
  }

  void run(float xAlign) {
    move();
    hitGround();
    displayRain(xAlign);
    displayCloud(xAlign);
  }

  void displayCloud(float xAlign) {
    c = color(random(255), random(255), random(255));
    stroke(c);
    strokeWeight(2);
    fill(0);
    ellipse (xAlign + 100, -10, 120, 50);
    ellipse (xAlign + 150, -20, 120, 50);
    ellipse (xAlign + 50, -10, 120, 50);
  }

  void hitGround() {
    if (pos.y > 370 && !landed) {
      pos.y = 370;
      vel.y *= -1;
      vel.x = -4;
      landed = true;
    }
  }

  void move() {
    pos.add(vel);
    lifespan -= .5;
  }

  void displayRain(float xAlign) {
    noStroke();
    c = color(random(255), random(255), random(255));

    if (!landed) {
      fill(c, 255);
      for (int i = 1; i < 5; i++ ) {
        ellipse(xAlign + pos.x, r + pos.y + i*3, i*2, i*2);
      }
    } else {
      fill(c, alpha);
      ellipse(xAlign + pos.x, r+ pos.y, 12 + s, 12 + s);
      alpha -=  30;
      s += 1;
    }
  }

  boolean isDead() {
    if (lifespan < 0.0 || pos.x > width ) {
      return true;
    } else {
      return false;
    }
  }
}

class Tree {
  float theta, sze, incY, incAng, x, y;

  boolean sprout() {
    if (incY < 300) {
      incY += 2;
      //angle, size, xPos, yPos
      grow(0, 90, width/2, height + 270 - incY); 
      return false;
    } else {
      grow(0, 90, width/2, height + 270 - incY);
      return true;
    }
  }

  void unfurl() {
    if (incAng <60) {
      incAng += .2;
      grow(incAng, 90, width/2, height-30);
    } else {
      grow(incAng, 90, width/2, height-30);
    }
  }

  void grow(float t, float s, float xPos, float yPos) {
    theta = radians(t);
    sze = s;
    x = xPos;
    y = yPos;
    translate(x, y);
    branch(sze);
  }

  void branch(float len) {
    float sw = map(len, 2, 120, 1, 10);
    stroke(random(255), random(255), random(255));
    strokeWeight(sw);
    line(0, 0, 0, -len);

    if (len < 2.5) {
      fill(random(255), random(255), random(255));
      ellipse(0, 0, 10, 10);
    }

    translate(0, -len);
    len *= 0.66;
    if (len > 2) {

      pushMatrix();   
      rotate(theta);   
      branch(len);       
      popMatrix(); 

      pushMatrix();
      rotate(-theta);
      branch(len);
      popMatrix();
    }
  }
}



