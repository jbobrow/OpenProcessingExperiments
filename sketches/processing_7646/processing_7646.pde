

int nodeCount = 64;
int shortCount = 15;

float radInc = TWO_PI/nodeCount;

int w = 924;
int h = 450;

int radius = 200;



boolean[] activeRing = new boolean[nodeCount];
boolean[] newRing = new boolean[nodeCount];
boolean[] activeShort = new boolean[shortCount];
boolean[] newShort = new boolean[shortCount];



float nodeSize = 15;
boolean active = false;
  
color onColor = color(0, 190, 255);
color offColor = color(50);



void setup() {
  
  frameRate(26);
  
  size(w, h);
  ellipseMode(CENTER);
  
  smooth();
  
  activeRing[30] = true;
   
}


void draw() {
  
  background(0);
  
  translate(w/2, h/2-10);
  rotate(PI/16);
  
  drawRing();
  drawShortCut();
  shiftRing();
  
  

}



