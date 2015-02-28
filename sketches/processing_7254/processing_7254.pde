
int x = 10;        //rect1 X
int y = 125;       //rect1 Y
int x2 = 390;      //rect2 X
int y2 = 125;      //rect2 Y
float bx = 200;    //ball X
float by = 125;    //ball Y
float c = -1.5;    //ball x movement
float v = 0;       //ball y movement
int p1 = 0;        //Left player points
int p2 = 0;        //right player points
boolean s = false; //start variable
// Array for controller keys
boolean[] keys = new boolean[4];
final int Q = 0;
final int A = 1;
final int O = 2;
final int L = 3; 

void setup() {
  size(400, 250);
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  strokeWeight(2);
  frameRate(130);
  PFont arial;
  arial = loadFont("ariblk.vlw");
  textFont(arial, 48);
   // Init all controller keys to "not pressed"
  for (int i = 0; i< 4; i++) {
    keys[i] = false;
  } 
}

void draw() {
   if(s == false) {
   background(0);
   text("Pong!",130, 70);
textSize(15);
   text("by Odin",135, 90);
textSize(20);
   text("Start?",170,155);
   stroke(255);
   noFill();
rect(200,150,100, 75);
 noLoop();
}
 
 if(s == true) {
background(100);
stroke(0);
textSize(48);
fill(255);
text(p1, 165, 35);           //This is the first player's points.
text(p2, 203, 35);           //This is the second player's points.
line(200, 0, 200, 250);
fill(255);
    ellipse(bx, by, 10, 10);    //The Pong Ball
    
    bx = bx + c;                //Default ball movements.
    by = by + v;
    
if(bx == 20 && by >= y-25 && by <= y+25) {     //Movements if ball touch left player.
  if(by < y) {
    c = +2;
    v = -2.5; }
  if(by > y) {
    c = +2;
    v = +2.5; }
  if(by == y) {
    c = +2;
    v = 0; }
  }

if(bx == 380 && by >= y2-25 && by <= y2+25) {    //Movements if ball touch right player.
  if(by < y2) { 
    c = -2;
    v = -2.5; }
  if(by > y2) {
    c = -2;
    v = +2.5; }
  if(by == y2) {
    c = -2;
    v = 0; }
  }

  if(bx < 0) {       //If the ball pass left limit.
  bx = 200;
  by = 125;
  v = 0;
  c = -1.5;
  p2 = p2+1; 
  }

  if(bx > 400) {     //If the ball pass right limit.
    bx = 200;
    by = 125;
    v = 0;
    c = +1.5;
    p1 = p1+1; 
  }

  if(by > 250) {   //The ball touch the lower limit.
    v = -2;
  }
  
  if(by < 0) {     //The ball touch the upper limit.
    v = +2; 
  }
stroke(0);
fill(80);
    rect(x, y, 10, 50);       //This is the left pannel.       
    rect(x2, y2, 10, 50);     //This is the right pannel.
       
 if(keys[Q] == true) {        //Move the left player up.
    y = max(25, y-2);  
  }
  if(keys[A] == true) {       //Move the left player down.
    y = min(225, y+2);
  }
  if(keys[O] == true) {       //Move the right player up.
    y2 = max(25, y2-2);
  }
  if(keys[L] == true) {       //Move the right player down.
    y2 = min(225, y2+2);
  }
  
fill(255);
if(p1 >= 10) {
  text("player1 win!",50,100);
  textSize(20);
  text("<click to restart>",110, 150);
  bx = 200;
  by = 150;
noLoop();
 }
if(p2 >=10) {
  text("player2 win!",50,100);
  textSize(20);
  text("<click to restart>",110, 150);
  bx = 200;
  by = 150;
  noLoop();
  }
 }
}

void keyPressed() {
  if(key == 'q') {
    keys[Q] = true;
  } else if(key == 'a') {
    keys[A] = true;
  } else if(key == 'o') {
    keys[O] = true;
  } else if (key == 'l') {
    keys[L] = true;
  }
}
 
void keyReleased() {
  if(key == 'q') {
    keys[Q] = false;
  } else if(key == 'a') {
    keys[A] = false;
  } else if(key == 'o') {
    keys[O] = false;
  } else if (key == 'l') {
    keys[L] = false;
  }
} 

void mousePressed() {
  if(p1 >= 10 || p2 >= 10 ) {
  loop();
  p1 = 0;
  p2 = 0;
  y = 125;
  y2 = 125;
  by = 125;
  c = -1.5;
 }
 if(s == false) {
   if((mouseX <= 250 && mouseX >= 150)
   &&(mouseY <= 187.5 && mouseY >= 112.5) ){
   loop();
   s = true;
  }
 }
}

