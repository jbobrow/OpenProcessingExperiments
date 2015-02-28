
////////////////////////////////////////////////////////////////////
// Final Project: BCUSP 161
// Created by Kemal Deger, Eddie Licea, and Nick Jang
// 12-12-13
// Smash all 16 bugs with the golf ball before time runs out to win!
////////////////////////////////////////////////////////////////////




//Image files
PImage ball;
PImage bug;
PImage Grassbackground;

// Font file
PFont font;

// Declare X and Y coordinates for position o the ball
float posX=random(0, 800); 
float posY=random(0, 600);


// Declare randomized X and Y coordinates for 16 individual bugs
float BugX=random(50, 750); 
float BugY=random(0, 550);
float Bug1X=random(50, 750); 
float Bug1Y=random(0, 550); 
float Bug2X=random(50, 750); 
float Bug2Y=random(0, 550); 
float Bug3X=random(50, 750); 
float Bug3Y=random(0, 550); 
float Bug4X=random(50, 750); 
float Bug4Y=random(0, 550); 
float Bug5X=random(50, 750); 
float Bug5Y=random(0, 550);
float Bug6X=random(50, 750); 
float Bug6Y=random(0, 550);
float Bug7X=random(50, 750); 
float Bug7Y=random(0, 550);
float Bug8X=random(50, 750); 
float Bug8Y=random(0, 550);
float Bug9X=random(50, 750); 
float Bug9Y=random(0, 550);
float Bug10X=random(50, 750); 
float Bug10Y=random(0, 550);
float Bug11X=random(50, 750); 
float Bug11Y=random(0, 550);
float Bug12X=random(50, 750); 
float Bug12Y=random(0, 550);
float Bug13X=random(50, 750); 
float Bug13Y=random(0, 550);
float Bug14X=random(50, 750); 
float Bug14Y=random(0, 550);
float Bug15X=random(50, 750); 
float Bug15Y=random(0, 550);


// Declare coordinates for the timer
int tX=0;
int tY=0;


// Bottom of timer rectangle
float rectY=0;

// Declare bugs to start out as visible
boolean BugVisible=true;
boolean Bug1Visible=true;
boolean Bug2Visible=true;
boolean Bug3Visible=true;
boolean Bug4Visible=true;
boolean Bug5Visible=true;
boolean Bug6Visible=true;
boolean Bug7Visible=true;
boolean Bug8Visible=true;
boolean Bug9Visible=true;
boolean Bug10Visible=true;
boolean Bug11Visible=true;
boolean Bug12Visible=true;
boolean Bug13Visible=true;
boolean Bug14Visible=true;
boolean Bug15Visible=true;
boolean Bug16Visible=true;

// Color values for color-changing timer
float Change1 = 255;
float Change2 = 0;
float change3=150;
float x, y;

void setup() {
  background(0);
  size(800, 600);
  frameRate(60);
  
  // Setup image for the ball
  ball = loadImage("ball.png");
  
  // Setup image for the bugs
  bug = loadImage("bug.png");
  
  // Setup image for the grass background
  Grassbackground = loadImage("grass.jpg");
  
  // Setup font for winning and losing notifier
  font = loadFont ("Gautami-48.vlw");
}

