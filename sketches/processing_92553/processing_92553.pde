
//Testbed for manually writing (minimalist) graphical routines
//I've got a 256x64 OLED screen that's yellow and has 2 bits of data per pixel
//Since getting that running is slow I wanted to do some graphical stuff beforehand
//   and test it to make sure I had at least some idea what I was doing.

//Kevin Janesch
// March 10&11, 2013

routines display;

int counter = 0;

//heights and locations of all the markers for the compass bit
byte[] compassLookup = {'N', 2, 3, 2, 4, 2, 3, 2,'o', 2, 3, 2, 4, 2, 3, 2, 
                        'E', 2, 3, 2, 4, 2, 3, 2,'f', 2, 3, 2, 4, 2, 3, 2,
                        'S', 2, 3, 2, 4, 2, 3, 2,'t', 2, 3, 2, 4, 2, 3, 2,
                        'W', 2, 3, 2, 4, 2, 3, 2,'x', 2, 3, 2, 4, 2, 3, 2};

//upward-pointing triangle thing
byte[][] TRI_UP = {
  {-1,-1,-1, 0, 2, 0,-1,-1,-1},
  {-1,-1, 0, 2, 3, 2, 0,-1,-1},
  {-1, 0, 2, 3, 3, 3, 2, 0,-1},
  { 0, 2, 3, 3, 3, 3, 3, 2, 0},
  { 0, 2, 3, 3, 3, 3, 3, 2, 0}};

//downward-pointing triangle thing
byte[][] TRI_DOWN = {
  { 0, 2, 3, 3, 3, 3, 3, 2, 0},
  { 0, 2, 3, 3, 3, 3, 3, 2, 0},
  {-1, 0, 2, 3, 3, 3, 2, 0,-1},
  {-1,-1, 0, 2, 3, 2, 0,-1,-1},
  {-1,-1,-1, 0, 2, 0,-1,-1,-1}};

//compund 'NE' character
byte[][] CHAR_NE = {
  { 3, 0, 0, 3, 0, 0, 0},
  { 3, 3, 0, 3, 0, 0, 0},
  { 3, 0, 3, 3, 3, 3, 3},
  { 3, 0, 1, 3, 3, 0, 0},
  { 0, 0, 0, 0, 3, 3, 0},
  { 0, 0, 0, 0, 3, 0, 0},
  { 0, 0, 0, 0, 3, 3, 3}};
//compund 'SE' character
byte[][] CHAR_SE = {
  { 0, 3, 3, 0, 0, 0, 0},
  { 3, 0, 0, 0, 0, 0, 0},
  { 0, 3, 0, 3, 3, 3, 0},
  { 0, 0, 3, 3, 0, 0, 0},
  { 3, 3, 0, 3, 3, 3, 0},
  { 0, 0, 0, 3, 0, 0, 0},
  { 0, 0, 0, 3, 3, 3, 0}};
//compund 'NW' character
byte[][] CHAR_NW = {
  { 3, 0, 0, 3, 0, 0, 0},
  { 3, 3, 0, 3, 0, 0, 0},
  { 3, 0, 3, 3, 0, 0, 3},
  { 3, 0, 1, 3, 0, 0, 3},
  { 0, 0, 0, 3, 0, 0, 3},
  { 0, 0, 0, 3, 0, 3, 3},
  { 0, 0, 0, 3, 3, 0, 3}};
//compund 'SW' character
byte[][] CHAR_SW = {
  { 0, 3, 3, 0, 0, 0, 0},
  { 3, 0, 0, 0, 0, 0, 0},
  { 0, 3, 0, 3, 0, 0, 3},
  { 0, 0, 3, 3, 0, 0, 3},
  { 3, 3, 0, 3, 0, 0, 3},
  { 0, 0, 0, 3, 0, 3, 3},
  { 0, 0, 0, 3, 3, 0, 3}};
//"N"
byte[][] CHAR_N = {
  { 3, 0, 0, 0, 3},
  { 3, 3, 0, 0, 3},
  { 3, 0, 3, 0, 3},
  { 3, 0, 3, 0, 3},
  { 3, 0, 3, 0, 3},
  { 3, 0, 0, 3, 3},
  { 3, 0, 0, 0, 3}};
//"S"
byte[][] CHAR_S = {
  { 0, 3, 3, 3, 0},
  { 3, 0, 0, 0, 3},
  { 3, 0, 0, 0, 0},
  { 0, 3, 3, 3, 0},
  { 0, 0, 0, 0, 3},
  { 3, 0, 0, 0, 3},
  { 0, 3, 3, 3, 0}};
//"E"
byte[][] CHAR_E = {
  { 3, 3, 3, 3, 3},
  { 3, 0, 0, 0, 0},
  { 3, 0, 0, 0, 0},
  { 3, 3, 3, 3, 0},
  { 3, 0, 0, 0, 0},
  { 3, 0, 0, 0, 0},
  { 3, 3, 3, 3, 3}};
