
/* 
 Hit and Return with a Score Board. "Neutron Dodge"
 try to keep the nuetrons out of the mars grass and if you get 15 you distract the 
 Double Click the Text on the intro page "Click Here to Start" 
 
*/

PImage startscreen;
PImage level_1_; 
PImage level_2;
PImage level_3;

float neutronx = width - 100; // don't change
float neutrony = height/2;   
float yspeed = 6;     
float xspeed = 6; 
int scoreboard = 0;       // scoreboard start
float colorchange;        // change the color of the neutron

PFont font; // font 
int x = 0;
int page = 1; // stores the current page
int score = scoreboard;
int start = 1;
int pause = 3;


/////////////////////////////////////////////////////////////////////////// Setup

void setup() {
  size(640, 480);
  
  background(0);
  fill(255);
  noStroke();
  smooth();
  frameRate(30);
  
  // load images
  startscreen = loadImage("start_screen10.png");
  level_1_ = loadImage("level_1_.png");
  level_2 = loadImage("level_2.png");
  level_3 = loadImage("level_3.png");
   
  // load font
 
  font = loadFont("cube.vlw");  // boxy font loaded in
  textAlign(CENTER);
  fill(191,215,59); // lime green
}
////////////////////////////////////////////////////////////////////////// Page 1 -- Start Screen

void draw() {
  
  if(page == 1) { // 
    background(startscreen);
    noLoop();
    
    
////////////////////////////////////////////////////////////////////////// PAGE 2 -- Level One -- blue sun pic
  } 
  else if (page == 2) {  // Level One
    background(level_1_);
    neutron();
    robot();
    bounce();
    smooth();
    textFont(font, 20);
    textAlign(CENTER);
    text(scoreboard, 320, 45); // scoreboard font and location. page 2


////////////////////////////////////////////////////////////////////////// PAGE 3 -- Level Two --red sun pic
  } 
  else if (page == 3) {  // Restart Screen
    background(level_2);
    neutron();
    robot();
    bounce();
    smooth();
    textFont(font, 22);
    textAlign(CENTER);
    text(scoreboard, 324, 54); // scoreboard font and location. page 2


////////////////////////////////////////////////////////////////////////// PAGE 4 -- Level 3 --green sun pic
  } 
  else if (page == 4) {  // Restart Screen
    background(level_3);
    neutron();
    robot();
    bounce();
    smooth();
    textFont(font, 22);
    textAlign(CENTER);
    text(scoreboard, 324, 54); // scoreboard font and location. page 2

////////////////////////////////////////////////////////////////////////// 


/*PAGE zero- change this you don't need a restart screen just a button */

  } 
  else if (page == 10) {  // Pause Screen at the very end page 10
   background(0);
    noLoop();
    textFont(font, 22);
    textAlign(CENTER);
    text("Pause", 240, 160); 
 }  else if (page == 0) {  // Restart Screen is 0
   background(0);
    noLoop();
    textFont(font, 22);
    textAlign(CENTER);
    text("Restart", 240, 160);   

} 
}
////////////////////////////////////////////////////////////////////////// neutron/nuetron options

void neutron() {
  neutronx += xspeed;
  neutrony += yspeed;
  if(neutronx <= 0 || neutronx >= width - 10) {
    xspeed = -xspeed;
  }
  if(neutrony <= 0 || neutrony >= height - 10) {
    yspeed = -yspeed;
  }
  fill(colorchange - mouseX, mouseY,255);
  ellipse(neutronx, neutrony, 10, 10);
}
////////////////////////////////////////////////////////////////////////// robot/ tennis racket options

void robot() {  // Robot Head and birds eye view body.
  rectMode(CENTER);
  fill(255);
  ellipse(20, mouseY, 30, 60);
}

////////////////////////////////////////////////////////////////////////// bounce and action of game
void bounce() {    
  if(neutronx <= 30) { 
    if (neutrony >= mouseY - 30 && neutrony <= mouseY +30) { 
      xspeed = -xspeed;  // reverses direction


      if(scoreboard >= 5) {  // goes to the next level for and each point added.
        page = 3;
      }
      
      if (scoreboard >= 10) {  // goes to the next level for and each point added.
        page = 4;
      }
if (-xspeed < 0) {
  scoreboard ++;
}
  }
  if(neutronx <= 5) {  // off the screen the reset
   reset ();

  }
}
}
void reset() {
  neutronx = width - 100;
  neutrony = height /2;
  xspeed = 5;
  yspeed = 5;
  scoreboard = 0;
  
}
////////////////////////////////////////////////////////////////////////// MOUSE Pressed Options

void mousePressed() {
  if(page==1) {
    loop();        // so the neutron can move loop the page with moving images
    page = 2;
   
    
  }
}


////////////////////////////////////////////////////////////////////////// END! 






