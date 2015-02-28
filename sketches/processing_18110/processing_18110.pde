
//declare them variables

boolean button = false;
int leaf = 10;

int canvasX = 200;
int canvasY = 200;
int ballMove = 45;

int coloR = 255;
int coloG = 255;
int coloB = 255;
int fillColor = 255;

int bStroke = 0;
float sStroke = .75;
int mStroke = 1;
float lStroke = 1.75;

int bodyW = 76;
int bodyH = 61;

int bulbW = 33;
int bulbH = 48;

int headX = 70;
int headY = 64;

float ballA = 31.5;
float ballB = 29.88;
float ballC = 6.85;
float ballD = 3.28;

int dotX;
int dotY;

// bulbasaur!

void setup() {
  size(canvasX,canvasY);
  smooth();
  frameRate(ballMove);
}


void draw() {
  colorMode(RGB);
  background(coloR-18,coloG-44,coloB-87);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  
  //body
  stroke(bStroke);
  strokeWeight(lStroke);
  fill(coloR-255,coloG-80,coloB-97);
  ellipse(width-107,height-84,bodyW,bodyH);

  //bulbs
  stroke(bStroke);
  strokeWeight(lStroke);
  fill(coloR-255,coloG-113,coloB-180);
  ellipse(width-128,height-119,bulbW,bulbH);
  ellipse(width-95,height-124,bulbW,bulbH-10);
  ellipse(width-112,height-128,bulbW,bulbH);
  
  //ears
  fill(coloR-255,coloG-80,coloB-97);
  triangle(width-122,height-125,width-92,height-121,width-116,height-96);
  triangle(width-62,height-117,width-38,height-118,width-50,height-93);
  
  //head
  strokeWeight(lStroke);
  ellipse(width-81,height-91,headX,headY);
  
  //eyes
  fill(fillColor-255);
  noStroke();
  ellipse(width-84,height-90,6,11);
  ellipse(width-58,height-87,6,11);
  //pupils
  fill(fillColor);
  noStroke();
  ellipse(115+mouseX/100,109+mouseY/70,3,5);
  ellipse(142+mouseX/100,112+mouseY/70,3,5);
  
  //mouth
  stroke(bStroke);
  line(width-81,height-76,width-62,height-75);
  
  //splotches
  fill(coloR-254,coloG-151,coloB-165);
  stroke(bStroke);
  triangle(width-81,height-110,width-69,height-111,width-75,height-99);
  triangle(width-64,height-106,width-67,height-100,width-59,height-101);
  triangle(width-70,height-99,width-73,height-97,width-70,height-94);
  triangle(width-139,height-92,width-129,height-85,width-140,height-79);
  triangle(width-134,height-78,width-130,height-78,width-132,height-75);
  triangle(width-127,height-70,width-121,height-70,width-124,height-63);
  
  //nubby legs
  fill(coloR-255,coloG-80,coloB-97);
  strokeWeight(sStroke);
  triangle(width-136,height-64,width-133,height-62,width-137,height-60);
  triangle(width-123,height-55,width-119,height-54,width-122,height-51);
  triangle(width-93,height-54,width-89,height-55,width-90,height-52);
  
  //pokeball
  fill(fillColor);
  strokeWeight(sStroke);
  ellipse(mouseX,mouseY,ballA,ballA);
  fill(coloR-18,coloG-227,coloB-189);
  ellipse(mouseX,mouseY-2.75,ballB,ballB-3.87);
  fill(fillColor);
  strokeWeight(mStroke);
  ellipse(mouseX,mouseY+10.26,ballC,ballC);
  strokeWeight(sStroke);
  ellipse(mouseX,mouseY+10.26,ballD,ballD);
  
  
// Razor Leaf
  if ( mousePressed ) {
    button = true;
  } else {
    button = false;
  }
   
   
  if (button) {
        noStroke();
    fill(random(0),random(25,255),random(45,100));

    ellipse(random(mouseX),random(mouseY),leaf,leaf);
    ellipse(random(mouseX+75),random(mouseY+75),leaf+7,leaf);
    ellipse(random(mouseX+100),random(mouseY+100),leaf,leaf+7);
    ellipse(random(mouseX+100),random(mouseY+100),leaf+5,leaf);
   
  }
     
  }
