
/*Piper Hayden
  Interactive Digital Media
  Title: Rocket Pig
*/

/* The code creates a pig which launches useing millis into space.
 Once the pig reaches space then the pig will follow the mouse,
 and stars appear.*/

/*Code borrowed by open processing for easing of the pig in space
 Name: Marius Gerum*/

//Global Variables
PShape rocket;
PShape six;
PImage five;
PImage four;
PImage three;
PImage two;
PImage one;

//Variables for taking off
int radius = 50;
int diameter = radius*2;
float y = 545;
float speed  = 5;
int direction = -1;

//Variables for into space
int diameterb = radius*4;
float z = 750;

//Timer
int time1 = 5000;
int timeA = 0;

//Timer CountDown
int timeB = 1000;
int timeC = 2000;
int timeD = 3000;
int timeE = 4000;
int timeF = 5000;

//Variables for controlling movement
int currentTime;
int stage;

//Easing Variables
float spaceX = width/2;
float spaceY = height/2;
float easing = 0.05;

//Easing
float a, b;
float targetA, targetB;
float easing1 = 0.02;

//Only Draws once
void setup() {
  size(600, 800);
  //Countdown Images
  rocket = loadShape("pig.svg");
  six = loadShape("6.svg");
  five = loadImage("5.png");
  four = loadImage("4.png");
  three = loadImage("3.png");
  two = loadImage("2.png");
  one = loadImage("1.png");
  imageMode(CENTER);
  shapeMode(CENTER);
}


void draw() {
  //Background(earth)
  background(135, 206, 250);
  //Timer
  currentTime = millis();
  println(millis());
  spaceshipOnEarth();
  drawCountDown();
  spaceshipInSpace();
  if (stage == 1) {
    spaceshipMouse();
    drawAllStars();
  }
}

//Stage and Base
void baseAndStage() {
  fill(192, 192, 192);
  rect(0, 750, width, height);
  fill(112, 128, 144);
  rect(width/2-100, 610, 20, 140);
  rect(width/2+100, 610, 20, 140);
  rect(width/2-100, 590, 220, 30);
  noFill();
}
//Pig on earth
void spaceshipOnEarth() {
  drawCountDown();
  baseAndStage();
  if (currentTime < time1) {
    shape(rocket, width/2, 545, diameter, diameter);
  }
  if (currentTime > time1) {
    y+= speed * direction;
    if (direction == -1) {
      shape(rocket, width/2, y, diameter, diameter);
    }
  }
}
//Pig in Space
void spaceshipInSpace() {
  if (y <= 0) {
    background(0);
    //    fill(0);
    //    rect(0, 0, width, height);
    z+= speed * direction;
    if ((z > height - radius) || (z < radius)) {
      direction = -direction;
    }    
    else {
      shape(rocket, width/2, z, diameter * 2, diameter * 2);
    }
    if (z <height/2) {
      speed = 0;

      shape(rocket, width/2, z, diameter * 2, diameter * 2);
      stage = 1;
    }
  }
}

//Pig follows mouse
void spaceshipMouse() {
  background(0);
  targetA = mouseX;
  targetB = mouseY;
  float dx = targetA - a;
  float dy = targetB - b;
  if (abs(dx) > 1)
  {
    a += dx * easing1;
  }
  if (abs(dy) > 1)
  {
    b += dy * easing1;
  }

  shape(rocket, a, b, diameterb, diameterb);
}

//The actual star
void drawStar(int s, int t) {
  triangle(s+0, t+10, s+40, t+10, s+20, t+35); 
  triangle(s+0, t+25, s+40, t+25, s+20, t+0);
}


//All of the stars drawn
void drawAllStars() {
  noStroke();
  fill(random(0, 225));
  drawStar(0, 90);
  drawStar(552, 60);
  drawStar(75, 150);
  drawStar(500, 598);
  drawStar(459, 760);
  drawStar(365, 468);
  drawStar(30, 698);
  drawStar(150, 720);
  drawStar(600, 300);
  drawStar(50, 500);
  drawStar(400, 400);
  drawStar(450, 200);
  drawStar(300, 400);
}

//Displays countdown for pig launch
void drawCountDown() {
  //if (currentTime >= timeA) {
    //shape(six, width/2, 600, 50, 50);
 // }
  if (currentTime >= timeB) {
    image(five, width/2, 700, 60, 60);
  }
  if (currentTime >= timeC) {
    image(four, width/2, 700, 70, 70);
  }
  if (currentTime >= timeD) {
    image(three, width/2, 700, 80, 80);
  }
  if (currentTime >= timeE) {
    image(two, width/2, 700, 90, 90);
  }
  if (currentTime >= timeF) {
    image(one,width/2,700,100,100);

    
  }
}



