
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
//
float colorHandleX;
float colorHandleY;
float handleSize = 30;
  
// boolean isLocked
// the state of handle: when the color handle is pressed,
// color hand is locked–released as the left mouse button is released
//
boolean isLocked = false;
  
// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range
  
// current and complementry colour
float hueValue = 180;
float saturationValue = 100;
float brightValue = 100;
float complementryHue = 0;
  
//  arrays to store the colours 
int swatches = 6;
float [][] swatchColour;
float [][] swatchCompColour;
int activeSwatch = 0;
  
void setup() {
  
  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  
  colorHandleX = width/2+300;
  colorHandleY = height/2;
  
  // set up the swatches
  swatchColour = new float [swatches][3];
  swatchCompColour = new float [swatches][3] ;
  
 //  seting up black swatches
  for (int i=0; i<swatches; i++){
    swatchColour [i][0] = 0;
    swatchColour [i][1] = 0;
    swatchColour [i][2] = 10;
    swatchCompColour [i][0] = 0;
    swatchCompColour [i][1] = 0;
    swatchCompColour [i][2] = 100;
   
  }
}
  
  
void draw() {
  //Since were using HSB colour mode this clears the display window to white
  //         H  S  B
  background(0, 0, 100);
  
  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(width/2 - innerR, height/2, width/2 - outerR2, height/2);
  
  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=10; i++) {
    float angle = radians(36*i-90+18); // 20 x 18 degree steps
  
    //   Hue   Sat  Bright
    fill(36*i, 100, 100);
  
    //outside(top)
    vertex(width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex(width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);
  
  // colour handle Position Update
  colorHandleUpdate();
  
  //draw dotted line from center to colorhandle
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40);
  
  //draw color handle
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  //   Hue       Sat      Bright
  fill(hueValue, saturationValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );
  
  //complementry color for colorHandle (comHand)
  float angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);
  
  //dotline from center to comHand
  dotLine(width/2, height/2, comHandX, comHandY, 20);
  
  complementryHue = calculateCompHue(hueValue);
  
  //println("hueValue: "+hueValue + " + "+"comhue: "+complementryHue);
  
  fill( complementryHue, saturationValue, brightValue );
  ellipse(comHandX, comHandY, 40, 40);
  
  if (isLocked) {
    // set up working swatch 
    swatchColour [activeSwatch][0] = hueValue;
    swatchColour [activeSwatch][1] = saturationValue;
    swatchColour [activeSwatch][2] = brightValue;
    
    // set up working swatch for colour
    swatchCompColour [activeSwatch][0] = complementryHue;
    swatchCompColour [activeSwatch][1] = saturationValue;
    swatchCompColour [activeSwatch][2] = brightValue;
  }
  for (int i=0; i<swatches; i++){
     squareSwatch(100+(i*100),20,80,100,i);
  }
}
  
/*
 * square swatches
 *
 *
 */
  void squareSwatch(float x, float y, float w, float h, int swatch){
  noStroke();
  fill(swatchColour [swatch][0], swatchColour [swatch][1], swatchColour [swatch][2]);
  rect(x,y,w,h);
  fill(swatchCompColour [swatch][0], swatchCompColour [swatch][1], swatchCompColour [swatch][2]); 
  rect(x+w/4,y+h/4,w/2,h/2);
 }
  
/*
 * calculateCompHue
 *
 * Calculates the complimentary hue from the hue supplied
 */
float calculateCompHue(float hueValue) {
  
  // Calculate complimentary color with hueValue
  // The complimentary colour should be 180 degrees opposite the selected colour
  if (hueValue >= 180 && hueValue < 360) {
    return hueValue-180;
  }
  else
    return hueValue+180;
}
  
/*
 * colorHandleUpdate
 *
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
  
    hueValue = map (degrees(angle), -180, 180, 360, 0);
  
    // map distance from outer edge of the wheel to saturation or brightness
    if (keyPressed) {
      saturationValue = map(radius, outerR, outerR2, 0, 100);
    } else {
      brightValue = map(radius, outerR, outerR2, 0, 100);
    }
  
    //Shape for the locked colorHandle
    noStroke();
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  }
}
  
/*
 * isWithinCircle
 * boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
 */
boolean isWithinCircle(float x, float y, float r) {
  float distance = dist(mouseX, mouseY, x, y);
  return (distance <= r);
}
  
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
}
  
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
}
  
/*
 * mouseReleased
 * Unlock control of the handle
 *
 */
void mouseReleased() {
  isLocked = false;
  activeSwatch = activeSwatch + 1;
  activeSwatch = activeSwatch % swatches;
}



