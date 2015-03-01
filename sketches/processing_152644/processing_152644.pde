
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
float analagiousHandleX[] = new float[2];
float analagiousHandleY[] = new float[2];
float handleSize = 30;
float analagiousAngle = 15;


// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
//
boolean primaryLocked = false;
int analagiousLock = 0;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float brightValue = 100;
float complementryHue = 0;

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

    colorHandleX = width/2+300;
  colorHandleY = height/2;
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
    float angle = radians(36*i-90); // 10 x 36 degree steps
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
  //   H         S    B
  fill(hueValue, 100, brightValue);
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

  fill( complementryHue, 100, brightValue );
  ellipse(comHandX, comHandY, 40, 40);
  
  
  //analagious hue 1
  float angleAn1Hand = angleComHand + radians(180-analagiousAngle);
  analagiousHandleX[0] = width/2  + (radiusComeHand*1.5) * cos(angleAn1Hand);
  analagiousHandleY[0] = height/2 + (radiusComeHand*1.5) * sin(angleAn1Hand);
  dotLine(width/2, height/2, analagiousHandleX[0], analagiousHandleY[0], 20); 
  float alalagious1Hue = calculateAnalagious1Hue(hueValue);
  noStroke();
  fill( alalagious1Hue, 100, brightValue );
  ellipse(analagiousHandleX[0], analagiousHandleY[0], handleSize, handleSize );
  
    //analagious hue 2
  float angleAn2Hand = angleComHand - radians(180 - analagiousAngle);
  analagiousHandleX[1] = width/2  + (radiusComeHand*1.5) * cos(angleAn2Hand);
  analagiousHandleY[1] = height/2 + (radiusComeHand*1.5) * sin(angleAn2Hand);
  dotLine(width/2, height/2, analagiousHandleX[1], analagiousHandleY[1], 20); 
  float alalagious2Hue = calculateAnalagious2Hue(hueValue);
  noStroke();
  fill( alalagious2Hue, 100, brightValue );
  ellipse(analagiousHandleX[1], analagiousHandleY[1], handleSize, handleSize );
  
  fill( alalagious1Hue, 100, brightValue );
  rect(width/2-40, height-90, 40, 80);
  fill( alalagious2Hue, 100, brightValue );
  rect(width/2, height-90, 40, 80);
  fill( hueValue, 100, brightValue );
  rect(width/2-30, height-80, 60, 60);
  fill( complementryHue, 100, brightValue );
  rect(width/2-10, height-60, 20, 20);
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
 * calculateCompHue
 *
 * Calculates the first analogous hue from the hue supplied
 */
float calculateAnalagious1Hue(float hueValue) {

  // Calculate complimentary color with hueValue
  // The complimentary colour should be 180 degrees opposite the selected colour
  if (hueValue >= (360 - analagiousAngle) && hueValue < 360) {
    return hueValue- (360 - analagiousAngle);
  }
  else 
    return hueValue+analagiousAngle;
}

/*
 * calculateCompHue
 *
 * Calculates the first analogous hue from the hue supplied
 */
float calculateAnalagious2Hue(float hueValue) {

  // Calculate complimentary color with hueValue
  // The complimentary colour should be 180 degrees opposite the selected colour
  if (hueValue >= 0 && hueValue < analagiousAngle) {
    return hueValue+(360 - analagiousAngle);
  }
  else 
    return hueValue-analagiousAngle;
}


/*
 * colorHandleUpdate
 *
 * Updates the position and orientation of the colour handle based on
 * mouse position when left mouse button is pressed.
 */
void colorHandleUpdate() {

  // isLocked will be true if we pressed the mouse down while over the handle
  if (primaryLocked) {

    // calculate angle of handle based on mouse position
    // atan2 value is in the range from pi to -pi
    float angle = atan2(mouseY-height/2, mouseX-width/2  );
    float distance = dist(mouseX, mouseY, width/2, height/2);
    float radius = constrain(distance, outerR, outerR2); 
    colorHandleX = width/2  + radius * cos(angle);
    colorHandleY = height/2 + radius * sin(angle);

    hueValue = map (degrees(angle), -180, 180, 360, 0);

    // map distance from outer edge of the wheel to brightness
    brightValue = map(radius, outerR, outerR2, 0, 100);

    //Shape for the locked colorHandle 
    noStroke(); 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  }
  
  if (analagiousLock > 0) {
    float newAnalagiousAngle = atan2(mouseY-height/2, mouseX-width/2  );
    float primaryAngle = atan2(colorHandleY-height/2, colorHandleX-width/2  );
    if (analagiousLock == 1)
      analagiousAngle= constrain(degrees(primaryAngle-newAnalagiousAngle), 1, 179);
    if (analagiousLock == 2)
      analagiousAngle= constrain(degrees(newAnalagiousAngle-primaryAngle), 1, 179);
  }
}


/*
 * isWithinCircle
 * boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
 */
boolean isWithinCircle(float x, float y, float r) {
  float dist = dist(mouseX, mouseY, x, y);
  return (dist <= r);
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
    primaryLocked = true;
  }
  if (isWithinCircle(analagiousHandleX[0], analagiousHandleY[0], handleSize)) {
    analagiousLock = 1;
  }
  if (isWithinCircle(analagiousHandleX[1], analagiousHandleY[1], handleSize)) {
    analagiousLock = 2;
  }
}

/*
 * mouseReleased
 * Unlock control of the handle
 *
 */
void mouseReleased() {
  primaryLocked = false;
  analagiousLock = 0;
}



