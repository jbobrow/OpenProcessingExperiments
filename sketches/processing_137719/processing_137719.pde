
//Charlotte Stiles cc 2014
//cstiles
// HW #7
// 2/27/14
 
 
// objective
// Reach the outside world (top of the screen)
// Avoid the obstacles (wall,ash,gear)
 
// controls;
//use arrow keys to control light
 
// The following sound effects were created by Charlotte Stiles
//woo, win, gear, edge

// The following sounds were taken from soundbible.com
// Machinesound4 (for wall): Public domain license
//Machinesound12 (for loose): Public domain license
//Machinerium- clockwise operetta cc Tomáš Dvořák for Amanita Design
int w, w2; //X of walls
int ywall=200; //Y of walls
int px, py; //playerX and playerY
int speed = 7; //speed for EVERYTHING
boolean Lopening = false, Ropening = false; //is the (L)eft/(R)ight wall opening? 
boolean Lopening2 = false, Ropening2 = false;
boolean timesgoing= true; //this functions as showing stats as an if function
boolean startscreen = true;
int sec, startsec;//time keeper
int life=5;
int settime=10;//time start counting down from
float rd1 = 0.0;//rotation of gear
float rd2 = 2.0;//rotation of gear
int f1 = 0;
int f2 = 1;
int move=-1;
int Gx, Gx2;
int Gy=100;
float xpos, ypos, Aspeed, ashLength, depth;
PImage startpage;
ashDrop Drop1 = new ashDrop(20, 5);
ashDrop Drop2 = new ashDrop(50, 8);
ashDrop Drop3 = new ashDrop(34, 3);
ashDrop Drop4 = new ashDrop(90, 4);
ashDrop Drop5 = new ashDrop(100, 5);
ashDrop Drop6 = new ashDrop(120, 8);
ashDrop Drop7 = new ashDrop(134, 3);
ashDrop Drop8 = new ashDrop(142, 4);

import ddf.minim.*;
Minim minim;
AudioPlayer background, gear, wall, ash, loose, win, edge, woo;


void setup()
{ 
  size(600, 600);
  background(100, 100, 100);
  w=0;
  px=300;
  py=550;
  Gx=0;
  Gx2=-width;
  /////////////////////////////////////////////////////
  ////////////////////////////////// SOUNDS  //////////
  /////////////////////////////////////////////////////

  minim = new Minim(this);
  background = minim.loadFile("background.wav");
  gear = minim.loadFile("gear.wav");
  wall = minim.loadFile("wall.wav");
  ash = minim.loadFile("ash1.wav");
  loose = minim.loadFile("loose.wav");
  win = minim.loadFile("win.wav");
  edge = minim.loadFile("edge.wav");
  woo = minim.loadFile("woo.mp3");
}
void draw()
{
  if (!startscreen) {
    background(100, 100, 100);
    player();
    wall();
    collisions();
    stats();
    gear(Gx, Gy, rd1, f1);
    gear(Gx2, Gy, rd2, f2);
    Drop1.update();
    Drop2.update();
    Drop3.update();
    Drop4.update();
    Drop5.update();
    Drop6.update();
    Drop7.update();
    Drop8.update();
  } 
  else { 
    background.play();
    startscreen();
  }
}
void startscreen() {
  startsec=millis()/1000;
  startpage = loadImage("startpage.png");
  image(startpage, 0, 0, width, height);
  if (keyPressed == true) {
    if (key == ' ') {
      startscreen =false;
    }
  }
}
/////////////////////////////////////////////////////
////////////////////////// STATS~time  ///////////////
/////////////////////////////////////////////////////
void stats () {
  if (timesgoing) {
    sec = - millis()/1000 +settime+startsec; 
    textSize(20);
    text("time" + ":" + sec, width*.08, height*.05);
    text("life" + ":" + life, width*.08, height*.08);
    if (sec <= 0) {
      looselife();
    }
  }
}
/////////////////////////////////////////////////////
////////////////////////// PLAYER  //////////////////
/////////////////////////////////////////////////////
void player() {
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(px, py, 20, 20);

  if (keyCode == LEFT) {
    px -= speed;
    woo.play();
    woo.rewind();
  } 
  else if (keyCode == RIGHT) {
    px += speed;
  } 
  else if (keyCode == UP) {
    py -= speed;
  } 
  else if (keyCode == DOWN) {
    py += speed;
  }
  else if (keyCode == ESC) {
    py+=0;
    px+=0;
  }
}
void keyPressed() {
  move++;
}
/////////////////////////////////////////////////////
////////////////////////// COLLISIONS  ///////////////
/////////////////////////////////////////////////////
void collisions() {
  if (px <= 0 || px >= width || py >=height) { //edge collision
    looselife();
    edge.play();
    edge.rewind();
  }
  if ((px<=w || px>= (width-w)) && (py>= (ywall) && py<= ywall+40)) {//wall collision
    looselife();
    wall.play();
    wall.rewind();
  }
//  if ((px<=w2 || px>= (width-w2)) && (py>= (ywall+200) && py<= ywall+240)) {//wall collision
//    looselife();
//    wall.play();
//    wall.rewind();
//  }
  if ((dist(px, py, Gx, Gy)<45) || (dist(px, py, Gx2, Gy)<45)) { //gear collision
    looselife();
    gear.play();
    gear.rewind();
  }
  if ((dist(px, py, xpos, ypos)<20)) { //ash collision
    looselife();
    ash.play();
    ash.rewind();
  }
  if (life == 0) {
    gameover();
    loose.play();
  }
  if (py <= 0) { 
    win();
    win.play();
  }
}

