
int score, jesusChrist;
ArrayList<Asteroid> rocks;
ArrayList<Laser> pewpew;
SpaceShip mercury;

boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
void setup() {
  size(512, 512);
  noFill();
  frameRate(30);
  colorMode(HSB);
  
  score = 0;
  jesusChrist = 0;
  rocks = new ArrayList<Asteroid>();
  for (int i = 0; i < 1; i++) {
    rocks.add(new Asteroid(random(0, width), 0, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
    rocks.add(new Asteroid(random(0, width), height, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
    rocks.add(new Asteroid(0, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
    rocks.add(new Asteroid(width, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
  }
  pewpew = new ArrayList<Laser>();
  mercury = new SpaceShip();
  
}

void draw() {
  
  background(0);
  
  mercury.display();
  mercury.tick();
  
  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();
    
    if(dist(rock.x, rock.y, mercury.x, mercury.y) < rock.s+mercury.s){
      textSize(64);
      fill(255);
      text("YOU SUCK", width/2-160, height/2);
      textSize(32);
      text("'R' to retry, idiot...", width/2-160, height/2+32);
      noLoop();
    }
    
    for (int j = 0; j < pewpew.size(); j++){
      Laser pew = pewpew.get(j);
      rock.collision(pew, i, j);
    }
  }
  
  for (int j = 0; j < pewpew.size(); j++){
    Laser pew = pewpew.get(j);
    pew.offScreen(j);
    pew.display();
    pew.tick();
  }
  
  textSize(34);
  fill(150, 255, 255);
  text("Score:" + score, 8, 32);
  
  if (keyup == true) mercury.accelerate();
  if (keyleft == true) mercury.r -= 0.1;
  if (keyright == true) mercury.r += 0.1;
  mercury.v*=0.98;
} 

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) keyup = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true;
  }
  if (key == ' ') mercury.shoot();
  if (key == 'r'){
    rocks.clear();
    pewpew.clear();
    mercury.launch();
    score = 0;
    jesusChrist = 0;
    for (int i = 0; i < 1; i++) {
      rocks.add(new Asteroid(random(0, width), 0, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
      rocks.add(new Asteroid(random(0, width), height, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
      rocks.add(new Asteroid(0, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
      rocks.add(new Asteroid(width, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
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
}
class Asteroid extends Object {
  float[] vertx = new float[16];
  float[] verty = new float[16];
  Asteroid(float x, float y, float a, float v, float w, float s) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = 0;
    this.w = w;
    this.s = s;
    for (int i = 0; i < 16; i++) {
      vertx[i] = sin(i*PI/8)*(s + random(-s/4, s/4));
      verty[i] = cos(i*PI/8)*(s + random(-s/4, s/4));
    }
  }

  void show() {
    noFill();
    stroke(255);
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
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s ||
        dist(this.x+width, height-this.y, thing.x, thing.y) < this.s+thing.s ||
        dist(this.x-width, height-this.y, thing.x, thing.y) < this.s+thing.s ||
        dist(width-this.x, this.y+height, thing.x, thing.y) < this.s+thing.s ||
        dist(width-this.x, this.y-height, thing.x, thing.y) < this.s+thing.s) {
      score++;
      pewpew.remove(j);
      if (s>4){
        rocks.add(new Asteroid(x, y, a-PI/8, v*2, w*2, s/2));
        rocks.add(new Asteroid(x, y, a+PI/8, v*2, w*2, s/2));
      }
      jesusChrist++;
      if(jesusChrist == 4){
        jesusChrist = 0;
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32));
      }
      rocks.remove(i);
    }
  }
}
class Laser extends Object {
  Laser(float x, float y, float a, float r) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = 12;
    this.r = r;
    this.w = 0;
    this.s = 4;
  }

  void show() {
    noFill();
    stroke(0, 255, 255);
    strokeWeight(3);
    rotate(r);
    beginShape();
    vertex(0, 4);
    vertex(0, -4);
    endShape();
    rotate(-r);
  }

  void offScreen(int j) {
    if (x > width-v || x < 0+v || y > height-v || y < 0+v) pewpew.remove(j);
  }
}
abstract class Object {
  float x, y, a, v, r, w, s;

  void tick() {
    r += w;
    x += cos(a)*v;
    y += sin(a)*v;
    
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
  SpaceShip() {
    this.launch();
  }

  void show() {
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
  
  void launch(){
    this.x = width/2;
    this.y = height/2;
    this.a = 0;
    this.v = 0;
    this.r = 0;
    this.w = 0;
    this.s = 12;
  }
  
  void accelerate() {
    float xt = cos(a)*v+cos(r+PI/2)*.1;
    float yt = sin(a)*v+sin(r+PI/2)*.1;
    v=sqrt(sq(yt)+sq(xt));
    a=atan2(yt, xt);
  }

  void shoot() {
    if(pewpew.size() < 8){
      pewpew.add(new Laser(x, y, r+PI/2, r));
    }
  }
}


