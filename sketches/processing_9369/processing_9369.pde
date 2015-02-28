
//     Christoph Lueder 
//
//     2010
//
//     www.lueder.info




int dd = 50;
int[] xpos = new int[dd];
int[] ypos = new int[dd];
int[] startColorH = new int[dd];
int[] startColorS = new int[dd];
int[] startColorB = new int[dd];
int[] maxX = new int[dd];
int[] maxY = new int[dd];
int[] maxXs = new int[dd];
int[] maxYs = new int[dd];
int[] profX = new int[dd];   // profile of the ellipse depending on speed
int[] profY = new int[dd];
float[] speedX = new float[dd];
float[] speedY = new float[dd];
int[] spLim = new int[dd]; // speed limit
float [] dc = new float[dd];  // ellipse orientation

float startX; // for recording mouse position
float startY;
int xbefore; // record x and y position for collison control
int ybefore;
float h; // colors
float s; 
float b;
int al = 99; // transparency alphaof lines
float af = 9; // transparency alphaof fill
float alpb = 30;   // transparency alpha of background wipe
int mp;   // record mouse input for transparency control
boolean ms;   //record mouse position for size determination
float dir; // direction of ellipse
int saturSpeed;
int brightSpeed;
int propRestrict = 3; // restrict maxX to maxY proportions
float ff; // for toggling wire - fill
int mf = 0;   // toggle fill mixed wireframe number tangent
int mC;   // counting ellipses made
boolean sR = false;   // toggle size restriction on/off 
int connect = 0;   // toggle connection off/on/stick 
int paint = 2; // toggle paint - white absorb - black absorb 
int invertLighten; // lighten ellipse up when inverted
float saveincr; // numbering saved snapshots

PFont font10b;
PFont font12b;
PFont font10;



void setup (){
  //size(1440, 900); 
  //
  size(900, 600); 
  frameRate (30);
  smooth();
  colorMode(HSB, 100);

  // Initialize array
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
    startColorH[i] = 0;
    startColorS[i] = 0;
    startColorB[i] = 0;
    maxX[i] = 0;
    maxY[i] = 0;
    maxXs[i] = 0;
    maxYs[i] = 0;
    profX[i] = 0;
    profY[i] = 0;
    speedX[i] = 0;
    speedY[i] = 0;
    dc[i] = 0;
  }

  //cursor and fonts
  cursor(CROSS);
  font10b = loadFont ("DINBold-10.vlw");
  font12b = loadFont ("DINBold-12.vlw");
  font10 = loadFont ("DIN-10.vlw");
} 


void draw () { 

  bgColor();

  // draw input ellipse
  if (ms == true) {
    ellipseMode(CORNERS);
    stroke(10);
    strokeWeight(1);
    ellipse(startX, startY, mouseX, mouseY);
  }

  // draw everything
  for (int i = 0; i < xpos.length-1; i++) {

    controls(i);

    drawEllipses(i);

    controlButtons(i);

  }
}











