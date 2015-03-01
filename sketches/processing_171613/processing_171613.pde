
/* @pjs preload="Basic.png,CelineBag.png,IPhone.png,Kale.png,Leggings.png,RayBans.png,SoulCycle.png,Starbucks.png,Taylor.png,Tumblr.png,Uber.png,Uggs.png,Wifi.png"; */
int scl = 45; //scl
int colNum = 14;
int rowNum = 15;
int lives = 3;
int gameState = 1;
BasicBitch basicBitch;
BasicBitch[] basicBitches = new BasicBitch[5];
Basic[] basic = new Basic[15];
Bitch[] bitch = new Bitch[14];
Starbucks[] starbucks = new Starbucks[5];
Kale[] kale = new Kale[lives];

void setup() {
  size(630, 675);
  basicBitch = new BasicBitch(7*scl, 14*scl - scl/2);
  basic[0] = new Uggs(4*scl, scl*12 + scl/2);
  basic[1] = new Uggs(9*scl, scl*12 + scl/2);
  basic[2] = new Uggs(14*scl, scl*12 + scl/2);
  basic[3] = new IPhone(11*scl, scl*11 + scl/2);
  basic[4] = new IPhone(14*scl, scl*11 + scl/2);
  basic[5] = new IPhone(17*scl, scl*11 + scl/2);
  basic[6] = new IPhone(20*scl, scl*11 + scl/2);
  basic[7] = new Leggings(scl, scl*10 + scl/2);
  basic[8] = new Leggings(9*scl, scl*10 + scl/2);
  basic[9] = new Bag(2*scl, scl*9 + scl/2);
  basic[10] = new Bag(6*scl, scl*9 + scl/2);
  basic[11] = new Bag(10*scl, scl*9 + scl/2);
  basic[12] = new Bag(14*scl, scl*9 + scl/2);
  basic[13] = new SoulCycle(4*scl, scl*8 + scl/2);
  basic[14] = new SoulCycle(12*scl, scl*8 + scl/2);

  bitch[0] = new RayBans(-2*scl, scl*6 + scl/2);
  bitch[1] = new RayBans(3*scl, scl*6 + scl/2);
  bitch[2] = new RayBans(8*scl, scl*6 + scl/2);
  bitch[3] = new Tumblr(7*scl, scl*5 + scl/2);
  bitch[4] = new Tumblr(14*scl, scl*5 + scl/2);
  bitch[5] = new Wifi(3*scl, scl*4 + scl/2);
  bitch[6] = new Wifi(8*scl, scl*4 + scl/2);
  bitch[7] = new Wifi(13*scl, scl*4 + scl/2);
  bitch[8] = new Taylor(13*scl, scl*3 + scl/2);
  bitch[9] = new Taylor(18*scl, scl*3 + scl/2);
  bitch[10] = new Taylor(23*scl, scl*3 + scl/2);
  bitch[11] = new Uber(-8*scl, scl*2 + scl/2);
  bitch[12] = new Uber(-1*scl, scl*2 + scl/2);
  bitch[13] = new Uber(4*scl, scl*2 + scl/2);

  for (int i=0; i<starbucks.length; i++) {
    starbucks[i] = new Starbucks(3*i * scl + scl, 5*scl/4);
    basicBitches[i] = new BasicBitch(3*i * scl + scl, 5*scl/4);
  }
  for(int i=0; i<kale.length; i++){
    kale[i] = new Kale(1.25*i*scl + 2.5*scl, height - scl/2);
  }
}

void draw() {
  drawBackground();
  // display cars
  for (int i=0; i<basic.length; i++) {
    basic[i].display();
    basic[i].move();
    if (isHit()) {
      basicBitch.x = 7*scl;
      basicBitch.y = 14*scl - scl/2;
      lives --;
    }
  }
  //display logs
  for (int i=0; i<bitch.length; i++) {
    bitch[i].display();
    bitch[i].move();
  }

  // check for drowning
  if (overWater()) {
    basicBitch.safe = false;
    if (isFloating()) {
      basicBitch.safe = true;
    }
  }
  if (!basicBitch.safe) {
    basicBitch.x = 7*scl;
    basicBitch.y = 14*scl - scl/2;
    basicBitch.safe = true;
    lives --;
  }
  
  if(lives <= 0){
    fill(255,0,0);
    textSize(scl);
    textAlign(CENTER);
    text("YOU AIN'T BASIC!!!", width/2, 8*scl - scl/8);
  }
  else if(youWin()){
    fill(255,0,0);
    textSize(scl);
    textAlign(CENTER);
    text("YOU IS BASIC!!!", width/2, 8*scl - scl/8);
  }
  
  //main bitch display
  basicBitch.display();
}


