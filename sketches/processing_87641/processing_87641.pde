
//Game State Variable
/*@pjs font="Arial-BoldItalicMT-48.ttf";*/

int gameState;

PFont openFont;

//Direction Variables
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result;

//Speed Variables
float playerSpeedX;
float playerSpeedY;

//Slow Motion Variables
int slowMo;
int slowMoChecker;

//Reverse Speed Variable
int reverseSpeed;

//Check if Bombs Touch Ground
int touchGround;

//Background Change
int backgroundChange;


//Objects and Arrays
Sun sun;
Hero hero;
Timer timer;
Explosion explosion;
Cloud[] clouds = new Cloud[3];
Stripe[] stripes = new Stripe[25];
Meteor[] meteor = new Meteor[50];
Citizen[] citizen = new Citizen[30];
Bomb[] bombs;
int totalBombs = 0;
int score = 0;

////////////////////

void setup() {
  size(1000, 480);
  smooth();
  frameRate(60);

  gameState = 0;

  playerSpeedX = 5;
  playerSpeedY = 5;

  slowMo = 0;
  slowMoChecker = 1;

  reverseSpeed = 5;

  touchGround = 0;

  backgroundChange = 0;
  
  openFont = loadFont("Arial-BoldItalicMT-48.ttf");

  sun = new Sun();

  explosion = new Explosion(0);

  //Initialize Background Meteors
  for (int i = 0; i < meteor.length; i++) {
    meteor[i] = new Meteor();
  }

  //Initialize Hero's Catch Radius
  hero = new Hero(52);

  //Initialize all Stripe objects
  for (int i = 0; i < stripes.length; i++) {
    stripes[i] = new Stripe();
  }

  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }

  //Number of Bombs
  bombs = new Bomb[1000];

  //Initialize Citizens
  for (int i = 0; i < citizen.length; i++) {
    citizen[i] = new Citizen();
  }

  //Speed of Timer
  timer = new Timer(50);
  timer.start();
}

////////////////////////////