/////////////////////////////////////////////////////
////////////////////////// WALL  ////////////////////
/////////////////////////////////////////////////////
void wall () {
  rectMode(CORNER);
  noStroke();
  fill(0);
  rect(0, ywall, w, 30);// left wall
  if (Lopening) {  //Is the left wall opening, true or false?
    w = w-speed; //do this if true
  } 
  else {
    w=w+speed; //do this if false
  }
  if (w >= width/2) {  //left wall opening is true when...

    Lopening =true;
  }
  if (w == 0) {  // left wall opening is false when...
    Lopening=false ;
  }

  rect(width, ywall, -w, 30);//right wall... same as left but negated
  
  // second set of walls
//  
//    rect(0, ywall+200, w2, 30);// left wall
//  if (Lopening2) {  //Is the left wall opening, true or false?
//    w2 = w2-speed+3; //do this if true
//  } 
//  else {
//    w2=w2+speed+3; //do this if false
//  }
//  if (w2 >= width/2) {  //left wall opening is true when...
//
//    Lopening2 =true;
//  }
//  if (w2 == 0) {  // left wall opening is false when...
//    Lopening2=false ;
//  }

//  rect(width, ywall+200, -w, 30);//right wall... same as left but negated
}

/////////////////////////////////////////////////////
////////////////////////// GEAR  ////////////////////
/////////////////////////////////////////////////////
//GEAR SKETCH FROM REONA http://www.openprocessing.org/user/13276

void gear(int gx, int gy, float rd, int f) {
  int rw = 7; //thickness of peg
  int rh = 40; //length of pegs
  int er = 30; //dia of middle part
  Gx = Gx+speed/3;//move the gear
  Gx2 = Gx2+speed/3;//move the second gear
  if (Gx == width+width/2) {
    Gx = -width/2;
  }//warping
  if (Gx2 == width+width/2) {
    Gx2 = -width/2;
  }//warping
  rectMode(CENTER);
  ellipseMode(CENTER);

  fill(160);
  noStroke();

  pushMatrix();
  translate(gx, gy);
  rotate(PI/4+rd);
  tint(100, 10);
  rect(0, 0, rw, rh);
  popMatrix();

  pushMatrix();
  translate(gx, gy);
  rotate(-PI/4.0+rd);
  rect(0, 0, rw, rh);
  popMatrix();

  pushMatrix();
  translate(gx, gy);
  rotate(rd);
  rect(0, 0, rw, rh);
  popMatrix();

  pushMatrix();
  translate(gx, gy);
  rotate(rd);
  rect(0, 0, rh, rw);
  popMatrix();

  pushMatrix();
  translate(gx, gy);
  noStroke();
  ellipse(0, 0, er, er);
  popMatrix();

  pushMatrix();
  translate(gx, gy);
  fill(0);
  noStroke();
  ellipse(0, 0, er/2, er/2);
  popMatrix();

  if (f == 0) {
    rd1 += (speed*0.015);
  }
  else {
    rd2 += (speed*0.015);
  }
}

/////////////////////////////////////////////////////
///////////////////////////////////// ASH  //////////
/////////////////////////////////////////////////////
/////RAIN SKETCH BY Tiuri de Jong http://www.openprocessing.org/user/17019 
class ashDrop {
  ashDrop (float x, float d) {
    depth = d;
    xpos = x;
    ypos = 0;
    Aspeed = 1;
    ashLength = 100/depth;
    ypos -= ashLength;
    if (life == 0) {
      x=width;
      d=height;
    }
  }

  void update() {
    ypos += Aspeed;
    if (ypos > height) {
      ypos = 0-ashLength;
      xpos = random(width);
    }
    strokeWeight(7);
    stroke(0);
    line(xpos, ypos, xpos, ypos+ashLength);
  }
}

/////////////////////////////////////////////////////
///////////////// LOOSE LIFE ~ RESET GAME  //////////
/////////////////////////////////////////////////////
void looselife() {
  if (life<=0) {
    gameover();
  }
  else {
    life = life-1;
    resetgame();
  }
}
void resetgame() {
  px=300;
  py=550;
  keyCode= ESC;
}

/////////////////////////////////////////////////////
////////////////////////// WIN ~ GAMEOVER  //////////
/////////////////////////////////////////////////////
void win() {
  background(0);
  fill (225);
  textSize(40);
  textAlign(CENTER);
  text("good for you \n you saved the light.", width/2, height/3);
  textSize(30);
  text("score" + ":" + (life * sec/move), width/2, height*.60);
  textSize(20);
  text("score calculated: (life x seconds remain)/ moves made", width/2, height*.75);
  speed=0;
  Aspeed=0;
  Gx=width+50;
  Gx2=width+50;
  xpos=width+50;
  ypos=height+50;
  timesgoing=false;//this hides the stats
  if (mousePressed== true) {
    exit();
  }
}

void gameover() {
  //  lose.play();
  background(0);
  fill (255);
  textSize(40);
  textAlign(CENTER);
  text("you've doomed the world\n to darkness.", width/2, height/3);
  textSize(30);
  text("score" + ":" + (life*sec), width/2, height*.60);
  textSize(20);
   text("score calculated: (life x seconds remain)/ moves made", width/2, height*.75);
  speed = 0;
  Aspeed=0;
  stroke(255);
  px=-width*2;
  Gx=width+50;
  Gx2=width+50;
  xpos=width+50;
  ypos=height+50;
  timesgoing=false;//this hides the stats
}

