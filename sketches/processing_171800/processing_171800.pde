
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139109*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Car[] cars1 = new Car[5];
Car[] cars2 = new Car[5];
Bus[] bus1 = new Bus[4];
Bus[] bus2 = new Bus[4];
Turtle[] turtle = new Turtle[3];
Turtle[] turtle2 = new Turtle[3];
Turtle[] turtle3 = new Turtle[3];
Turtle[] turtle4 = new Turtle[3];
Log[] log1 = new Log[5];
Log[] log2 = new Log[5];
Pad[] pad = new Pad[5];
int[] tally = new int[5];
int deathTally;
int cheat;
Frog froggy;
Background bk;
boolean alive = true;
PImage alan;


void setup() {
  size(1000, 600);
  noCursor();
  frameRate(50);
  smooth();
  //cars
  int x = 0;
  int xb = 0;
  int y = height -75;
  int s = 2;
  alan = loadImage("http://s24.postimg.org/80il5cg4l/alan.png");
  

  
  for (int i = 0; i < 5; i++) {
    cars1[i] = new Car(color(random(255), random(255), random(255)), x, y, s);
    cars2[i] = new Car(color(random(255), random(255), random(255)), x, y-100, s+2);
    x += 220;
  }
  x -= 200;
  y = 375;
  for (int i = 0; i < 3; i++) {
    turtle[i] = new Turtle(x-50, y-100, s);
    turtle2[i] = new Turtle(x-600, y-100, s);
    turtle3[i] = new Turtle(x+400, 175, s+.5);
    turtle4[i] = new Turtle(x+50, 175, s+.5);
    x += 50;
  }
  for (int i = 0; i < 4; i++) {
    bus2[i] = new Bus(color(random(255), random(255), random(255)), xb+45, height-225, s-.3);
    bus1[i] = new Bus(color(random(255), random(255), random(255)), xb, height-125, s+1.7);
    xb +=280;
  }
  int xl = 0;

  for (int i = 0; i < 5; i++) {
    //logs
    log1[i] = new Log(xl, height-475, 3, 180);
    log2[i] = new Log(xl+100, height-375, 3, 180);
    xl += 280;
  }
  //landing pads
  x = 100;
  for (int i = 0; i <5; i++) {
    pad[i] = new Pad(x, color(#20C932));
    tally[i] = 0;
    x += 200;
  }
  //frog
  froggy = new Frog(width/2, height-25);


  //background
  bk =  new Background(width/2, 200);
}
void keyPressed() {
  froggy.keyTyped();
  
//press SPACEBAR to reset Lives (does not work if you lose all lives)
  if (key == ' ') {
    cheat = 0;
    loop();
    deathTally = 0;
  }
  if (key == '['){
   cheat = 9; 
  }
}

void draw() {
  background(0);
  //background display
  bk.display();
  

 
  
  textSize (15);
  fill(234, 17, 17);
  text("Alan's Adventure!!", 400, 20, 800, 300);
  fill(234, 17, 17);
  
  
  image(alan, 160, 10, 100, 100);
  image(alan, 750, 10, 100, 100);

  //car function call
  for (int i = 0; i < 5; i++) {
    cars1[i].drive();
    cars1[i].display();
    cars2[i].drive();
    cars2[i].display();
    //car hit test
    if (cars1[i].hitTest(froggy.xpos, froggy.ypos) || cars2[i].hitTest(froggy.xpos, froggy.ypos)) {
      alive = false;
    }
  }
  //bus
  for (int i = 0; i < 4; i++) {
    bus1[i].drive();
    bus1[i].display();
    bus2[i].drive();
    bus2[i].display();
    if (bus1[i].hitTest(froggy.xpos, froggy.ypos) || bus2[i].hitTest(froggy.xpos, froggy.ypos)) {
      alive = false;
    }
  }
  //turtle function call
  for (int i = 0; i < 3; i++) {
    turtle[i].swim();
    turtle[i].display();
    turtle2[i].swim();
    turtle2[i].display();
    turtle3[i].swim();
    turtle3[i].display();
    turtle4[i].swim();
    turtle4[i].display();
  }

  if (froggy.ypos <height/2) {
    alive = false;
    for (int g = 0; g < 3; g++) { 
      if (turtle[g].hitTest(froggy.xpos, froggy.ypos) || turtle2[g].hitTest(froggy.xpos, froggy.ypos)) {
        alive = true;
        froggy.xpos -= turtle[g].xspeed;
        break;
      }
    }
  }
  if (froggy.ypos < height/2-50) {
    alive = false;
    for (int g = 0; g < 5; g++) { 
      if (log2[g].hitTest(froggy.xpos, froggy.ypos)) {
        alive = true;
        froggy.xpos += log2[g].xspeed;
        break;
      }
    }
  }

  if (froggy.ypos <height/2-100) {
    alive = false;
    for (int g = 0; g < 3; g++) { 
      if (turtle3[g].hitTest(froggy.xpos, froggy.ypos) || turtle4[g].hitTest(froggy.xpos, froggy.ypos)) {
        alive = true;
        froggy.xpos -= turtle3[g].xspeed;
        break;
      }
    }
  }
  if (froggy.ypos < height/2-150) {
    alive = false;
    for (int g = 0; g < 5; g++) { 
      if (log1[g].hitTest(froggy.xpos, froggy.ypos)) {
        alive = true;
        froggy.xpos += log1[g].xspeed;
        break;
      }
    }
  }

  for (int i = 0; i < 5; i++) {
    //logs
    log1[i].move();
    log1[i].display();
    log2[i].move();
    log2[i].display();
    pad[i].display();
  }
  if (froggy.ypos < height/2-200) {
    alive = false;
    for (int g = 0; g < 5; g++) { 
      if (pad[g].hitTest(froggy.xpos, froggy.ypos)) {
        tally[g] = 1;
        lives(pad[g].xpos, 75);
        froggy.xpos = width/2;
        froggy.ypos = height/2;
        deathTally -=1;
        break;
      }
    }
  }

  froggy.display();

  //frog out of bounds safety check
  if (froggy.ypos >= height) {
    froggy.ypos = height-25;
    
  }
  if (froggy.xpos >= width +10) {
    alive = false;
  }
  if (froggy.xpos <= 0-10) {
    alive = false;
  }
  //establish alive 
  if (alive == false) {
    froggy.xpos = width/2;
    froggy.ypos = height-25;
    deathTally += 1;
    alive = true;
  }
 
  //life counter
  if (deathTally < 1) {
    lives(125, 25);
  }
  if (deathTally < 2) {
    lives(75, 25);
  }
  if (deathTally < 3) {
    lives(25, 25);
  }
  for(int i = 0; i < 5; i++){
   if (tally[i] == 1){
    lives(pad[i].xpos,75); 
   }
  }
  //lose Screen
   if (deathTally >= 3) {
    textAlign(CENTER);
    fill(0,90);
    rect(0, 0, width, height);
    textSize(64);
    fill(255, 60, 0);
    for (int i = 0; i < 5; i++){
      tally[i] = 0;
    }
    text("YOU LOSE BITCH!!!!", width/2, height/2);
    
    textSize(22);
    text("(press the space bar for a new game)", width/2, height/1.75);
    noLoop();
  }
  //Win Screen
  if (tally[0] + tally[1] + tally[2] + tally[3] + tally[4] == 5 || cheat == 9) {
    textAlign(CENTER);
    fill(0,90);
    rect(0, 0, width, height);
    textSize(64);
    fill(60, 255, 0);
    text("YOU WIN!!!", width/2, height/2);
    for (int i = 0; i < 5; i++){
      tally[i] = 0;
    }
    noLoop();
  }
}

void lives(float xpos, int ypos) {
  stroke(#144307);
  fill(#42B224);
  ellipse(xpos, ypos-15, 10, 10);
  //hind legs
  ellipse(xpos-10, ypos+10, 5, 15);
  ellipse(xpos+10, ypos+10, 5, 15);
  //front legs
  ellipse(xpos-10, ypos-10, 3, 12);
  ellipse(xpos+10, ypos-10, 3, 12);
  //head outline
  strokeWeight(2);
  stroke(#144307);
  ellipse(xpos, ypos-15, 11, 11);
  //body
  strokeWeight(1);
  ellipse(xpos, ypos, 20, 25);
  //head
  noStroke();
  ellipse(xpos, ypos-15, 10, 10);
}

class Background { 
  float xpos;
  float ypos;
  float lpadx = 100;
  float lpady = 75;

  Background(float _xpos, float _ypos) {
    xpos = _xpos;
    ypos = _ypos;
  }

  void display() {
    noStroke();
    //water
    fill(#1595E3);
    rectMode(CENTER);
    rect(xpos, ypos, width, 300);
    rectMode(CORNER);
    //road
    fill(#280250);
    rect(0, 300, width, height);
    //front grass
    fill(#20C932);
    rect(0, height-45, width, height-45);
    //back grass
    fill(#20C932);
    rect(0, 0, width, 50);
  }
}

class Bus {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Bus(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(0);
    //top wheels
    rect(xpos-25, ypos-20, 10, 10);
    rect(xpos+25, ypos-20, 10, 10);
    //bottom wheels
    rect(xpos-25, ypos+20, 10, 10);
    rect(xpos+25, ypos+20, 10, 10);
    //body
    fill(c);
    rect(xpos, ypos, 90, 30);
    rectMode(CORNER);
  }

  void drive() {
    xpos -= xspeed;
    if (xpos < 0-45) {
      xpos = width+45;
    }
  }
  boolean hitTest(float mX, float mY) {
    if (abs(xpos-mX) < 55 && abs(ypos - mY) < 5) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(0);
    //top wheels
    rect(xpos-25, ypos-20, 10, 10);
    rect(xpos+25, ypos-20, 10, 10);
    //bottom wheels
    rect(xpos-25, ypos+20, 10, 10);
    rect(xpos+25, ypos+20, 10, 10);
    //body
    fill(c);
    rect(xpos, ypos, 60, 30);
    rectMode(CORNER);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width+30) {
      xpos = 0-30;
    }
  }
  boolean hitTest(float mX, float mY) {
    if (abs(xpos-mX) < 40 && abs(ypos - mY) < 5) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Frog {
  float xpos;
  float ypos;

  Frog(float _xpos, float _ypos) {
    xpos = _xpos;
    ypos = _ypos;
  }

  void display() {
   
    image(alan,xpos, ypos-15, 50, 50);
  }

  void keyTyped() {
    if (keyCode == UP) {
      ypos -= 50;
    } 
    else if (keyCode == DOWN) {
      ypos += 50;
    }
    if (keyCode == RIGHT) {
      xpos += 50;
    }
    else if (keyCode == LEFT) {
      xpos -= 50;
    }
  }
}

class Log {
  float xpos;
  float ypos;
  float xspeed;
  float Length;

  Log(float _xpos, float _ypos, float _xspeed, float _Length) {
    xpos = _xpos;
    ypos = _ypos;
    xspeed = _xspeed;
    Length = _Length;
  }

  void display() {
    rectMode(CENTER);
    stroke(#A05708);
    fill(#402201);
    //log
    rect(xpos, ypos, Length, 30);
    rectMode(CORNER);
  }

  void move() {
    xpos += xspeed;
    if (xpos > width +Length) {
      xpos = -Length;
    }
  }
   boolean hitTest(float mX, float mY) {
    if (abs(xpos-mX) < Length/2 && abs(ypos - mY) < 5) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Pad {
  float xpos;
  color c;


  Pad(float _xpos, color _c) {
    xpos = _xpos;
    c = _c;
  }

  void display() {
    noStroke();
    rectMode(CENTER);
    fill(c);
    rect(xpos, 75, 50, 50);
    rectMode(CORNER);
  }

  boolean hitTest(float mX, float mY) {
    if (abs(xpos-mX) < 25 && abs(75 - mY) < 10) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Turtle {
  float xpos;
  float ypos;
  float xspeed;

  Turtle(float _xpos, float _ypos, float _xspeed) {
    xpos = _xpos;
    ypos = _ypos;
    xspeed = _xspeed;
  }

  void display() {
    stroke(0);
    fill(#063403);
    //front legs
    ellipse(xpos-10, ypos-15, 10, 15);
    ellipse(xpos-10, ypos+15, 10, 15);
    //head
    ellipse(xpos-20, ypos, 20, 15);
    //back legs
    ellipse(xpos+10, ypos-15, 10, 15);
    ellipse(xpos+10, ypos+15, 10, 15);
    //body
    fill(#5F3105);
    ellipse(xpos, ypos, 30, 30);
  }

  void swim() {
    xpos -= xspeed;
    if (xpos < 0 -25) {
      xpos = width + 25;
    }
  }
  boolean hitTest(float mX, float mY) {
    if (abs(xpos-mX) < 30 && abs(ypos - mY) < 5) {
      return true;
    }
    else {
      return false;
    }
  }
}