void drawBackground() {
  background(0);
  rectMode(CORNER);
  strokeWeight(1);
  stroke(0);
  //bottom
  fill(50);
  rect(0, height-scl, width, scl);
  textAlign(LEFT);
  textSize(scl/2);
  fill(15);
  text("Lives: ", scl/2, height - scl/4);
  for(int i=0; i<lives; i++){
    kale[i].display();
  }
  // starting section
  fill(100);
  rect(0, height-2*scl, width, scl);
  // street lines
  for (float x = scl*.75; x < width; x += scl*2) {
    for (int y = scl*9; y < scl*13; y += scl) {
      stroke(255, 255, 0);
      line(x, y, x+scl/2, y);
    }
  }
  stroke(0);
  //middle safe zone
  fill(150);
  rect(0, height/2 - scl/2, width, scl);
  // water
  fill(-16515017);
  rect(0, 2*scl, width, scl*5);
  // lily pads
  fill(0,112,66);
  rect(0, 0, width, 2*scl);
  for (int i=0; i < 5; i++) {
    int x = 3*i * scl + scl/4;
    fill(85,51,0);
    stroke(85,51,0);
    rect(x, scl/2, scl*1.5, 1.5*scl);
  }
  //starbucks
  for (int i=0; i<starbucks.length; i++) {
    if (!starbucks[i].occupied) {
      starbucks[i].display();
    }
    else {
      basicBitches[i].display();
    }
  }
}



boolean isHit() {
  for (int i=0; i<basic.length; i++) {
    if (abs(basicBitch.y - basic[i].y) < basic[i].h/2) {
      if (abs(basicBitch.x - basic[i].x) < basic[i].w/2) {
        return true;
      }
    }
  }
  return false;
}

boolean overWater() {
  if (abs(basicBitch.y) <= 7*scl) {
    return true;
  }
  return false;
}

boolean isFloating() {
  for (int i=0; i<bitch.length; i++) {
    if (abs(basicBitch.y - bitch[i].y) <= bitch[i].h/2) {
      if (abs(basicBitch.x - bitch[i].x) <= bitch[i].w/2) {
        basicBitch.x += bitch[i].speed;
        return true;
      }
    }
  }
  return false;
}

boolean youWin(){
  int all = 0;
  for(int i=0; i<starbucks.length; i++){
    if(starbucks[i].occupied){
      all ++;
      if(all == 5){
        return true;
      }
    }
  }
  return false;
}
class BasicBitch {
  int x, y, w, h;
  PImage pic;
  boolean safe;
  float speed;
  BasicBitch(int nx, int ny) {
    x = nx;
    y = ny;
    w = scl;
    h = scl;
    pic = loadImage("Basic.png");
    safe = true;
    speed = 0;
  }

  void display() {
    imageMode(CENTER);
    pic.resize(w, h);
    image(pic, x, y);
  }

  void move() {
    x += speed;
  }
}

void keyPressed() {
  if (keyCode == UP) basicBitch.y -= scl;
  if (keyCode == DOWN) basicBitch.y += scl;
  if (keyCode == RIGHT) basicBitch.x += scl;
  if (keyCode == LEFT) basicBitch.x -= scl;
}

//street classes

class Basic {
  int x, y;
  int w, h;
  float speed;
  int offset;
  PImage pic;
  Basic (int nx, int ny) {
    x = nx;
    y = ny;
    w = scl;
    h = scl;
  }

  void display() {
    pic.resize(w, h);
    image(pic, x, y);
  }

  void move() {
    x += speed;
    if (speed > 0 && x > width) x = -1*offset*scl;
    else if ( speed < 0 && x < 0) x = offset*scl + width;
  }
}



