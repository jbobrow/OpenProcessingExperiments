
int nX,nY;
float rS, rM, rH;
color cBg, cS, cM, cH, cText;
PFont myFont;
float fTextAscent;
boolean bShowNumbers;

void setup() {
  size(480,480);
  strokeWeight(40);
  
  myFont = loadFont("Frutiger65-Bold-200.vlw");
  textFont(myFont);
  textSize(20);
  fTextAscent = textAscent()/2;
  bShowNumbers = true;
  
  nX = width/2;
  nY = height/2;
  
  rS = 400;
  rM = 250;
  rH = 100;
  
  cBg = color(#000000);
  cS = color(#cc0000);
  cM = color(#00cc00);
  cH = color(#0000cc);
  cText = color(#ffffff);
}

void draw() {
  //clear the screen
  background(cBg);
  //calculate the arc angles
  float s = map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m = map(minute(),0,60,0,TWO_PI)-HALF_PI;
  float h = map(hour(),0,24,0,TWO_PI)-HALF_PI;
  //draw the seconds arc
  stroke(cS);
  noFill();
  arc(nX,nY,rS,rS,0-HALF_PI,s);
  //draw the minutes arc
  stroke(cM);
  arc(nX,nY,rM,rM,0-HALF_PI,m);
  //draw the hours arc
  stroke(cH);
  arc(nX,nY,rH,rH,0-HALF_PI,h);
  
  if(bShowNumbers) {
    fill(cText);
    //draw the second digits
    float fSTextX = rS/2*cos(s);
    float fSTextY = rS/2*sin(s);
    float fSWidth = textWidth(str(second()))/2;
    text(str(second()),nX+fSTextX-fSWidth,nY+fSTextY+fTextAscent);
    //draw the minute digits
    float fMTextX = rM/2*cos(m);
    float fMTextY = rM/2*sin(m);
    float fMWidth = textWidth(str(minute()))/2;
    text(str(minute()),nX+fMTextX-fMWidth,nY+fMTextY+fTextAscent);
    //draw the hour digits
    float fHTextX = rH/2*cos(h);
    float fHTextY = rH/2*sin(h);
    float fHWidth = textWidth(str(hour()))/2;
    text(str(hour()),nX+fHTextX-fHWidth,nY+fHTextY+fTextAscent);
  }
}

void keyReleased() {
  if(key=='n')
    bShowNumbers = !bShowNumbers;
}


