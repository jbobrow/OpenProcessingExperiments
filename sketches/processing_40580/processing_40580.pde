
//Nathan Trevino  
//Homework 8
//Processing Wednesday, September 22, 2011
//Copyright September 22nd 2011
//Carnegie Mellon University. Pittsburgh PA

//variables 
//the tank position. the crater sizes and positions.
//the tank gun stuff.


int Wd, Ht;
float tankX, tankY, tankWidth, tankLength, tankSpeedX, tankSpeedY;
float craterX, craterX2, craterX3, craterX4;
float craterY, craterY2, craterY3, craterY4;
float craterRadius, craterRadius2, craterRadius3, craterRadius4; 
float leavingX;
PFont font;
int numCollisions;
int Score;
float speedChange;

//missle variables

float missleSize = 30;       // Length of the missle
float missleTip = 10;         //Length of missle tip
float xpos, ypos;    // Starting position of missle    

float xspeed = 3;  // Speed of the missle
float yspeed = 2.5;  // Speed of the missle

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

//distance functions for collisions

//float distMissle = dist(xpos, ypos, missleSize, missleSize);
//float distTank = dist(tankX, tankY, tankLength, tankLength);




void setup() {
  Wd = 600;
  Ht = 600;
  size (600, 600);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(100);
  noCursor();

  //declaring variable values
  font = loadFont ("PortagoITCTT-32.vlw");
  tankX = 300;
  tankY = 300;
  tankWidth = 35;
  tankLength = 25;
  tankSpeedX = 0;
  tankSpeedY = 0;
  craterX = random(0, 600);
  craterX2 = random(0, 600);
  craterX3 = random(0, 600);
  craterX4 = random(0, 600);
  craterY = random(0, 600);
  craterY2 = random(0, 600);
  craterY3 = random(0, 600);
  craterY4 = random(0, 600);
  craterRadius = random(30, 60);
  craterRadius2 = random(50, 100);
  craterRadius3 = random(100, 200);
  craterRadius4 = random(20, 150);
  numCollisions = 0;
  Score = (millis());
  speedChange = .4;


  //starting position of the missle
  xpos = random(0, 600);
  ypos = random(0, 600);
}



void draw() {


  atmosphere();
  environment();
  tank();
  crosshair();
  tankGun();
  missle();
  collision();
  readout();
}

void environment() {
  noStroke();
  fill(245, 239, 116);
  rect(300, 300, 600, 600);
  fill(118, 88, 32);
  strokeWeight(6);
  stroke(180, 178, 95);

  //craters in the ground
  ellipse(craterX, craterY, craterRadius, craterRadius);
  ellipse(craterX2, craterY2, craterRadius2, craterRadius2);
  ellipse(craterX3, craterY3, craterRadius3, craterRadius3);
  ellipse(craterX4, craterY4, craterRadius4, craterRadius4);

  //smoke from the craters
}


void atmosphere() {
}
void tank() {

  //the main character of the game.

  tankX += tankSpeedX;
  tankY += tankSpeedY;
  noStroke();
  fill(40, 150, 40);
  rect(tankX, tankY, tankWidth, tankLength);
  strokeWeight(1);
  fill(162, 156, 30);
  ellipse(tankX, tankY, 15, 15);

  //tracking variable

  leavingX = dist(tankX, tankY, 200, 200);

  //tracking if the tank leaves the area of the screen
  if (tankX > Wd ) {
    strokeWeight(5);
    stroke(255, 0, 0);
    line(tankX, tankY, 300, 300);

    textFont (font);
    fill(0);
    text ("Warning. Leaving Battlefield", 100, 300);
    text (leavingX, 200, 350);
  }
  if (tankX < 0 ) {
    strokeWeight(5);
    stroke(255, 0, 0);
    line(tankX, tankY, 300, 300);

    textFont (font);
    fill(0);
    text ("Warning. Leaving Battlefield", 100, 300);
    text (leavingX, 200, 350);
  }
  if (tankY > Ht ) {
    strokeWeight(5);
    stroke(255, 0, 0);
    line(tankX, tankY, 300, 300);

    textFont (font);
    fill(0);
    text ("Warning. Leaving Battlefield", 100, 300);
    text (leavingX, 200, 350);
  }
  if (tankY < 0) {
    strokeWeight(5);
    stroke(255, 0, 0);
    line(tankX, tankY, 300, 300);

    textFont (font);
    fill(0);
    text ("Warning. Leaving Battlefield", 100, 300);
    text (leavingX, 200, 350);
  }
}

