
PImage backgroundImage;
PImage fighterPlane;
PImage sideWinder;
PImage cityMap;

int fighterX = 275;
int fighterY = 500;

missile[] missileBarrage = new missile[10];
int count = 10;
int points = 0;

PFont f = createFont ("Arial", 96, true);

city theCity;
city2 theCity2;
plane interceptor;

int r = 145;
int e = 490;

void setup() {
  backgroundImage = loadImage("background.jpg");
  fighterPlane = loadImage("Bomber_Blue.gif");
  sideWinder = loadImage("missile.gif");
  cityMap = loadImage("city.png");
  size(600, 600);
  smooth();
  theCity = new city();
  theCity2 = new city2();
  interceptor = new plane();
  for (int i=0; i<missileBarrage.length; i++) {
  missileBarrage[i] = new missile(color(255), random(10, width-10), random(-1000, -50), 2);
}
}

void draw() {
  println(mouseY);
  image(backgroundImage,0,0);
  textFont (f);
  fill(249, 193, 146);
  if (points >=0 && points < 101) {
  text(points, 40, 80);
}    
  theCity.display();
  theCity2.display();
  interceptor.display();
  
  if (keyPressed) {
    if (keyCode == LEFT) {
      interceptor.x -=10;
}
    if (keyCode == RIGHT) {
      interceptor.x +=10;
}
}

  for (int i=0; i<count; i++) {
    missileBarrage[i].drive();
    missileBarrage[i].display();
}
}

void mousePressed() {
  points = 0;
}

class missile { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  missile(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = tempXspeed;

  theCity.display();
  theCity2.display();
  interceptor.display();
}


void display() {

  pushMatrix();
  translate(xpos-105, ypos-150);
  image(sideWinder,95,55);
  popMatrix();
}

  void drive() {
  ypos = ypos + xspeed;

// plane
if (ypos > 468+70 && xpos > interceptor.x && xpos < interceptor.x + 124) {
  points +=5;
  xpos = random(20, width-10);
  ypos = random(-1000, -50);
}

// hitzone
if (ypos > height) {
  xpos = random(10, width-10);
  ypos = random(-1000, -50);
  points -=3;
}

  fill(0);
  if (points >= 100) {
  textSize(35);
  fill(255);
  text ("Victory!", 220, 220);
  text ("Click to play again.", 150, 275);
}

  if (points < 0 ) {
  textSize(35);
  fill(255);
  text ("Defeat!", 220, 220);
  text ("Click to play again.", 150, 275);
}
  //println(ypos);
}
}

//the city
class city {
  void display () {
  noStroke();
  fill(150,150,150);
  image(cityMap,0, 550);
  //rect(0,550, 600, 600);
}
}

//the city2
class city2 {
  void display () {
  noStroke();
}
}

//plane
class plane {
  float x;
  void display() {
  pushMatrix();
  translate(x, 0);
  image(fighterPlane,75,500);
  popMatrix();
}
}