void draw() {

  if (gameState == 0) {
    background(134, 151, 160);
    
    sun.drawSun();
    
    for (int i = 0; i < meteor.length; i++) {
      meteor[i].move();
      meteor[i].display();
    }
    
    for (int i = 0; i < clouds.length; i++) {
      clouds[i].move();
      clouds[i].display();
    }
    
    for (int i = 0; i < stripes.length; i++) {
      stripes[i].move();
      stripes[i].display();
    }
    
    for (int i = 0; i < citizen.length; i++) {
      citizen[i].move();
      citizen[i].display();
    }

    hero.display();
     
    textAlign(CENTER);
    textFont(openFont, 50);
    fill(229,91,69);
    text("In", width/2-3, height/2+3);
    fill(0);
    text("In", width/2, height/2);
    fill(229,91,69);
    text("Time", width/2-3, height/2+53);
    fill(0);
    text("Time", width/2, height/2+50);
    
    textAlign(CENTER);
    textFont(openFont, 20);
    text("Press 'J' to Start", width/2, height/2+80);
    
    textAlign(RIGHT);
    textFont(openFont, 20);
    text("Catch the Comets.", width*19/20,height*1/10 + 20);
    text("Save the Citizens.", width*19/20,height*1/10 +40);
    text("W,A,S,D Keys to Move.", width*19/20,height*1/10 + 60);
    text("Press 'J' to slow down time,", width*19/20,height*1/10 + 80);
    text("But be careful! The longer you slow time,", width*19/20,height*1/10 + 100);
    text("The slower you become.", width*19/20,height*1/10 + 120);
    text("Good Luck.", width*19/20,height*1/10 + 140);

    if (keyPressed) {
      if (key == 'j' || key == 'J') {
        gameState = 1;
      }
    }
  }

  if (gameState == 2) {
    background(255);

    //Declare the Score
    textAlign(CENTER);
    textFont(openFont, 50);
    textSize(26);
    fill(0);
    text("Caught In Time: " + score, width/2, height/2);

    textFont(openFont, 15);
    text("(Click Screen to Restart)", width/2,height/2 + 25);
    
    if (mousePressed) {
      reset();
    }
  }

  if (gameState == 1) {

    backgroundChange += 0.01;
    background(134-backgroundChange, 151-backgroundChange, 160-backgroundChange);
    noCursor();

    if (slowMoChecker == 0) {
      slowMo = 1;
    }
    else {
      slowMo = 0;
    }

    if (explosion.w == 0) {
      switch(result) {
      case NORTH: 
        hero.y-=playerSpeedY; 
        break;
      case EAST: 
        hero.x += playerSpeedX; 
        break;
      case SOUTH: 
        hero.y+=playerSpeedY; 
        break;
      case WEST: 
        hero.x -= playerSpeedX+reverseSpeed; 
        break;
      case NORTH|EAST: 
        hero.y-=playerSpeedY/1.2; 
        hero.x += playerSpeedX/1.2;
        break;
      case NORTH|WEST: 
        hero.y-=playerSpeedY/1.2; 
        hero.x -= (playerSpeedX + reverseSpeed)/1.1; 
        break;
      case SOUTH|EAST: 
        hero.y+=playerSpeedY/1.2; 
        hero.x += playerSpeedX/1.2;
        break;
      case SOUTH|WEST: 
        hero.y+=playerSpeedY/1.2; 
        hero.x -= (playerSpeedX + reverseSpeed)/1.1;
        break;
      }
    }

    //Draw the Sun
    sun.drawSun();
    if (explosion.w == 0) {
      sun.moveSun();
    }

    //Move and Display Meteors
    for (int i = 0; i < meteor.length; i++) {

      if (explosion.w == 0) {
        meteor[i].move();
      }
      meteor[i].display();
    }

    //Move and Display Clouds
    for (int i = 0; i < clouds.length; i++) {

      if (explosion.w == 0) {
        clouds[i].move();
      }
      clouds[i].display();
    }

    //Move and Display Buildings
    for (int i = 0; i < stripes.length; i++) {

      if (explosion.w == 0) {
        stripes[i].move();
      }
      stripes[i].display();
    }

    //Move and Display Citizens
    for (int i = 0; i < citizen.length; i++) {

      if (explosion.w == 0) {
        citizen[i].move();
      }
      citizen[i].display();
    }

    if (slowMo == 1) {
      fill(227, 227, 227, 90);
      rectMode(CENTER);
      rect(width/2, height/2, 1000, 480);
    }

    //Set Controls for, Display, and Weaken Hero
    hero.display();
    hero.weaken();
    hero.cape();
    hero.border();
    //hero.setLocation(width/3,height*2/3);

    //Rules for Timer
    if (slowMo == 0) {
      timer.countUp();
      if (timer.isFinished()) {
        bombs[totalBombs] = new Bomb();
        totalBombs ++;
        if (totalBombs >= bombs.length) {
          totalBombs = 0;
        }
        timer.start();
      }
    }

    //Move, Display, and Catch Bombs. Add the Score.
    for (int i = 0; i < totalBombs; i++) {
      if (bombs[i].y <= height+ 7000) {
        bombs[i].move();
        bombs[i].display();
        bombs[i].returnBottomValue();
        bombs[i].respawn();
        if (hero.intersect(bombs[i])) {
          if (bombs[i].bombCaught == false) {
            score++;
          }
          bombs[i].caught();
        }
      }
    }

    //Display Explosion
    explosion.display();

    if (explosion.w > width*2+150) {
      gameState = 2;
    }
  }
}

void reset() {

  timer.savedTime = 0;
  totalBombs = 0;
  score = 0;

  playerSpeedX = 5;
  playerSpeedY = 5;

  slowMo = 0;
  slowMoChecker = 1;

  reverseSpeed = 6;

  touchGround = 0;

  backgroundChange = 0;

  hero.x = width/3;
  hero.y = height*4/5;
  hero.capeDrain = 0;
  sun.x = width/5;
  sun.y = height/3;
  sun.g = 255;
  explosion.w = 0;
  explosion.h = 0;
  explosion.opac = 0;

  gameState = 0;
}

class Bomb {
  float x, y;
  float speed;
  color c;
  float r;
  float w;
  float h;
  int resetLimit;
  int resetTimer;
  boolean bombCaught = false;
  int hitChance;
  float slowTime;
  boolean respawning = false;

  Bomb() {
    r = 15;                  //All bombs are same size
    x = random(500, width+100);      //Start with a random x location
    y = -r*4;               //Start a little above the window
    speed = random(2, 4);    //Pick a random speed
    c = color(129, 115, 92);  //Color (Alternate = 255,215,67)
    w = random(15, 18);
    h = random(15, 18);
    hitChance = round(random(1, 3));

    resetLimit = round(random(300, 1080));
    resetTimer = 0;


    slowTime = 0.5;
  }