class Uggs extends Basic {
  Uggs(int nx, int ny) {
    super(nx, ny);
    w = scl - 10;
    speed = 3;
    offset = 4;
    pic = loadImage("Uggs.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class Leggings extends Basic {

  Leggings(int nx, int ny) {
    super(nx, ny);
    w = 3*scl;
    h = scl;
    speed = 2.5;
    offset = 3;
    pic = loadImage("Leggings.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class IPhone extends Basic {
  IPhone(int nx, int ny) {
    super(nx, ny);
    w = scl/2;
    speed = -2;
    offset = 5;
    pic = loadImage("IPhone.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class Bag extends Basic {

  Bag(int nx, int ny) {
    super(nx, ny);
    w = scl;
    speed = -3;
    offset = 8;
    pic = loadImage("CelineBag.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class SoulCycle extends Basic {
  SoulCycle(int nx, int ny) {
    super(nx, ny);
    w = 2*scl;
    speed = 3.5;
    offset = 4;
    pic = loadImage("SoulCycle.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

//water classes

class Bitch {
  int x, y;
  int w, h;
  float speed;
  int offset;
  PImage pic;

  Bitch(int nx, int ny) {
    x = nx;
    y = ny;
    w = scl;
    h = scl;
  }

  void display() {
    imageMode(CENTER);
    pic.resize(w, h);
    image(pic, x, y);
  }

  void move() {
    x += speed;
    if (speed > 0 && x > width) x = -10*scl;
    else if ( speed < 0 && x < 0) x = 10*scl + width;
  }

  boolean isFloating() {
    if (abs(basicBitch.y - y) < h/2 
      && abs(basicBitch.x - x) < w/2) {
      basicBitch.x += speed;
      println("bitch");
      return true;
    }
    return false;
  }
}

class RayBans extends Bitch {

  RayBans(int nx, int ny) {
    super(nx, ny);
    w = 3*scl;
    speed = 3.5;
    offset = 10;
    pic = loadImage("RayBans.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class Tumblr extends Bitch {
  Tumblr(int nx, int ny) {
    super(nx, ny);
    w = 4*scl;
    speed = -3;
    offset = 8;
    pic = loadImage("Tumblr.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class Wifi extends Bitch {

  Wifi(int nx, int ny) {
    super(nx, ny);
    w = 3*scl;
    speed = 2.5;
    offset = 6;
    pic = loadImage("Wifi.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}


class Taylor extends Bitch {

  Taylor(int nx, int ny) {
    super(nx, ny);
    w = 3*scl;
    speed = -3.5;
    offset = 10;
    pic = loadImage("Taylor.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

class Uber extends Bitch {

  Uber(int nx, int ny) {
    super(nx, ny);
    w = 3*scl;
    speed = 2.5;
    offset = 8;
    pic = loadImage("Uber.png");
  }

  void display() {
    super.display();
  }

  void move() {
    super.move();
  }
}

//starbucks

class Starbucks {
  int x, y;
  int w, h;
  PImage pic;
  boolean occupied;
  Starbucks(int nx, int ny) {
    x = nx;
    y = ny;
    w = scl;
    h = scl + scl/2;
    pic = loadImage("Starbucks.png");
    occupied = false;
  }

  void display() {
    isOccupied();
    if (!occupied) {
      imageMode(CENTER);
      pic.resize(w, h);
      image(pic, x, y);
    } 
    else {
      image(basicBitch.pic, x, y);
    }
  }

  void isOccupied() {
    if (abs(basicBitch.y - y) <= h/2) {
      if (abs(basicBitch.x - x) <= w/2) {
        occupied = true;
        basicBitch.x = 7*scl;
        basicBitch.y = 14*scl - scl/2;
      }
    }
  }
}

class Kale {
  float x, y;
  int w, h;
  PImage pic;

  Kale(float nx, float ny) {
    x = nx;
    y = ny;
    w = scl;
    h = scl;
    pic = loadImage("Kale.png");
  }

  void display() {
    imageMode(CENTER);
    pic.resize(w, h);
    image(pic, x, y);
  }
}