//"W"
byte[][] CHAR_W = {
  { 3, 0, 0, 0, 3},
  { 3, 0, 0, 0, 3},
  { 3, 0, 0, 0, 3},
  { 3, 0, 3, 0, 3},
  { 3, 0, 3, 0, 3},
  { 0, 3, 0, 3, 0},
  { 0, 3, 0, 3, 0}};

void setup(){
  
  frameRate(15);
  size(1024, 256);

  display = new routines(this, 256, 64, 4, false);
  fill(0);
}

void draw(){
  background(0);
  //display.drawCircle(32, 32, 20);
  //counter to radians operation
  float handpos = PI/2-PI/180*counter;
  float handpos_prev = PI/2-PI/180*(counter-20);
  
  display.setIntensity(3);
  //circle inside ring, opposite the line
  display.drawCircle(32-round(23*cos(handpos)), 32+round(23*sin(handpos)), 6);
  display.drawArc(32, 32, 23, PI+handpos+.25, PI+handpos-.25); //ring intersecting circle
  display.drawArc(32, 32, 30, handpos_prev, handpos);  //heavy ring
  display.drawArc(32, 32, 31, handpos_prev, handpos);
  display.drawArc(32, 32, 32, handpos_prev, handpos);
  display.drawLine(32, 32, 32+round(31*cos(handpos)), 32-round(31*sin(handpos))); //line from center to ring
  //display.drawLine(32-round(32*cos(handpos)), 32+round(32*sin(handpos)),
  //                 32-round(20*cos(handpos)), 32+round(20*sin(handpos)));
  //display.drawRect(10, 10, 30, 30);
  
  //draw the compass based on the above radians
  compass(handpos);
  display.setIntensity(3);  //reset the brightness to be on the safe side

  display.draw();     //draw the pixels to the screen
  display.setAll(0);  //clear the frame
  counter++;
  
  strokeWeight(6);
  stroke(100);
  arc(256.0, 128.0, 120.0, 120.0, handpos_prev, handpos);
  strokeWeight(1);
  stroke(20);
}

void compass(float heading){
  //putting these constants here to make twiddling with them easier.
  int compcenter = 158;
  int compwidth  = 184;
  int npoints    = compassLookup.length;
  int degstep    = 360/npoints;
  //int x = 156+round(96*cos(-heading));
  
  //draw the fancy frame and center marker
  display.drawRect(compcenter-compwidth/2-4, 53, compwidth+8, 11);
  display.setBlock(compcenter-4, 50, TRI_DOWN);

  float deg = degrees(heading%TWO_PI);
  
  //the center array element to display. ain't integer math neat?
  int centeri = floor(deg)/degstep;
  //alt: floor((heading%TWO_PI)*4)
  
  //handle the heading not exactly lining up to one of the steps in the array
  //adds one element to one side and drops from the other
  //unless it's dead-on.
  byte offset = 0;
  if(     deg%degstep < degstep/2) offset = -1;
  else if(deg%degstep > degstep/2) offset = 1;
  
  //min and max indicies for fetching compass tick marks
  int minIndex = centeri-npoints/4+offset+1;
  int maxIndex = centeri+npoints/4+offset;
  
  for(int i=minIndex; i<=maxIndex; i++){
    //x position based on sine of heading angle and the offset of that tick mark
    int x = compcenter+round(compwidth/2*sin(radians(i*degstep)-heading));
    
    //make sure the index is properly bounded before accessing the array
    //since java doesn't allow negative indicies like python
    int ilook = rerange(i, 0, npoints);
    //draw the line specified. If it's a line and not a character
    if(compassLookup[ilook]<5){
      display.setIntensity(compassLookup[ilook]-1);
      display.drawLine(x, 63, x, 63-2*compassLookup[ilook]);
    }
    //non-line elements. just a big switch to pick them out.
    else{
      display.setIntensity(3);
      switch(compassLookup[ilook]){
        case 'N':
          display.setBlock(x-2, 63-7, CHAR_N);
          break;
        case 'o':
          display.setBlock(x-3, 63-7, CHAR_NE);
          break;
        case 'E':
          display.setBlock(x-2, 63-7, CHAR_E);
          break;
        case 'f':
          display.setBlock(x-3, 63-7, CHAR_SE);
          break;
        case 'S':
          display.setBlock(x-2, 63-7, CHAR_S);
          break;
        case 't':
          display.setBlock(x-3, 63-7, CHAR_SW);
          break;
        case 'W':
          display.setBlock(x-2, 63-7, CHAR_W);
          break;
        case 'x':
          display.setBlock(x-3, 63-7, CHAR_NW);
          break;
      }
    }
  }
}
//re-range a value between 0 and max.
//by re-range I mean wrap, not modulo or scale.
int rerange(int i, int max){
  return rerange(i, 0, max);
}

//re-range a value between min and max
//by re-range I mean wrap, not modulo or scale.
int rerange(int i, int min, int max){
  while(i < min)  i+=(max-min);
  while(i >= max) i-=(max-min);
  return i;
}