void tankGun() {

  //center of the screen
  int ctr = Wd/2;
  float angle = atan2((mouseY - ctr), (mouseX - ctr));

  //translate and rotate
  pushMatrix();
  //changes
  translate(tankX, tankY);
  rotate(angle);

  strokeWeight (3);
  stroke(23, 85, 37);
  line (0, 0, 15, 0 );


  popMatrix();
  //stop changes to objects

  //attempt to rotate around
  //following cursor... oh well.. ask JIM!
}

void crosshair() {


  strokeWeight(2);
  stroke(255, 0, 0);
  line(mouseX - 15, mouseY, mouseX +15, mouseY);
  line(mouseX, mouseY - 15, mouseX, mouseY + 15);
  noFill();
  ellipse(mouseX, mouseY, 30, 30);
}

void missle() {

  //Update position of the missle as it moves across the screen.
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  //so now we test to see if the missle goes past the boundaries
  //of the screen if it does... reverse its direction
  //by multiplying it by -1
  if (xpos > width - missleSize || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height - missleSize || ypos < 0) {
    ydirection *= -1;
  }
  //Draw the missle?
  noStroke();
  fill(140);
  rect( xpos+ missleSize/2, ypos+ missleSize/2, missleSize, missleSize);
  fill(255, 0, 0);
  rect( xpos+ missleSize/2, ypos+ missleSize/2, missleTip, missleTip);
  //smoke


  //and now we do the collisions.
}

//collisions
void collision()
{
  if ( dist(tankX, tankY, xpos, ypos) <= (tankLength + .5*missleSize))
  {
    tankX = 300;
    tankY = 300;
    xpos = (random(0, 600));
    ypos = (random(0, 600));
    fill(255, 255, 0);
    rect(300, 300, 600, 600);
    fill(255, 0, 0);
    rect(300, 300, 600, 600);

    numCollisions = numCollisions + 1;
    xspeed += 2;
    yspeed += 2;
  }
  if ( numCollisions >= 4 )
  {
    fill(0);
    rect(300, 300, 600, 600);
    fill(255);
    textFont(font);
    textSize (40);
    text( " GAME OVER ", width/4, 250);
    text ("Score  " + Score, width/2, 80);

    cursor();
  }
}

void keyPressed() {

  if (key == 'w') {
    tankSpeedY -= speedChange;
  }  
  else if (key == 's') {
    tankSpeedY += speedChange;
  }  
  else if (key == 'a') {
    tankSpeedX -= speedChange;
  }  
  else if (key =='d') {
    tankSpeedX += speedChange;
  }
  else if (key == ' ') {

    tankX = 300;
    tankY = 300;
    tankSpeedX = 0;
    tankSpeedY = 0;
  }
}

void mousePressed()
{
  stroke(255, 255, 0);
  line ( tankX, tankY, mouseX, mouseY);

  if ( dist(mouseX, mouseY, xpos, ypos) <= 30 )
  {

    Score = Score + 50;
    textFont (font);
    fill (0);
    textSize(36);
    pushMatrix();
    frameRate(20);
    text ( " + 50  ", mouseX, mouseY);
    
    popMatrix();
    
  }else{
    frameRate (60);
  }
}

void readout()
{
  textFont (font);
  textSize(28);
  fill(0);
  text ("YOU GOT SHOT UP " + numCollisions + " TIMES", 3, 40);
  text ("TIME IN BATTLE  " + millis()/1000 + " ", 3, 200);
  textSize(15); 
  text ("GPS POSITION     " + tankX + tankY + " ", 3, 452);
  text ("HORIZONTAL SPEED   " + tankSpeedX + " ", 3, 464);
  text ("VERTICAL SPEED    " + tankSpeedY + " ", 3, 476);
}


