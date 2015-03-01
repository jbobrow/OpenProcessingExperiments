
/*
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Julio Montabes 
 * Copyright (c) 2014 Julio Montabes
 *
 * This program shows combinations of red, green and blue colors
 * and allows to create palettes with combinations of the three 
 * colors by sliding the color buttons around the palette.
 *
 * It also shows the color under the cursor on the top left
 * circle when dragging the mouse on the palette.
 *
 * Press and hold 'left mouse button' to change color.
 * Click 's' key to print a copy of the screen.
 * 
 */

float red;
float green;
float blue;

float centerX=0;
float centerY=0;
float paletteRadius=0;

float redOffset=45; //90;
float greenOffset=270;
float blueOffset=340;


void setup() {
  size(600, 600);
  colorMode(RGB);
  // initialise the colour variables
  red = 0;
  blue = 0;
  green = 0;
  background(red, green, blue);
  centerX = width/2;
  centerY = height/2;
  paletteRadius = 0.9*width/2;
  drawPalette();
  //drawFunction();
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


void drawFunction() {
  background(255);
  stroke(40);
  line(0, centerY, width, centerY);
  line(centerX, 0, centerX, height); 
  float y0=100;
  strokeWeight(2);
  stroke(255, 0, 0);
  for (y0=-height/2; y0<height/2; y0+=10) {
    for (float x=-width/2; x<width/2; x+=10) {
      float ang=angle(x, y0);
      stroke(map(y0, -300, 300, 1, 255), map(y0, -300, 300, 1, 255), 0);
      point(newX(x, -300, 1), newY(ang, 300, -1) );
    }
  }
  strokeWeight(1);
} // END OF drawFunction


void draw() {

  if (mousePressed) {
    if (colorClicked(redOffset)) {
      fill(0);
      drawColorCircle(redOffset);
      redOffset=angle(mouseX-centerX, centerY-mouseY); // angle of mouseX, mouseY
      drawColorCircles();
    } else if (colorClicked(greenOffset)) {
      fill(0);
      drawColorCircle(greenOffset);
      greenOffset=angle(mouseX-centerX, centerY-mouseY); // angle of mouseX, mouseY
      drawColorCircles();
    } else if (colorClicked(blueOffset)) {
      fill(0);
      drawColorCircle(blueOffset);
      blueOffset=angle(mouseX-centerX, centerY-mouseY); // angle of mouseX, mouseY
      drawColorCircles();
    } else {
      red=colorAt(mouseX, mouseY, redOffset);
      green=colorAt(mouseX, mouseY, greenOffset);
      blue=colorAt(mouseX, mouseY, blueOffset);

      println("red: "+red+", green: "+green+", blue: "+blue);
      println("");
      fill(red, green, blue);
      ellipse(width/10, height/10, width/10, height/10);
    }
  } else {
    /*int ang = frameCount%360;
     int r=colorAngle(ang, redOffset);
     //println(" draw: r="+r+" ang="+ang+" redOffset="+redOffset);
     int g=colorAngle(ang, greenOffset);
     int b=colorAngle(ang, blueOffset);
     drawRay(ang, r, g, b);*/
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
    println(" nou redOffset="+redOffset);
    drawPalette();
  }
  if (colorClicked(greenOffset)) {
    greenOffset=angle((mouseX-centerX), (centerY-mouseY));
    println(" nou greenOffset="+greenOffset);
    drawPalette();
  }
  if (colorClicked(blueOffset)) {
    blueOffset=angle((mouseX-centerX), (centerY-mouseY));
    println(" nou blueOffset="+blueOffset);
    drawPalette();
  }
} // END OF mouseReleased


void keyPressed() {
  if (key=='s') {
    saveFrame(""+year()+"-"+month()+"-"+day()+" "+hour()+minute()+" rainbowPalette.jpg");
  }
} // END OF keyPressed


void drawColorCircles() {
  fill(255, 0, 0);
  drawColorCircle(redOffset);
  fill(0, 255, 0);
  drawColorCircle(greenOffset);
  fill(0, 0, 255);
  drawColorCircle(blueOffset);
} // END OF drawColorCircles


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

  //println("1 ColorAngle: "+" ang="+ang+" offset="+offset+" value="+value );

  return (int) map(value, 0, 120, 0, 255);
} // END OF colorAt


int colorAt(float screenX, float screenY, float offset) {
  //float colorRange=120;
  float ang = angle(screenX-centerX, centerY-screenY);
  float rad=radius(screenX, screenY);
  float value=0;
  if (rad<256) {
    value=colorAngle(ang, offset);
    //println(" 2 ColorAt: "+" ang="+ang+" rad="+rad+" value="+value+" offset="+offset );
  } else {
    value=0;
  }
  return (int) value*(255-rad)/255;
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
    point(screenX, screenY);
  }
  drawColorCircles();
} // END OF drawPalette

void drawColorCircle(float colorOffset) {
  float screenX=centerX+270*cos(radians(colorOffset)) ;
  float screenY=centerY-270*sin(radians(colorOffset)) ;
  ellipse(screenX, screenY, width/20, height/20);
} // END OF drawColorCircle

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




/*void drawPalette(int ang) {
 for (int i=0; i<256; i++) {
 for (int ang=0; ang<360; ang++) {
 float screenX=centerX+i*cos(radians(ang));
 float screenY=centerY+i*-sin(radians(ang));
 println("drawPalette 1: screenX="+screenX+" screenY="+screenY);       
 int r=colorAt(screenX, screenY, redOffset);
 println("drawPalette 2: screenX="+screenX+" screenY="+screenY+" r="+r+" redOffset="+redOffset);
 int g=colorAt(screenX, screenY, greenOffset);
 int b=colorAt(screenX, screenY, blueOffset);
 strokeWeight(3);
 stroke(r, g, b, 255);
 println("drawPalette 3: r="+r+" g="+g+" b="+b+" redOffset="+greenOffset);       
 point(screenX, screenY);
 println(" drawPalette: exit "+" screenX="+screenX+" screenY="+screenY );
 }
 }
 
 drawColorCircles();
 } // END OF drawPalette*/

/*int colorAt(float screenX, float screenY, float offset) {
 //float colorRange=120;
 //println(" colorAt 1:"+" screenX="+screenX+" screenY="+screenY );
 float ang = angle(screenX-centerX, centerY-screenY);
 //println(" colorAt 2: ang="+ang );
 float rad=radius(screenX, screenY);
 float value=0;
 //println(" colorAt 3: rad="+rad+" value="+value );
 if (rad<256) {
 
 if (ang>=offset-120 && ang<offset) { // from below half range to central point
 value=ang+(120-offset);
 } //
 if (ang>=offset && ang<offset+120) { // from central point to above half range
 value=120-(ang-offset);
 }//
 
 if (ang<=offset && ang<offset+120-360) { // zero point is reached from the bottom
 value=120-(ang+360-offset);
 }
 
 if (ang>=(offset-120+360) && ang>offset) { // zero point is reached from above
 value=ang-(offset-120+360);
 }
 }
 //println(" Surt de colorAct: value="+value);
 return (int) map(value*(255-rad)/255, 0, 120, 0, 255);
 } // END OF colorAt*/


