
/**
 * Lissajous_Generator<br /> 
 * Mouse X- and Y-positions determine the frequencies.
 * 17.04.2011 by peter bosshard schneider
 **/
 
float freqA,freqB;                                  // frequencies
float amplitudeA,amplitudeB;                        // amplitudes
float xValuesA[], xValuesB[],yValuesA[],yValuesB[]; // plotdata
int boxsize;                                        // width and height of a box
float left;                                         // x position of the left boxes
float top;                                          // y position of the top boxes
float bot;                                          // y position of the bottom boxes
float right;                                        // x position of the right boxes
float border;                                       // width of the border
float thetaA,thetaB;                                // angles
PFont schrift;                                      // typeface
color bgClr;                                        // background colour
color faClr;                                        // frequency A colour
color fbClr;                                        // frequency B colour
color fsClr;                                        // frequency S (A+B) colour
color boClr;                                        // box border and text colour

void setup() {
  size(600,600,JAVA2D);
  bgClr = color(51);
  faClr = color(255,153,0);
  fbClr = color(0,153,255);
  fsClr = color(255,153,255);
  boClr = color(102,102,102);
  background(bgClr);
  noStroke();
  smooth();
  fill(fsClr);
  rectMode(CORNER);
  border = 10.0;
  boxsize = floor((width-(3*border))/2.0);
  left = border;
  top = border;
  bot = top+border+boxsize;
  right =left+border+boxsize;
  xValuesA = new float[boxsize];
  xValuesB = new float[boxsize];
  yValuesA = new float[boxsize];
  yValuesB = new float[boxsize];
  thetaA = 0.0;
  thetaB = 0.0;
  freqA = 2.0;
  freqB = 3.0;
  amplitudeA = amplitudeB = boxsize/2.0;
  schrift = loadFont("SansSerif-48.vlw");
  textFont(schrift);
  textAlign(CENTER);
}

void draw() {
  // check mouse position
  freqA = mouseX;
  freqB = mouseY;
  
  // recalculate the plot data
  reCalculate();
  
  background(bgClr);
  noFill();
  // connect the plot data points
  for(int i= 1; i<boxsize;i++) {
    // frequency A
    stroke(faClr);
    line(left+(boxsize/2)+xValuesA[i-1], top  + yValuesA[i-1],left+(boxsize/2)+xValuesA[i], top  + yValuesA[i]);
    // frequency B
    stroke(fbClr);
    line(right+i-1, bot + boxsize/2 + yValuesB[i-1],right+i, bot + boxsize/2 + yValuesB[i]);
    // frequency S (A+B)
    stroke(fsClr);
    line(left+(boxsize/2)+xValuesA[i-1], bot+(boxsize/2) + yValuesB[i-1],left+(boxsize/2)+xValuesA[i], bot+(boxsize/2) + yValuesB[i]);
  }
  noStroke();
  // show the proportions of the frequencies as rectangles and as text
  float da = boxsize/(freqA + freqB) * freqA;
  float db = boxsize - da;
  fill(faClr);
  rect(right,top,da,boxsize);
  fill(fbClr);
  rect(right + da,top,db,boxsize);
  fill(boClr);
  String txt = int(freqA) + " : " + int(freqB);
  text(txt,right+boxsize/2,top + (boxsize/2)+24);
  noFill();
  // draw border of the boxes
  stroke(boClr);
  rect(right,bot,boxsize,boxsize);
  rect(left,top,boxsize,boxsize);
  rect(left,bot,boxsize,boxsize);
  rect(right,top,boxsize,boxsize);
}

void reCalculate() {
  for(int i=0;i<boxsize;i++) {
    thetaA = TWO_PI/boxsize*i*freqA;
    xValuesA[i] = amplitudeA*sin(thetaA);
    yValuesA[i] = i;
    thetaB = TWO_PI/boxsize*i*freqB;
    xValuesB[i] = i;
    yValuesB[i] = amplitudeB*cos(thetaB);
  }
}

// save an image (uncomment the following lines if not used in an applet) 
 
//void keyPressed() {
//  switch(key) {
//  case 's':
//    save("Lissajous.png");
//    break;
//  }
//}