void draw() {
  noCursor();
  background(Change2, Change1, 0); //The Timer. Changes color of background from green to red according to timer speed
  Change1-=.23;
  if (Change1<170) {
    Change2+=4;
    Change1-=1;
  }
  timer(tX, tY);
  
  // Duplicated grass image for background
  image(Grassbackground, 50, 0, width/2, height/2);
  image(Grassbackground, width/2, 0, width/2, height/2);
  image(Grassbackground, 50, height/2, width/2, height/2);
  image(Grassbackground, width/2, height/2, width/2, height/2);
  
  // When timer runs out, you lose
  if (rectY>=600) {
    YouLose();
  }
  
  // If the bugs are clicked, then they disappear
  if (BugVisible) {
    bug(BugX, BugY);
    if (mousePressed&&mouseX>BugX-45 && mouseY>BugY-45 && mouseX<BugX+45 && mouseY <BugY+45) {
      BugVisible=false;
    }
  }
  if (Bug1Visible) {
    bug(Bug1X, Bug1Y);
    if (mousePressed&&mouseX>Bug1X-45 && mouseY>Bug1Y-45 && mouseX<Bug1X+45 && mouseY <Bug1Y+45) {
      Bug1Visible=false;
    }
  }
  if (Bug2Visible) {
    bug(Bug2X, Bug2Y);
    if (mousePressed&&mouseX>Bug2X-45 && mouseY>Bug2Y-45 && mouseX<Bug2X+45 && mouseY <Bug2Y+45) {
      Bug2Visible=false;
    }
  }
  if (Bug3Visible) {
    bug(Bug3X, Bug3Y);
    if (mousePressed&&mouseX>Bug3X-45 && mouseY>Bug3Y-45 && mouseX<Bug3X+45 && mouseY <Bug3Y+45) {
      Bug3Visible=false;
    }
  }
  if (Bug4Visible) {
    bug(Bug4X, Bug4Y);
    if (mousePressed&&mouseX>Bug4X-45 && mouseY>Bug4Y-45 && mouseX<Bug4X+45 && mouseY <Bug4Y+45) {
      Bug4Visible=false;
    }
  }
  if (Bug5Visible) {
    bug(Bug5X, Bug5Y);
    if (mousePressed&&mouseX>Bug5X-45 && mouseY>Bug5Y-45 && mouseX<Bug5X+45 && mouseY <Bug5Y+45) {
      Bug5Visible=false;
    }
  }
  if (Bug6Visible) {
    bug(Bug6X, Bug6Y);
    if (mousePressed&&mouseX>Bug6X-45 && mouseY>Bug6Y-45 && mouseX<Bug6X+45 && mouseY <Bug6Y+45) {
      Bug6Visible=false;
    }
  }
  if (Bug7Visible) {
    bug(Bug7X, Bug7Y);
    if (mousePressed&&mouseX>Bug7X-45 && mouseY>Bug7Y-45 && mouseX<Bug7X+45 && mouseY <Bug7Y+45) {
      Bug7Visible=false;
    }
  }
  if (Bug8Visible) {
    bug(Bug8X, Bug8Y);
    if (mousePressed&&mouseX>Bug8X-45 && mouseY>Bug8Y-45 && mouseX<Bug8X+45 && mouseY <Bug8Y+45) {
      Bug8Visible=false;
    }
  }
  if (Bug9Visible) {
    bug(Bug9X, Bug9Y);
    if (mousePressed&&mouseX>Bug9X-45 && mouseY>Bug9Y-45 && mouseX<Bug9X+45 && mouseY <Bug9Y+45) {
      Bug9Visible=false;
    }
  }
  if (Bug10Visible) {
    bug(Bug10X, Bug10Y);
    if (mousePressed&&mouseX>Bug10X-45 && mouseY>Bug10Y-45 && mouseX<Bug10X+45 && mouseY <Bug10Y+45) {
      Bug10Visible=false;
    }
  }
  if (Bug11Visible) {
    bug(Bug11X, Bug11Y);
    if (mousePressed&&mouseX>Bug11X-45 && mouseY>Bug11Y-45 && mouseX<Bug11X+45 && mouseY <Bug11Y+45) {
      Bug11Visible=false;
    }
  }
  if (Bug12Visible) {
    bug(Bug12X, Bug12Y);
    if (mousePressed&&mouseX>Bug12X-45 && mouseY>Bug12Y-45 && mouseX<Bug12X+45 && mouseY <Bug12Y+45) {
      Bug12Visible=false;
    }
  }
  if (Bug13Visible) {
    bug(Bug13X, Bug13Y);
    if (mousePressed&&mouseX>Bug13X-45 && mouseY>Bug13Y-45 && mouseX<Bug13X+45 && mouseY <Bug13Y+45) {
      Bug13Visible=false;
    }
  }
  if (Bug14Visible) {
    bug(Bug14X, Bug14Y);
    if (mousePressed&&mouseX>Bug14X-45 && mouseY>Bug14Y-45 && mouseX<Bug14X+45 && mouseY <Bug14Y+45) {
      Bug14Visible=false;
    }
  }
  if (Bug15Visible) {
    bug(Bug15X, Bug15Y);
    if (mousePressed&&mouseX>Bug15X-45 && mouseY>Bug15Y-45 && mouseX<Bug15X+45 && mouseY <Bug15Y+45) {
      Bug15Visible=false;
    }
  }
  
  // If all bugs are clicked on and disappear, you win
  ball();
  if (BugVisible==false&&Bug1Visible==false&&Bug2Visible==false&&Bug3Visible==false&&Bug4Visible==false&&Bug5Visible==false&&Bug6Visible==false&&Bug7Visible==false&&Bug8Visible==false&&Bug9Visible==false&&Bug10Visible==false&&Bug11Visible==false&&Bug12Visible==false&&Bug13Visible==false&&Bug14Visible==false&&Bug15Visible==false) {
    rectY=598;
    YouWin();
  }
}



// Set ball image to follow cursor
void ball() {  
  image(ball, posX, posY, 50, 50);
  posX=mouseX-25;   
  posY=mouseY-25;   
  if (posX<49) { 
    posX=50;
  }
  if (posX>753) {
    posX=753;
  }
  if (posY>552) {
    posY=552;
  }
  if (posY<-2) {
    posY=-2;
  }
}  

// Draw bug image at random coordinates
void bug(float rX, float rY) {   
  image(bug, rX, rY, 50, 50);
}
void bug2(float rX, float rY) {   
  image(bug, rX, rY, 50, 50);
}


// Color-changing timer bar 
void timer(int tX, int tY) { //Black Bar That makes the background essentially the timer.
  noStroke();
  fill(0);
  rect(0, 0, 50, rectY);
  rectY+=1; //Speed of timer
}

// Inform the user of a loss 
void YouLose() {
  fill(change3, 0, 0);
  change3+=30; //slightly change color when timer ends
  if (change3>250) {
    change3-=10;
    if (change3==change3) {
      change3+=10;
    }
  }
  textFont(font, 80);
  text("You Lose", width/3+20, height/2);
  textFont(font, 30);
  fill(255);
  posX=width/2; //position of ball when timer ends
  posY=height/2+10; // position of ball when timer ends
}

// Inform the user of a win
void YouWin() {
  if (rectY>590) {
    stroke(0);
    fill(255);
    textFont(font, 50);
    text("Winna Winna Chicken Dinna!", width/6-10, height/2);
  }
}



