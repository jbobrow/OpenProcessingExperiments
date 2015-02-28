
int score;
ArrayList<Asteroid> rocks;
ArrayList<Laser> pewpew;
ArrayList<JesusChrist> helpme;
SpaceShip mercury;

boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keyshoot = false;
void setup() {
  size(768, 768);
  noFill();
  frameRate(30);
  colorMode(HSB);

  score = 0;
  rocks = new ArrayList<Asteroid>();
  pewpew = new ArrayList<Laser>();
  helpme = new ArrayList<JesusChrist>();
  mercury = new SpaceShip();
  for (int i = 0; i < 1; i++) {
    rocks.add(new Asteroid(random(0, width), 0, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    rocks.add(new Asteroid(random(0, width), height, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    rocks.add(new Asteroid(0, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    rocks.add(new Asteroid(width, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
  }
}

void draw() {

  background(0);

  mercury.display();
  mercury.tick();

  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();

    if (dist(rock.x, rock.y, mercury.x, mercury.y) < rock.s+mercury.s) {
      textSize(64);
      fill(255);
      text("YOU SUCK", width/2-160, height/2);
      textSize(32);
      text("'R' to retry, idiot...", width/2-160, height/2+32);
      noLoop();
    }

    for (int j = 0; j < pewpew.size(); j++) {
      Laser pew = pewpew.get(j);
      rock.collision(pew, i, j);
    }
  }

  for (int j = 0; j < pewpew.size(); j++) {
    Laser pew = pewpew.get(j);
    pew.offScreen(j);
    pew.display();
    pew.tick();
  }
  
  for (int i = 0; i < helpme.size(); i++) {
    JesusChrist omfg = helpme.get(i);
    omfg.display();
    omfg.tick();
    omfg.collision(mercury, i);
  }
    
  textSize(34);
  fill(150, 255, 255);
  text("Score:" + score, 8, 32);

  if (keyup == true) mercury.accelerate();
  if (keyleft == true) mercury.r -= 0.1;
  if (keyright == true) mercury.r += 0.1;
  if (keyshoot == true) mercury.shoot();
  mercury.v*=0.98;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) keyup = true;
    if (keyCode == LEFT) keyleft = true;
    if (keyCode == RIGHT) keyright = true;
  }
  if (key == ' ') keyshoot = true;
  if (key == 'r') {
    rocks.clear();
    pewpew.clear();
    helpme.clear();
    mercury.launch();
    score = 0;
    for (int i = 0; i < 1; i++) {
      rocks.add(new Asteroid(random(0, width), 0, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      rocks.add(new Asteroid(random(0, width), height, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      rocks.add(new Asteroid(0, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      rocks.add(new Asteroid(width, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    }
    loop();
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false;
    if (keyCode == LEFT) keyleft = false;
    if (keyCode == RIGHT) keyright = false;
  }
  if (key == ' ') keyshoot = false;
}

class Asteroid extends Object {
  float[] vertx = new float[16];
  float[] verty = new float[16];
  Asteroid(float x, float y, float a, float v, float w, float s, int c) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = 0;
    this.w = w;
    this.s = s;
    this.c = c;
    for (int i = 0; i < 16; i++) {
      vertx[i] = sin(i*PI/8)*(s + random(-s/4, s/4));
      verty[i] = cos(i*PI/8)*(s + random(-s/4, s/4));
    }
  }

  void show() {
    noFill();
    switch(c) {
    case 0: 
      stroke(255);
      break;
    case 1: 
      stroke(32, 255, 255);
      break;
    case 2: 
      stroke(192, 255, 255);
      break;
    }

    strokeWeight(1);
    rotate(r);
    beginShape();
    for (int i = 0; i < 16; i++) {
      vertex(vertx[i], verty[i]);
    }
    vertex(vertx[0], verty[0]);
    endShape();
    rotate(-r);
  }

  void collision(Object thing, int i, int j) {
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s) {
      score++;
      pewpew.remove(j);
      if (random(0, 64) < 2) {
        if (random(0, 64) < 16) {
          helpme.add(new JesusChrist(x, y, -2));
        }
        else {
          if (random(0, 48) < 16) {
            helpme.add(new JesusChrist(x, y, -3));
          }
          else {
            if (random(0, 32) < 16) {
              helpme.add(new JesusChrist(x, y, -4));
            }
            else {
              helpme.add(new JesusChrist(x, y, -5));
            }
          }
        }
      }
      if (s>4) {
        switch(c) {
        case 0: 
          rocks.add(new Asteroid(x, y, a-PI/8, v*1.6, w*2, s/2, c));
          rocks.add(new Asteroid(x, y, a+PI/8, v*1.6, w*2, s/2, c));
          break;
        case 1: 
          rocks.add(new Asteroid(x, y, a-PI/4, v*1.3, w*2, s/2, c));
          rocks.add(new Asteroid(x, y, a+PI/4, v*1.3, w*2, s/2, c));
          break;
        case 2: 
          rocks.add(new Asteroid(x, y, w, random(.6, .8), w*2, s/2, 0));
          rocks.add(new Asteroid(x, y, w+PI/2, random(.6, .8), w*2, s/2, 0));
          rocks.add(new Asteroid(x, y, w+PI, random(.6, .8), w*2, s/2, 0));
          rocks.add(new Asteroid(x, y, w-PI/2, random(.6, .8), w*2, s/2, 0));
          rocks.add(new Asteroid(x, y, 0, 0, w*2, s/1.5, c));
          break;
        }
      }
      if (score%12 == 0) {
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      }
      if (score%20 == 0) {
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), random(-PI, PI), random(0.6, 0.8), random(-PI/100, PI/100), 24, 1));
      }
      if (score%42 == 0) {
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), 0, 0, random(-PI/50, PI/50), 48, 2));
      }
      rocks.remove(i);
    }
  }
}

class JesusChrist extends Object {
  JesusChrist(float x, float y, int c) {
    this.x = x;
    this.y = y;
    this.a = random(0, 2*PI);
    this.v = 1;
    this.r = 0;
    this.w = 0;
    this.s = 8;
    this.c = c;
  }

  void show() {
    noFill();
    switch(c) {
    case -2:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(32, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, 6, -6);
      break;
    case -3:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(64, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, 6, -6);
      line(0, 6, 0, -6);
      break;
    case -4:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(1);
      stroke(128, 255, 255);
      line(0, 6, 0, -6);
      line(6, 0, -6, 0);
      line(-6, 6, 6, -6);
      line(-6, -6, 6, 6);
      break;
    case -5:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(96, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, -3, -6);
      line(0, 6, 0, -6);
      line(0, 6, 3, -6);
      line(0, 6, 6, -6);
      break;
    }
  }

  void collision(SpaceShip thing, int i) {
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s) {
      helpme.remove(i);
      switch(c) {
      case -2: 
        thing.c = -2;
        thing.f = 8;
        break;
      case -3: 
        thing.c = -3;
        thing.f = 12;
        break;
      case -4:
        for(i = 0; i < 32; i++){
          pewpew.add(new Laser(thing.x, thing.y, thing.r+PI/2+i*PI/16, 24, thing.r+i*PI/16, -4));
        }
        break;
      case -5: 
        thing.c = -5;
        thing.f = 6;
        break;
      }
    }
  }
}

class Laser extends Object {
  int e;
  Laser(float x, float y, float a, float v, float r, int c) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = r;
    this.w = 0;
    this.s = 4;
    this.c = c;
    this.e = 0;
  }

  void show() {
    noFill();
    switch(c) {
    case -1: 
      stroke(0, 255, 255, 255 - e*5);
      break;
    case -2: 
      stroke(32, 255, 255 - e*5);
      break;
    case -3: 
      stroke(64, 255, 255 - e*5);
      break;
    case -4: 
      stroke(128, 255, 255 - e*5);
      break;
    case -5: 
      stroke(96, 255, 255 - e*5);
      break;
    }
    strokeWeight(3);
    rotate(r);
    beginShape();
    vertex(0, 4);
    vertex(0, -4);
    endShape();
    rotate(-r);
  }

  void offScreen(int j) {
    e++;
    if (e == 30) pewpew.remove(j);
  }
}

abstract class Object {
  float x, y, a, v, r, w, s;
  int c;

  void tick() {
    if (x<0) {
      x += width;
      y = height-y;
    }
    if (x>width) {
      x -= width;
      y = height-y;
    }
    if (y<0) {
      y += height;
      x = width-x;
    }
    if (y>height) {
      y -= height;
      x = width-x;
    }

    r += w;
    x += cos(a)*v;
    y += sin(a)*v;

    switch(c) {
    case 0:
      break;
    case 1: 
      if (abs(atan2(mercury.y-y, mercury.x-x) - a) < PI) {
        if (atan2(mercury.y-y, mercury.x-x) > a) {
          a += 0.04;
        }
        else {
          a -= 0.04;
        }
      }
      else {
        if (atan2(mercury.y-y, mercury.x-x) > a) {
          a -= 0.04;
        }
        else {
          a += 0.04;
        }
      }
      if (a < -PI) {
        a = PI+a;
      }
      if (a > PI) {
        a = -PI+a;
      }
      break;
    case 2:
      break;
    }
  }

  void show() {
  }

  void display() {
    translate(x, y);
    show();
    translate(-x, -y);

    if (x < 1.25*s) {
      translate(x+width, height-y);
      show();
      translate(-x-width, y-height);
    }

    if (x > width-1.25*s) {
      translate(x-width, height-y);
      show();
      translate(-x+width, y-height);
    }

    if (y < 1.25*s) {
      translate(width-x, y+height);
      show();
      translate(x-width, -y-height);
    }

    if (y > height-1.25*s) {
      translate(width-x, y-height);
      show();
      translate(x-width, -y+height);
    }
  }
}

class SpaceShip extends Object {
  int d, l, f, n;
  SpaceShip() {
    this.launch();
  }

  void show() {
    if(d > 0){
      d--;
    }
    noFill();
    stroke(75, 255, 255);
    strokeWeight(1);
    rotate(r);
    beginShape();
    vertex(0, 16);
    vertex(8, -16);
    vertex(-8, -16);
    vertex(0, 16);
    endShape();
    rotate(-r);
  }

  void launch() {
    this.x = width/2;
    this.y = height/2;
    this.a = 0;
    this.v = 0;
    this.r = 0;
    this.w = 0;
    this.s = 12;
    this.c = -1;
    this.d = 0;
    this.f = 8;
    this.n = 0;
  }

  void accelerate() {
    float xt = cos(a)*v+cos(r+PI/2)*.1;
    float yt = sin(a)*v+sin(r+PI/2)*.1;
    v=sqrt(sq(yt)+sq(xt));
    a=atan2(yt, xt);
  }

  void shoot() {
    if (d == 0) {
      switch(c){
      case -1:
        pewpew.add(new Laser(x, y, r+PI/2, 10, r, -1));
        break;
      case -2:
        pewpew.add(new Laser(x, y, r+PI/2-PI/16, 12, r-PI/16, -2));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16, 12, r+PI/16, -2));
        break;
      case -3:
        pewpew.add(new Laser(x, y, r+PI/2-PI/16, 18, r-PI/32, -3));
        pewpew.add(new Laser(x, y, r+PI/2, 18, r, -3));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16, 18, r+PI/32, -3));
        break;
      case -5:
        pewpew.add(new Laser(x, y, r+PI/2-PI/8, 6, r-PI/8, -5));
        pewpew.add(new Laser(x, y, r+PI/2-PI/16, 6, r-PI/16, -5));
        pewpew.add(new Laser(x, y, r+PI/2, 6, r, -5));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16, 6, r+PI/16, -5));
        pewpew.add(new Laser(x, y, r+PI/2+PI/8, 6, r+PI/8, -5));
        break;
      }
      d = f;
    }
  }
}



