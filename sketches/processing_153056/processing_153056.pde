
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws an interactive colour selection wheel
 * Drag the colour circle around the hue wheel to change hue, change the distance
 * from the wheel to control brightness.
 *
 * Another colour circle is displayed showing the colour 180 degrees from the current colour
 * 
 */

// colourHandle: the user interface element to changing colours over the wheel
// It has a postion and a size
float colorHandleX;
float colorHandleY;
float handleSize = 30;

// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
boolean isLocked = false;
boolean isShifted = false;

// Wheel radius: inner and outer
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complimentary colour
float hueValue = 180;
float satValue = 100;
float brightValue = 100;
float complimentaryHue = 0;

// arrays for the colour squares
int num = 5;
float[] mainHue = new float[num];
float[] compHue = new float[num];
float[] sat = new float[num];
float[] bright = new float[num];
int current = 0;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  colorHandleX = width/2+300;
  colorHandleY = height/2;
} // end of setup()

void draw() {
  // draw the colour wheel
  drawColorWheel();
  // draw the handle
  drawHandle();
  // save the colours
  saveColors();
  // draw the squares
  drawSquares();
} // end of draw()

/*
 * calculateCompHue
 * Calculates the complimentary hue from the hue supplied
 */
float calculateCompHue(float hueValue) {
  // Calculate complimentary color with hueValue
  // The complimentary colour should be 180 degrees opposite the selected colour
  if (hueValue >= 180 && hueValue < 360) {
    return hueValue-180;
  } else 
    return hueValue+180;
} // end of calculateCompHue()

/*
 * colorHandleUpdate
 * Updates the position and orientation of the colour handle based on
 * mouse position when left mouse button is pressed.
 */
void colorHandleUpdate() {
  // isLocked will be true if we pressed the mouse down while over the handle
  if (isLocked) {
    // calculate angle of handle based on mouse position
    // atan2 value is in the range from pi to -pi
    float angle = atan2(mouseY-height/2, mouseX-width/2  );
    float distance = dist(mouseX, mouseY, width/2, height/2);
    float radius = constrain(distance, outerR, outerR2);
    colorHandleX = width/2  + radius * cos(angle);
    colorHandleY = height/2 + radius * sin(angle);
    
    // map angle to hue
    hueValue = map (degrees(angle), -180, 180, 360, 0);
    if (isShifted) {
      // map distance from outer edge of the wheel to saturation
      satValue = map(radius, outerR, outerR2, 0, 100);
    } else {
      // map distance from outer edge of the wheel to brightness
      brightValue = map(radius, outerR, outerR2, 0, 100);
    }

    //Shape for the locked colorHandle 
    noStroke(); 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  }
} // end of colorHandleUpdate()

/*
 * isWithinCircle
 * boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
 */
boolean isWithinCircle(float x, float y, float r) {
  float distance = dist(mouseX, mouseY, x, y);
  return (distance <= r);
} // end of isWithinCircle()

/*
 * dotLine
 * draw a dotted line from (x1,y1) to (x2,y2)
 */
void dotLine(float x1, float y1, float x2, float y2, int dotDetail) {
  for (int i=0; i<=dotDetail; i++) {
    float dotDetailFloat = (float) dotDetail;
    float dotX = lerp(x1, x2, i/dotDetailFloat);
    float dotY = lerp(y1, y2, i/dotDetailFloat);
    strokeWeight(2);
    stroke(0, 0, 40);
    point(dotX, dotY);
  }
} // end of dotLine()

/*
 * mousePressed
 * When mouse button is first pressed, check if the user has pressed over the colour handle
 * If so, set isLocked to true to lock manipulation of the handle
 *
 */
void mousePressed() {
  if (isWithinCircle(colorHandleX, colorHandleY, handleSize)) {
    isLocked = true;
  }
} // end of mousePressed()

/*
 * mouseReleased
 * Unlock control of the handle
 *
 */
void mouseReleased() {
  current = (current < num-1) ? current + 1 : 0;
  isLocked = false;
} // end of mouseReleased()

/*
 *  drawColorWheel
 *  function to draw the colour wheel
 *
 */
void drawColorWheel() {
  // draw the background 
  // Since we're using HSB colour mode this clears the display window to white
  //         H  S  B
  background(0, 0, 100);
  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(width/2 - innerR, height/2, width/2 - outerR2, height/2);

  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=10; i++) {
    float angle = radians(36*i-90); // 10 x 36 degree steps
    //   Hue   Sat  Brightness
    fill(36*i, 100, 100);  // change the colour as we're building the quads
    //outside(top)
    vertex( width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex( width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);
} // end of drawColorWheel()

/*
 *  drawHandle
 *  function to draw the handle
 *
 */
void drawHandle() {
  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40); 

  //draw color handle
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 10, 10);

  //   Hue       Sat  Brightness
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //complimentary color for colorHandle (comHand)
  float angleComHand = atan2(colorHandleY-height/2, colorHandleX-width/2) + PI;
  float radiusComHand = 150;
  float comHandX = width/2  + radiusComHand * cos(angleComHand);
  float comHandY = height/2 + radiusComHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, height/2, comHandX, comHandY, 20); 

  complimentaryHue = calculateCompHue(hueValue);
  //println("hueValue: "+hueValue + " + "+"comHue: "+complimentaryHue);

  fill( complimentaryHue, satValue, brightValue );
  ellipse(comHandX, comHandY, 40, 40);
} // end of drawHandle()

/*
 *  saveColors
 *  function to save the current hue, saturation and brightness
 *  to arrays
 */
void saveColors() {
  mainHue[current] = hueValue;
  compHue[current] = complimentaryHue;
  sat[current] = satValue;
  bright[current] = brightValue;
} // end of saveColors()

/*
 *  drawSquares
 *  function to draw the squares
 *
 */
void drawSquares() { 
  float w1 = constrain(width/(num+1), 40, 100);  // width of large squares
  float w2 = w1 * 0.6;                           // width of small squares
  float m = (width-(w1*num))/2;                  // margin  
  float y = height - 120;                        // Y position of large squares
  float s = (w1-w2)/2;                           // space between large and small squares
  noStroke();
  for (int i = 0; i < num; i++) {
    fill(mainHue[i], sat[i], bright[i]);
    rect(m+(i*w1), y, w1, w1);
    fill(compHue[i], sat[i], bright[i]);
    rect(m+(i*w1)+s, y+s, w2, w2);
  }
} // end of drawSquares()

/*
 *  keyPressed
 *  
 */
void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
     case DOWN:
       // decrease hue
       hueValue = (hueValue < 30) ? hueValue + 330 : hueValue - 30;
       break;
     case UP:
       // increase hue
       hueValue = (hueValue > 330) ? hueValue - 330 : hueValue + 30 ;
       break;
     case SHIFT:
       // change from brightness to saturation
       isShifted = true;
       break;
    }
  }   
} // end of keyPressed

/*
 *  keyReleased
 *  
 */
void keyReleased() {
  isShifted = false;
} // end of keyReleased()

