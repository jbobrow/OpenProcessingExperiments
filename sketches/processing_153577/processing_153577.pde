
// define non-local variables
// general
  int numW = 10;    // number of segments in wheel
  int numB = 5;     // number of save color boxes
// selector wheel
  float wheelX, wheelY, radIn, radOut, radOut2, angle, shift;
  float axleAngle, axleX, axleY, axleDist;
  float mainX, mainY, compX, compY;
  float mainHue, mainBright, compHue, compBright;
  boolean axleLock;
  float sizeMain, sizeComp, sizeCentre;
  color fillMain, fillComp, fillCentre;
// colour boxes at bottom of window
  float bx,by,bw,bh;  // parameters for box rectangles
  float bg;           // gap between boxes
  color boxColorMain[] = new color[numB];
  color boxColorComp[] = new color[numB];
  boolean boxLock[] = new boolean[numB];

void setup(){
  size(700,800);
  colorMode(HSB,360,100,100);
  
// initialise the save color box variable arrays
  for (int i=0;i<numB;i++){
    boxColorMain[i] = color(0,0,100);
    boxColorComp[i] = color(0,0,100);
    boxLock[i] = false;
// setup the selector wheel variables
  wheelX = width/2;
  wheelY = height*0.4;
  radIn = 100;
  radOut = 200;
  radOut2 = radOut * 1.5;
  angle = radians(360/numW);
  shift = PI/2;
// initial values for axle parameters
  mainX = wheelX-(radIn/2+radOut/2);
  mainY = wheelY-0;
  compX = wheelX+radOut2;
  compY = wheelY+0;
  axleLock = true;
  sizeCentre = 10;
  sizeMain = 40;
  sizeComp = 30;
  fillMain = color(0,100,100);
  fillComp = color(180,100,100);
  fillCentre = color(0,100,0);
  }
}

void draw(){
  initFrame();
  initWheel();
  initWheelBase();
  initBoxColor();
  
  drawAxle();
  
}

void initFrame(){
// set basic parameters at start of each frame
  background(0,0,95);
  noStroke();
  noFill();
}

void initWheel(){
//  setup the selector wheel
  beginShape(QUAD_STRIP);
    for (int i=0;i<=numW;i++){
      fill(i*360/numW,100,100);
      vertex(wheelX+radIn * sin(angle*i-shift),wheelY+radIn * cos(angle*i-shift));
      vertex(wheelX+radOut * sin(angle*i-shift),wheelY+radOut * cos(angle*i-shift));}
  endShape(CLOSE);
}

void initWheelBase(){
// setup the 'base' line
  stroke(0,40);
  line(wheelX-radOut,wheelY,wheelX-radOut2,wheelY);
}

void initBoxColor(){
// Create save color boxes and fill with color from boxColor arrays  
  for (int i=0;i<numB;i++){
    bg = 10;
    bh = bw = (width - bg * (numB + 1))/numB;
    bx = bg + i * (bw + bg);
    by = height - (bg + bh);
    
    fill(boxColorMain[i]);
    rect(bx,by,bw,bh);
    fill(boxColorComp[i]);
    rect(bx+bw/4,by+bh/4,bw/2,bh/2);
  }
}

void drawAxle(){
// calculate xy parameters for circles but only if axleLock is false
  if (axleLock == false){
    axleAngle = atan2(mouseY-wheelY,mouseX-wheelX);
    axleDist = dist(mouseX,mouseY,wheelX,wheelY);

    compX = wheelX + cos(axleAngle)*constrain(axleDist,radOut,radOut2);
    compY = wheelY + sin(axleAngle)*constrain(axleDist,radOut,radOut2);

    mainX = wheelX + cos(axleAngle-PI)*(radIn/2+radOut/2);
    mainY = wheelY + sin(axleAngle-PI)*(radIn/2+radOut/2);
    
    mainHue = (axleAngle<0) ? degrees(axleAngle)*-1 : 360 - degrees(axleAngle);
    compHue = (mainHue<180) ? mainHue+180 : mainHue-180;
    mainBright = map(constrain(axleDist,radOut,radOut2),radOut,radOut2,0,100);
    compBright = mainBright;
    
    fillMain = color(mainHue,100.0,mainBright);
    fillComp = color(compHue,100.0,compBright);
    
    noStroke();
    fill(0,0,85);
    ellipse(compX,compY,sizeComp+20,sizeComp+20);
  }  
// Create dotted line as axle for selector
  dottedLine(mainX,mainY,compX,compY,40);
// Centre circle
  fill(fillCentre);
  ellipse(wheelX,wheelY,sizeCentre,sizeCentre);
// Main circle
  fill(fillMain);
  ellipse(mainX,mainY,sizeMain,sizeMain);
// Comp circle
  fill(fillComp);
  ellipse(compX,compY,sizeComp,sizeComp);
  
  println("axleDist: "+axleDist," mainBright: "+mainBright," contrain: "+constrain(axleDist-radOut,0,radOut2-radOut));
}

void boxPopulate(){
  int i=0,j=0;
  for (i=0;i<numB;i++){
    if (boxLock[i]==false && j<1){
      boxColorMain[i]=fillMain;
      boxColorComp[i]=fillComp;
      boxLock[i]=true;
      j=++j;}
  }
}

void dottedLine(float x1, float y1, float x2, float y2, int dotRate){
// Function to create dotted line based on interpolation between x1y1 and x2y2
  float dotRateFloat = (float) dotRate;
  for (int i=0;i<=dotRate;i++){
    float dotX = lerp(x1,x2,i/dotRateFloat);
    float dotY = lerp(y1,y2,i/dotRateFloat);
    stroke(0,100,0);
    strokeWeight(2);
    point(dotX,dotY);    
  }
}

void mousePressed(){
  if (dist(mouseX,mouseY,compX,compY)<=sizeComp){
  axleLock = false;
  }
}

void mouseReleased(){
  if (axleLock==false){
    boxPopulate();}
  axleLock = true;
}