  //Move the bomb down
  void move() {

    if (explosion.w == 0) {
      //Increment by speed
      if (slowMo == 0) {
        y += speed;
        x -= speed;
      }

      if (slowMo == 1) {
        y += slowTime;
        x -= slowTime;
      }
    }
  }

  //Check if it hits the bottom
  boolean hitBottom() {
    //If we go beyond the bottom
    if (y > height) {
      return true;
    } 
    else {
      return false;
    }
  }

  //Display the bomb
  void display() {

    if (bombCaught == false) {
      fill(c);
      noStroke();
      for (int i = 2; i < r; i++) {
        fill(214, 41, 41, 90);
        ellipse(x - i*2, y + i*2, w+i*2, h+i*2);
      }
      fill(c);
      ellipse(x-30, y+30, w+10, h+10);
    }
  }

  //If the bomb is caught
  void caught() {
    bombCaught = true;
  }

  void respawn() {

    if (bombCaught == true) {
      resetTimer++;
    }

    else if (hitBottom() == true) {  
      explosion.x = x;
      explosion.explode();
    }

    if (resetTimer >= resetLimit) {
      if (hitChance == 1) {
        x = random(500, width+100);
        y = -r*4;
        speed = random(2, 4);
        bombCaught = false;
        resetTimer = 0;
        resetLimit = round(random(300, 1080));
      }
    }
  }

  void returnBottomValue() {
    if (hitBottom() == true && resetTimer == 1) {
      touchGround += 1;
    }
  }
}

class Citizen {

  float x, y;
  float speed;
  int citizenColor;
  float slowTime;

  Citizen() {
    x = random(0, width);
    y = height-30;
    speed = random(-5, -3);
    citizenColor = round(random(0,2));
    slowTime = 0.5;
  }

  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);  
    if (citizenColor == 0){
      fill(181, 220, 252);
    }
    else if (citizenColor == 1){
      fill(255, 167, 198);
    }
    else if (citizenColor == 2){
      fill(148,148,148);
    }
    smooth();
    rect(x, y+17, 17, 30);
    ellipse(x, y, 30, 30);
  }

  void move() {
    if (slowMo == 0) {
      x += speed;
    }

    if (slowMo == 1) {
      x -= slowTime;
    }
    
    if (x < -100) x = width + 100;
  }
}

class Cloud {

  float x, y;
  float speed;
  float slowTime;

  Cloud() {
    x = random(0, width);
    y = random(100, 300);
    speed = random(-5, -3);
    slowTime = 0.5;
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, 35, 30);
    ellipse(x-15, y, 25, 20);
    ellipse(x+15, y, 25, 20);
  }

  void move() {
    if (slowMo == 0) {
      x += speed;
    }

    if (slowMo == 1) {
      x -= slowTime;
    }
    
    if (x < -100) {
      x = width + 100;
      y = random(100, 300);
      speed = random(-5, -3);
    }
  }
}

class Explosion{
  float x,y;
  float w;
  float h;
  float r;
  float o;
  float opac;
  
  Explosion(float tempX){
    x = tempX;
    y = height;
    w = 0;
    h = 0;
    r = 15;
    opac = 0;
    o = 2;
  }
  
  void display(){
    if(opac >= 255){
      opac = 255;
    }
    fill(255,opac);
    ellipse(x,y,w,h);
  }
  
  void explode(){
    w += r;
    h += r;
    opac += o;
  }
}
class Hero {
  float x, y;
  float r;
  float capeDrain;

