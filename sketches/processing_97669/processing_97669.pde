
// quanta game
ArrayList<box> boxes = new ArrayList<box>();
ArrayList<bullet> bullets = new ArrayList<bullet>();
PVector gravity;
float spd = 0.4;
float spd2 = 0.2;
boolean[] keys = new boolean[256];

box player;
float shotTime, shotDelay;
int num = 1;

// setup
void setup() {
  size(440,440);
  smooth();
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  for(int i = 0; i < 1; i++) {
    box b = new box(width/2, height/2, 200, 200);
    boxes.add(b);
  }
  gravity = new PVector(0,0.0);
  player = new box(width/2, height - 60, 12, 12);
  shotTime = 0.0;
  shotDelay = 200.0;
}


// draw
void draw() {
  background(255);
  text(str(num),width/2,20);
  
  for(box b1 : boxes) {
    b1.update();
    for(box b2 : boxes) {
      if(b1.pos.x != b2.pos.x || b1.pos.y != b2.pos.y) collide(b1, b2);
    }
  }
  for(box b1 : boxes) {
    b1.draw();
  }

  for(bullet b : bullets) {
    b.update();
    b.draw();
  }
  
  control();
  player.update();
  player.draw();
  for(box b : boxes) {
    if(collide(player, b)) {
//      player.wdth -= 3.0;
//      player.hght -= 3.0;
      reset();
    }
  }
  if(player.wdth < 6.0) reset();
  
  if(num < 2) {
    textAlign(LEFT, CENTER);
    text("WASD", 10, height-20);
    textAlign(RIGHT, CENTER);
    text("Arrows", width-10,height-20);
  }
}


// box splitx
void splitx(box b, float x) {
  float dx = b.pos.x - x;
  if(abs(dx) < b.wdth*0.5 && b.wdth > 10.0) {
    float w1 = 0.5*b.wdth - dx;
    float w2 = b.wdth - w1;
    float h1 = b.hght;
    float h2 = b.hght;
    float x1 = b.pos.x - b.wdth*0.5 + w1*0.5;
    float x2 = b.pos.x + b.wdth*0.5 - w2*0.5;
    float y1 = b.pos.y;
    float y2 = b.pos.y;
    // vel
    PVector v = PVector.sub(b.pos, b.opos);
    // change
    b.pos = new PVector(x1,y1);
    b.wdth = w1;
    b.hght = h1;
    b.opos = PVector.sub(b.pos, v);
    b.opos.x += spd;
    b.opos.y += random(-spd2,spd2);
    // add
    box b2 = new box(x2, y2, w2, h2);
    b2.opos = PVector.sub(b2.pos, v);
    b2.opos.x -= spd;
    b2.opos.y += random(-spd2,spd2);
    boxes.add(b2);
    num++;
  }
}

void splity(box b, float y) {
  float dy = b.pos.y - y;
  if(abs(dy) < b.hght*0.5 && b.hght > 10.0) {
    float h1 = 0.5*b.hght - dy;
    float h2 = b.hght - h1;
    float w1 = b.wdth;
    float w2 = b.wdth;
    float y1 = b.pos.y - b.hght*0.5 + h1*0.5;
    float y2 = b.pos.y + b.hght*0.5 - h2*0.5;
    float x1 = b.pos.x;
    float x2 = b.pos.x;
    // vel
    PVector v = PVector.sub(b.pos, b.opos);
    // change
    b.pos = new PVector(x1,y1);
    b.wdth = w1;
    b.hght = h1;
    b.opos = PVector.sub(b.pos, v);
    b.opos.y += spd;
    b.opos.x += random(-spd2,spd2);
    // add
    box b2 = new box(x2, y2, w2, h2);
    b2.opos = PVector.sub(b2.pos, v);
    b2.opos.y -= spd;
    b2.opos.x += random(-spd2,spd2);
    boxes.add(b2);
    //
    num++;
  }
}


