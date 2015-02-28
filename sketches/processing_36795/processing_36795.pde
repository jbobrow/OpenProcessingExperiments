
void setup() {
  size(500,500);
  background(255);
  frameRate(25);
  smooth();
}

// VARIABLES

//orange

float orangeRand;
int orangeSize = 500;
int orangeStart = 180;
int orangeEnd =270;

//blue

float blueRand;
int blueSize = 500;
int blueStart = 225;
int blueEnd =235;


void draw() {
  
  // FADE

  noStroke();
  rectMode(CORNERS);
  fill(100,1);
  rect(0,0,500,500);
  
  // ORANGE ARC

  orangeRand = random(0,100);

  if (orangeRand < 50) {
    orangeSize+=18;
  }
  else {
    orangeSize-=20;
  }

  if (orangeSize < 1) {
    orangeSize = 450;
  }

  fill(255,180,0,25);
    if (orangeSize > 499) {
   fill(255,5);
  }
  strokeWeight(3);
  stroke(255);

  arc (250,250,orangeSize,orangeSize,radians(orangeStart), radians(orangeEnd));
  orangeStart+=1;
  orangeEnd+=1;
  
  
  // BLUE ARC
  
   blueRand = random(0,100);

  if (blueRand < 50) {
    blueSize+=18;
  }
  else {
    blueSize-=20;
  }

  if (blueSize < 1) {
    blueSize = 450;
  }

  fill(39,133,144,20);
    if (blueSize > 499) {
   fill(255,5);
  }
  strokeWeight(5);
  stroke(13,229,255,40);

  arc (250,250,blueSize,blueSize,radians(blueStart), radians(blueEnd));
  blueStart-=4;
  blueEnd-=4;

}