  Hero(float tempR) {
    r = tempR;
    x = width/3;
    y = height*4/5;
    capeDrain = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);  
    fill(75);
    smooth();
    rect(x-30, y+10, 60, 20);
    fill(229+capeDrain, 91+capeDrain, 69+capeDrain);
    triangle(x-70, y-10, x, y, x-70, y+10);
    fill(75);
    ellipse(x, y, 40, 40);
  }

  boolean intersect(Bomb d) {
    float distance = dist(x, y, d.x, d.y); //FIX THIS!!!
    if (distance < r + d.r) { //FIX THIS
      return true;
    } 
    else {
      return false;
    }
  }
  
  void cape(){
    if (slowMo == 1){
      capeDrain += 0.3;
    }
  }
  
  void weaken(){
    if (slowMo == 1){
      playerSpeedX -= 0.005;
      playerSpeedY -= 0.005;
      reverseSpeed -= 0.005;
    }
    
    if (playerSpeedX <= 1){
      playerSpeedX = 1;
    }
    
    if (playerSpeedY <= 1){
      playerSpeedY = 1;
    }
    
    if (reverseSpeed <= 1){
      reverseSpeed = 1;
    }    
  }
  
  void border(){
    if (x >= width){
      x = width;
    }
    
    if (x <= 0){
      x = 0;
    }
    
    if (y >= height){
      y = height;
    }
    
    if (y <= 0){
      y = 0;
    }
  }
}

void keyPressed() {
  switch(key) {
    case('w'):
    case('W'):
    result |=NORTH;
    break;
    case('d'):
    case('D'):
    result |=EAST;
    break;
    case('s'):
    case('S'):
    result |=SOUTH;
    break;
    case('a'):
    case('A'):
    result |=WEST;
    break;
    case('j'):
    case('J'):
    slowMoChecker = 0;
    break;
  }
}

void keyReleased() {

  switch(key) {
    case('w'):
    case('W'):
    result ^=NORTH;
    break;
    case('d'):
    case('D'):
    result ^=EAST;
    break;
    case('s'):
    case('S'):
    result ^=SOUTH;
    break;
    case('a'):
    case('A'):
    result ^=WEST;
    break;
    case('j'):
    case('J'):
    slowMoChecker = 1;
    break;
  }
}
class Meteor {

  float x, y;
  float speed;
  color c;
  float r;
  float w;
  float h;
  float slowTime;

  Meteor() {
    r = random(10);                  //All bombs are same size
    x = random(width);      //Start with a random x location
    y = random(height);               //Start a little above the window
    speed = random(1, 2);    //Pick a random speed
    c = color(129, 115, 92);  //Color
    w = random(1, 3);
    h = random(1, 3);
    slowTime = 0.5;
  }

  void move() {
    //Increment by speed
    if (slowMo == 0) {
      y += speed;
      x -= speed;
    }

    if (slowMo == 1) {
      y += slowTime;
      x -= slowTime;
    }

    if (x < -100) x = width + 100;
    if (y > height+100) y = -100;
  }

  //Display the bomb
  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++) {
      fill(214, 41, 41, 90);
      ellipse(x - i*2, y + i*2, w+i*2, h+i*2);
      fill(c);
      ellipse(x - i*2, y + i*2, w, h);
    }
  }
}

class Stripe {

  float x;
  float speed;
  float w;
  float h;
  float slowTime;

  Stripe() {
    x = random(0, width);
    speed = random(-5, -3);
    w = random(50, 100);
    h = random(1000);
    slowTime = 0.5;
  }

  void display() {
    fill(255, 100);
    noStroke();
    rectMode(CENTER);
    rect(x, height, w, h);
  }

  void move() {
    
    if (slowMo == 0) {
      x += speed;
    }

    if (slowMo == 1) {
      x -= slowTime;
    }

    if (x < -100) x = width + 100;
  }
}

class Sun {
  float x, y;
  float w;
  float h;
  float speed;
  float slowTime;
  float g;
  float gChange;
  float slowGChange;

  Sun() {
    x = width/5;
    y = height/3;
    w = width/15;
    h = width/15;
    g = 255;
    speed = 0.1;
    slowTime = 0.01;
    gChange = 0.01;
    slowGChange = 0.005;
  }

  void drawSun() {
    noStroke();
    fill(251, 255, 105);
    ellipseMode(CENTER);
    ellipse(x, y, w, h);

    for (float i = 1; i < 11; i+=0.3){
      fill(251, g, 105, 16-i);
      ellipse(x, y, i*w, i*h);
      i = i+0.3;
    }
  }

  void moveSun() {
    if (slowMo == 0) {
      x += speed;
      y += speed;
      g -= gChange;
    }
    if (slowMo == 1) {
      x += slowTime;
      y += slowTime;
      g -= slowGChange;
    }
  }
}

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = 0;
  }
  
  void countUp(){
    savedTime += 1;
  }

  // The function isFinished() returns true if "totalTime" has passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    if (savedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}



