
/*
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Julio Montabes 
 * Copyright (c) 2014 Julio Montabes
 *
 * This program shows the actual time and combines 
 * the three basic colours in a unique combination that
 * will not be repeated until 12 hours later.
 *
 * Click 's' key to print a copy of the screen.
 * 
 */

float red;
float green;
float blue;

float centerX=0;
float centerY=0;
float paletteRadius=0;

float cHour=hour();
float cMinute=minute();
float cSecond=second();

float redOffset;
float greenOffset;
float blueOffset;

PFont myFont=createFont("Tahoma", 32);


void setup() {
  size(600, 600);
  colorMode(RGB);

  textFont(myFont);
  redOffset=degrees((-((float)(cHour<12? cHour : cHour-12)/12*TWO_PI)+HALF_PI));
  if (redOffset<0) redOffset+=360;
  greenOffset=degrees((-((float)cMinute/60*TWO_PI)+HALF_PI)); 
  if (greenOffset<0) greenOffset+=360;
  blueOffset=degrees((-((float)cSecond/60*TWO_PI)+HALF_PI)); //340;
  if (blueOffset<0) blueOffset+=360;

  // initialise the colour variables
  red = 0;
  blue = 0;
  green = 0;
  background(red, green, blue);
  centerX = width/2;
  centerY = height/2;
  paletteRadius = 0.9*width/2;
  drawPalette();
  drawColorCircles();
} // END OF setup


float newX(float oldX, float oldXnew0, float newZoom) {
  return (oldX-oldXnew0)*newZoom;
} // END OF newX
float newY(float oldY, float oldYnew0, float newZoom) {
  return (oldY-oldYnew0)*newZoom;
} // END OF newY

float angle(float x, float y) {
  float ang = x==0? 90:degrees(atan(y/x));
  if (x==0) {
    ang=90;
  } else if (x<0) { // based on tan(alpha)=-tan(alpha+PI)
    ang=degrees(PI+atan(y/x));
  } else {
    ang=degrees(atan(y/x));
  }
  if (ang<0) {
    ang+=360;
  }
  return ang;
} // END OF angle


void draw() {
  int secondJump=1;
  if (cHour!=hour() || cMinute!=minute() || floor(cSecond/secondJump)!=floor(second()/secondJump)) {
    drawColorCircle(blueOffset, 55, color(0, 0, 0), "");
    cSecond=second();
    blueOffset=degrees((-(cSecond/60*TWO_PI)+HALF_PI)); //340;
    if (blueOffset<0) blueOffset+=360;
    drawColorCircles();

    drawColorCircle(greenOffset, 55, color(0, 0, 0), "");
    cMinute=minute()+cSecond/60;
    greenOffset=degrees((-(cMinute/60*TWO_PI)+HALF_PI)); 
    if (greenOffset<0) greenOffset+=360;
    drawColorCircles();

    drawColorCircle(redOffset, 55, color(0, 0, 0), "");
    cHour=hour()+cMinute/60;
    redOffset=degrees((-((cHour<12? cHour : cHour-12)/12*TWO_PI)+HALF_PI));
    if (redOffset<0) redOffset+=360;
    drawColorCircles();

    drawPalette();
  }
} // END OF draw

void drawPalette() {
  for (int ang=0; ang<360; ang++) { 
    int r=colorAngle(ang, redOffset);
    int g=colorAngle(ang, greenOffset);
    int b=colorAngle(ang, blueOffset);
    drawRay(ang, r, g, b);
  }
}

void mouseClicked() {
  //drawPalette();
} // END OF mouseClicked


void mouseReleased() {

  if (colorClicked(redOffset)) {
    redOffset=angle((mouseX-centerX), (centerY-mouseY));
    drawPalette();
  }
  if (colorClicked(greenOffset)) {
    greenOffset=angle((mouseX-centerX), (centerY-mouseY));
    drawPalette();
  }
  if (colorClicked(blueOffset)) {
    blueOffset=angle((mouseX-centerX), (centerY-mouseY));
    drawPalette();
  }
} // END OF mouseReleased


void keyPressed() {
  if (key=='s') {
    saveFrame(""+year()+"-"+month()+"-"+day()+" "+hour()+minute()+" rainbowPalette.jpg");
  }
} // END OF keyPressed


void drawColorCircles() {
  color bColor=color(255, 0, 0);
  drawColorCircle(redOffset, 50, bColor, str(floor(cHour)));
  bColor=color(0, 255, 0);
  drawColorCircle(greenOffset, 40, bColor, str(floor(cMinute)));
  bColor=color(0, 0, 255);
  drawColorCircle(blueOffset, 30, bColor, str(floor(cSecond)));
} // END OF drawColorCircles

void drawColorCircle(float colorOffset, float colorSize, color bColor, String timeText) {
  noStroke();
  //stroke(bColor);
  //strokeWeight(3);
  if (timeText=="") {
    fill(bColor);
  } else {
    noFill();
  }
  float screenX=centerX+270*cos(radians(colorOffset)) ;
  float screenY=centerY-270*sin(radians(colorOffset)) ;
  ellipse(screenX, screenY, colorSize, colorSize);
  if (timeText!="") {
    fill(bColor);
    textSize(colorSize/2);
    text(timeText, screenX-textWidth(timeText)/2, screenY+textAscent()/2.5);
  }
} // END OF drawColorCircle


float radius(float x, float y) {  
  return dist(centerX, centerY, x, y);
} // END OF radius


int colorAngle(float ang, float offset) {
  float value=0;

  if (ang>=offset-120 && ang<offset) { // from below half range to central point
    value=ang+(120-offset);
  } 
  if (ang>=offset && ang<offset+120) { // from central point to above half range
    value=120-(ang-offset);
  }
  if (ang<=offset && ang<offset+120-360) { // zero point is reached from the bottom
    value=120-(ang+360-offset);
  }
  if (ang>=(offset-120+360) && ang>offset) { // zero point is reached from above
    value=ang-(offset-120+360);
  }


  return (int) map(value, 0, 120, 0, 255);
} // END OF colorAt


float colorAt(float screenX, float screenY, float offset) {
  float ang = angle(screenX-centerX, centerY-screenY);
  float rad=radius(screenX, screenY);
  float value=0;
  if (rad<256) {
    value=colorAngle(ang, offset);
  } else {
    value=0;
  }
  return (int)value*(255-rad)/255;
} // END OF colorAt


void drawRay(int ang, int redLine, int greenLine, int blueLine) {
  for (int i=0; i<256; i++) {
    float screenX=centerX+i*cos(radians(ang));
    float screenY=centerY+i*-sin(radians(ang));
    strokeWeight(3);
    int r=(int) redLine*(255-i)/255;
    int g=(int) greenLine*(255-i)/255;
    int b=(int) blueLine*(255-i)/255;
    stroke(r, g, b, 255);
    //stroke(r, g, b);
    point(screenX, screenY);
  }
  drawColorCircles();
} // END OF drawPalette

boolean colorClicked(float colorOffset) {
  boolean clicked=false;
  float x=centerX+270*cos(radians(colorOffset));
  float y=centerY-270*sin(radians(colorOffset));
  float rx=width/20;
  float ry=height/20;
  if ((x-rx)<mouseX && (x+rx)>mouseX    && (y-ry)<mouseY && (y+ry)>mouseY      ) {
    clicked=true;
  }
  return clicked;
} // END OF colorClicked

