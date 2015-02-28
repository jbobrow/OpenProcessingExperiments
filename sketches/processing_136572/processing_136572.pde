
/* @pjs preload="Chicago_Bulls.jpg, VintageMJ.png, MichaelJordan.png, lelbron.png, scottypippenmj.jpg, mjtowel.png" ; font = "Athletic.TTF"; */


int myState = 1 ;
int ax = 800;
int ay = 600;
int bx = 450;
int by = 658;
int dx = 190;
int dy = 190;

int myCounter = 0;
float cx = 0;
float cy = 0;

PImage bullsbackground;
PImage VintageMJ;
PImage MichaelJordan;
PImage lelbron;
PImage scottypippen;
PImage mjtowel;
PFont Athletic;

void setup() {
  size(800, 600);
  frameRate(60);
  bullsbackground = loadImage("Chicago_Bulls.jpg");
  VintageMJ = loadImage("VintageMJ.png");
  MichaelJordan = loadImage("MichaelJordan.png");
  lelbron = loadImage("lelbron.png");
  scottypippen = loadImage("scottypippenmj.jpg");
  mjtowel = loadImage("mjtowel.png");
  Athletic = createFont("Athletic.TTF", 100);
  
}

void draw() {
    image(bullsbackground, 0, 0, width, height) ;

  switch(myState) {
    case 1:
    fill(#FFFFFF);
    textAlign(CENTER, CENTER) ;
    textFont(Athletic);
    text("CLICK DA BULL", 400, 570) ;
    
    break;
    
    case 2:
    image(VintageMJ, ax , ay , 312, 470);
    ax = ax - 3;
    if (ax < -200) {
      ax = width; 
    }
     ay = ay - 3; 
    if (ay < -400) {
      ay = height;
    }
    textSize(30);
    text("MICHAEL JORDAN...", 400, 200) ;
    break;
    
    case 3:
    image(MichaelJordan, 0, 0, bx, by);
    bx = bx + 1;
    by = by + 1;
    
    textSize(20);
    text("...THE GREATEST OF ALL TIME", 650, 500) ;
    break;
    
    case 4:
    background(#000000);
    image(lelbron, 0, 0, dx, dy);
    dx = dx + 2;
    dy = dy +2;
    myCounter = myCounter +5;
    
    cx = random(700);
    cy = random(500);
    
    if (myCounter > 5) {
      image(lelbron, cx, cy);
    myCounter = 0 ;
    }
    
   textSize(50);
   text("B-BUT...WHAT ABOUT ME", 400, 300);
      text("KING LEBETA JAMES", 400, 500);
    break;
    
    case 5:
    image(scottypippen, 0, 0, 800, 620);
    break;
    
    case 6:
    image(mjtowel, 500, 250, 295, 400);
    textSize(30);
    text("6 RINGS, LEBRICK. I AM THE G.O.A.T.", 300, 400);

  }
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 6) {
    myState = 1 ;
    
  }
  println(mouseX +","+mouseY);
}


