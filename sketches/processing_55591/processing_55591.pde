
Bendas makhluks;

void setup() {
  size(800, 450);
  smooth();
  frameRate(30);
  colorMode(HSB, TWO_PI, 1.0, 1.0, 1.0);
  
  makhluks = new Bendas(5);
}

class Benda {
  PVector pos;
  PVector target;
  Benda targetBenda;
  
  float direction = 0;
  float distance = 0;
  float velocity = 0;
  float chue = 0;
  float size = 0;
  float phase = 0;
  
  float nextSpinTime = 0;
  float spin = 0;
  
  Benda(float xx, float yy, float vv, float hu, float sz) {
    pos = new PVector(xx, yy);
    target = new PVector(width / 2, height / 2);
    velocity = vv;
    
    chue = hu;
    size = sz;
    phase = random(0, TWO_PI);
    
    nextSpin(0);
    
    targetBenda = null;
  }
  
  void follow(float xx, float yy) {
    target.x = xx;
    target.y = yy;
  }
  
  void follow(Benda b) {
    targetBenda = b;
  }
  
  void nextSpin(float t) {
    nextSpinTime = t + random(5, 10);
    spin = random(-TWO_PI, TWO_PI);
  }
  
  void drawBody(float t) {
    fill(chue, 0.8, 0.8, 0.9);
    noStroke();
    ellipse(0, 0, size + 5 * sin(5 * t), size + 10 * cos(5 * t));
    
    fill(chue, 0.8, 1, 0.4);
    ellipse(0, 0, 0.7 * size + 10 * sin(5 * t), 0.7 * size + 5 * cos(5 * t));
  }
  
  void drawLeg(float length, float angle, float ph, float t) {
    float mo = 0.7 * sin(3 * (t - ph));
    float leftAngle = angle + mo;
    float rightAngle = PI - angle - mo;
    
    line(
      0, 0,
      length * sin(leftAngle),
      length * cos(leftAngle)
    );

    line(
      0, 0,
      length * sin(rightAngle),
      length * cos(rightAngle)
    );
  }
  
  void drawLegs(float t) {
    stroke(chue, 0.8, 0.8, 0.9);
    strokeWeight(15);
    
    drawLeg(size / 2, 0.5, 0.1, t);
    drawLeg(size / 2, 0, 0, t);
    drawLeg(size / 2, -0.5, -0.1, t);
  }
  
  void drawEyes(float t) {
    fill(0, 0, 1, 0.8);
    ellipse(3 * size / 8, 15, 20, 20);
    ellipse(3 * size / 8, -15, 20, 20);

    fill(0, 0, 0, 0.9);
    ellipse(3 * size / 8 + 5, 15, 5, 5);
    ellipse(3 * size / 8 + 5, -15, 5, 5);
  }
  
  void draw(float t) {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(direction + 0.2 * cos(t));

    drawLegs(t - phase);
    drawBody(t + phase);
    drawEyes(t);
    
    popMatrix();
  }
  
  void debugDraw(float theta, float distance, float dt) {
    println(direction +" "+ dt);

    stroke(#ff0000);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    line(0, 0, distance * cos(theta), distance * sin(theta));
    rotate(direction);
    fill(0.5, 1, 1, 0.5);
    if (dt > 0)
      arc(0, 0, 150, 150, 0, dt);
    else
      arc(0, 0, 150, 150, dt, 0);
    stroke(#ffff00);
    line(0, 0, 100, 0);
    popMatrix();
  }
  
  void calc(float t) {
    if (targetBenda != null) {
      target.x = targetBenda.pos.x;
      target.y = targetBenda.pos.y;
    }
    else {
      target.x = mouseX;
      target.y = mouseY;
    }
    
    float theta = (atan2(target.y - pos.y, target.x - pos.x) + TWO_PI) % TWO_PI;
    distance = dist(target.x, target.y, pos.x, pos.y);
    
    float z = (theta - direction + 2 * TWO_PI) % TWO_PI;
    float dt = 0;
    if (t - nextSpinTime > 0) {
      if (t - nextSpinTime < 2) {
        dt = spin * z / TWO_PI;
      }
      else {
        nextSpin(t);
      }
    }
    else
    if (z > PI) {
      dt = z - TWO_PI;
    }
    else {
      dt = z;
    }
    
    //debugDraw(theta, distance, dt);
    
    if (abs(dt) > 0.1) {
      direction = (direction + 0.1 * dt + 2 * TWO_PI) % TWO_PI;
    }

    if (distance > velocity) {
      float v = velocity * distance / width * 2 + 0.2 * cos(5 * t);
      float dir = theta + 0.7 * cos(5 * t);
      
      pos.x += v * cos(dir);
      pos.y += v * sin(dir);
    }
  }
}

class Bendas extends ArrayList<Benda> {
  Bendas(int n) {
    for (int i = 0; i < n; i++) {
      Benda b = new Benda(
        random(0, width),
        random(0, height),
        12 - 2 * i,
        random(0, TWO_PI),
        80 - 10 * i
      );
      
      if (i > 0) {
        Benda p = this.get(i - 1);
        b.follow(p);
      }
      
      this.add(b);
    }
  }
  
  void draw(float t) {
    /*for (Iterator i = iterator(); i.hasNext(); ) {
      Benda b = (Benda) i.next();
      
      b.calc(t);
      b.draw(t);
    }*/
    
    for (int i = 0; i < this.size(); i++) {
      Benda b = this.get(i);
      b.calc(t);
      b.draw(t);
    }
  }
}

void draw() {
  float t = (float) millis() / 1000;
  
  hapus(t);
  
  bubbles(t);
  makhluks.draw(t);
}

void bubbles(float t) {
  
  randomSeed(1000);
  
  noFill();
  stroke(0, 0, 1, 0.2);
  strokeWeight(1);
  for (int i = 0; i < 100; i++) {
    float h = random(0.5, 4.1);
    float h2 = random(0.5, 4.1);
    float r = random(5, 15) + 4 * cos(h * t);
    float v = random(6, 45);
    
    ellipse(
      random(0, width) + 5 * cos(h2 * (t - h)),
      height - (random(0, height) + v * t) % (height + 40) + 20,
      r, r
    );
  }
}

void hapus(float t) {
  fill(3.6, 0.6, 0.8, 0.8);
  noStroke();
  rect(0, 0, width, height);
}