// box collision
boolean collide(box b1, box b2) {
  PVector d = PVector.sub(b2.pos, b1.pos);
  float dw = abs(d.x) - 0.5*(b1.wdth + b2.wdth);
  float dh = abs(d.y) - 0.5*(b1.hght + b2.hght);
  PVector dif = new PVector();
  if(dw < 0 && dh < 0) dif = new PVector(dw*d.x/abs(d.x),0);
  if(dh < 0 && dw < 0 && abs(dh) < abs(dw)) dif = new PVector(0,dh*d.y/abs(d.y));
  if(dif.mag() > 0) {
    float ratio = b1.area() / (b1.area() + b2.area());
    ratio = constrain(ratio, 0.2, 0.8);
    b1.pos.add(PVector.mult(dif, 2*(1-ratio)));
    b2.pos.sub(PVector.mult(dif, 2*ratio));
    return true;
  }
  return false;
}


// kesy
void keyPressed() {
  if(keyCode < 256) keys[keyCode] = true;
}

void keyReleased() {
  if(keyCode < 256) keys[keyCode] = false;
}


// player control
void control() {
  float f = 0.2;
  if(keys[37]) player.frc.x -= f;
  if(keys[39]) player.frc.x += f;
  if(keys[38]) player.frc.y -= f;
  if(keys[40]) player.frc.y += f;
  if(millis() - shotTime > shotDelay) {
    float bs = 4.0;
    if(keys[87]) {
      bullet b = new bullet(player.pos.x, player.pos.y, 0, -bs);
      bullets.add(b);
      shotTime = millis();
    }
    if(keys[83]) {
      bullet b = new bullet(player.pos.x, player.pos.y, 0, bs);
      bullets.add(b);
      shotTime = millis();
    }
    if(keys[65]) {
      bullet b = new bullet(player.pos.x, player.pos.y, -bs, 0.0);
      bullets.add(b);
      shotTime = millis();
    }
    if(keys[68]) {
      bullet b = new bullet(player.pos.x, player.pos.y, bs, 0.0);
      bullets.add(b);
      shotTime = millis();
    }
  }
  PVector v = PVector.sub(player.pos, player.opos);
  v.mult(-0.05);
  player.frc.add(v);
}


// reset game
void reset() {
  boxes = new ArrayList<box>();
  bullets = new ArrayList<bullet>();
  for(int i = 0; i < 1; i++) {
    box b = new box(width/2, height/2, 200, 200);
    boxes.add(b);
  }
  gravity = new PVector(0,0.0);
  player = new box(width/2, height - 60, 12, 12);
  shotTime = 0.0;
  shotDelay = 200.0;
  num = 1;
}


// box class
class box {
  PVector pos, opos, frc;
  float wdth, hght;
  
  box(float x, float y, float w, float h) {
    pos = new PVector(x,y);
    opos = new PVector(x+random(-0,0),y+random(-0,0));
    frc = new PVector();
    wdth = w;
    hght = h;
  }
  
  void update() {
    frc.add(gravity);
    PVector cpos = pos.get();
    pos.x = constrain(pos.x, 0+wdth/2, width-wdth/2);
    pos.y = constrain(pos.y, 0+hght/2, height-hght/2);
    pos.add(PVector.add(PVector.mult(PVector.sub(cpos,opos),1.0), frc));
    opos = cpos.get();
    frc = new PVector();
  }
  
  void draw() {
    noStroke();
    fill(0,150);
    rect(pos.x, pos.y, wdth, hght);
  }
  
  float area() {
    return wdth*hght;
  }
  
};


// player class



// bullet class
class bullet {
  PVector pos, vel;
  boolean kill;
  
  bullet(float x, float y, float vx, float vy) {
    pos = new PVector(x,y);
    vel = new PVector(vx,vy);
    kill = false;
  }
  
  void update() {
    if(!kill) {
      pos.add(vel);
      for(box b : boxes) {
        PVector d = PVector.sub(b.pos, pos);
        if(abs(d.x) < b.wdth*0.5 && abs(d.y) < b.hght*0.5) {
          float dx = b.wdth*0.5 - abs(d.x);
          float dy = b.hght*0.5 - abs(d.y);
          kill = true;
          if(abs(dy) < abs(dx)) {
            splitx(b, pos.x);
          } else {
            splity(b, pos.y);
          }
          break;
        }
      }
    }
  }
  
  void draw() {
    if(!kill) rect(pos.x, pos.y, 4.0, 4.0);
  }
  
};
