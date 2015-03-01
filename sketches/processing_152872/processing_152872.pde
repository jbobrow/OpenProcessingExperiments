
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
float satHandleX;
float satHandleY;
float briHandleX;
float briHandleY;
float satDist;
float briDist;
float handleSize = 30;


// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked-released as the left mouse button is released 
//
boolean isLocked = false;
boolean isSLocked = false;
boolean isBLocked = false;
int iMode = 0;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 180;
float brightValue = 100;
float satValue = 100;
float complementryHue = 0;

void setup() {

  size(650, 650);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

    colorHandleX = width/2+300;
    colorHandleY = height/2;
    
    satDist = outerR2-handleSize;
    briDist = outerR2-handleSize;

    satHandleX = width/2  + (outerR2-handleSize);
    satHandleY = height/2 - handleSize/2;
    briHandleX = width/2  + (outerR2-handleSize);
    briHandleY = height/2 + handleSize/2;
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
  //   H         S         B
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  /*** DRAW HUE AND BRIGHTNESS HANDLES ***/
  fill(0, 0, 50);
  ellipse(satHandleX, satHandleY, handleSize, handleSize);
  ellipse(briHandleX, briHandleY, handleSize, handleSize);
  fill(0,0,100);
  textSize(20);
  text("S",satHandleX-5,satHandleY+7);
  text("B",briHandleX-5,briHandleY+7);
  
  //manage 1,2 and 3 complements
  float angleComHand, radiusComeHand, comHandX, comHandY;
  switch(iMode) {
    case 2: //diamond complement
      //left complement
      angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0);
      radiusComeHand = 150;
      comHandX = width/2  + radiusComeHand * cos(angleComHand);
      comHandY = height/2 + radiusComeHand * sin(angleComHand);
      //dotline from center to comHand
      dotLine(width/2, height/2, comHandX, comHandY, 20); 
      complementryHue = calculateCompHue(hueValue,270);
      //complementry colour ellipse
      fill( complementryHue, satValue, brightValue );
      ellipse(comHandX, comHandY, 40, 40);
      //right complement
      angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + PI;
      radiusComeHand = 150;
      comHandX = width/2  + radiusComeHand * cos(angleComHand);
      comHandY = height/2 + radiusComeHand * sin(angleComHand);
      //dotline from center to comHand
      dotLine(width/2, height/2, comHandX, comHandY, 20); 
      complementryHue = calculateCompHue(hueValue,90);
      //complementry colour ellipse
      fill( complementryHue, satValue, brightValue );
      ellipse(comHandX, comHandY, 40, 40);
    case 0: //complement
      //complementry color for colorHandle (comHand)
      angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;
      radiusComeHand = 150;
      comHandX = width/2  + radiusComeHand * cos(angleComHand);
      comHandY = height/2 + radiusComeHand * sin(angleComHand);
      //dotline from center to comHand
      dotLine(width/2, height/2, comHandX, comHandY, 20); 
      complementryHue = calculateCompHue(hueValue,180);
      //complementry colour ellipse
      fill( complementryHue, satValue, brightValue );
      ellipse(comHandX, comHandY, 40, 40);
      break;
    case 1: //triangular complement
      //left complement
      angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + PI/6  ;
      radiusComeHand = 150;
      comHandX = width/2  + radiusComeHand * cos(angleComHand);
      comHandY = height/2 + radiusComeHand * sin(angleComHand);
      //dotline from center to comHand
      dotLine(width/2, height/2, comHandX, comHandY, 20); 
      complementryHue = calculateCompHue(hueValue,240);
      //complementry colour ellipse
      fill( complementryHue, satValue, brightValue );
      ellipse(comHandX, comHandY, 40, 40);
      //right complement
      angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + (5*PI)/6;
      radiusComeHand = 150;
      comHandX = width/2  + radiusComeHand * cos(angleComHand);
      comHandY = height/2 + radiusComeHand * sin(angleComHand);
      //dotline from center to comHand
      dotLine(width/2, height/2, comHandX, comHandY, 20); 
      complementryHue = calculateCompHue(hueValue,120);
      //complementry colour ellipse
      fill( complementryHue, satValue, brightValue );
      ellipse(comHandX, comHandY, 40, 40);
      break;
    default:
      println("iMode ("+iMode+") is unsupported");
  }
}

/*
 * calculateCompHue
 *
 * Calculates the complimentary hue from the hue supplied
 */
float calculateCompHue(float hueValue,float offset) {
  // Calculate complimentary color with hueValue
   return (hueValue + offset)%360;
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
    float angle = atan2(mouseY-height/2, mouseX-width/2);
    //float distance = dist(mouseX, mouseY, width/2, height/2);
    //float radius = constrain(distance, outerR, outerR2); 
    colorHandleX = width/2  + outerR2 * cos(angle);
    colorHandleY = height/2 + outerR2 * sin(angle);
    
    //update handle positions
    satHandleX = width/2  + (satDist * cos(angle) - handleSize/2*cos(angle+HALF_PI));
    satHandleY = height/2 + (satDist * sin(angle) - handleSize/2*sin(angle+HALF_PI));
    briHandleX = width/2  + (briDist * cos(angle) - handleSize/2*cos(angle-HALF_PI));
    briHandleY = height/2 + (briDist * sin(angle) - handleSize/2*sin(angle-HALF_PI));
    
    hueValue = map (degrees(angle), -180, 180, 360, 0);

    // map distance from outer edge of the wheel to brightness
    //brightValue = map(radius, outerR, outerR2, 0, 100);

    //Shape for the locked colorHandle 
    noStroke(); 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
    
    println("H: "+satValue);
  }
  
  if(isSLocked) {
    //do saturation update
    float angle = HALF_PI-atan2(colorHandleX-height/2, colorHandleY-width/2);
    float distance = dist(mouseX, mouseY, width/2,height/2);// - (handleSize/2*cos(HALF_PI+angle)), height/2 - (handleSize/2*cos(HALF_PI+angle)));
    satDist = constrain(distance, outerR, outerR2-handleSize);
    
    satHandleX = width/2  + satDist * cos(angle) - handleSize/2*cos(angle+HALF_PI);
    satHandleY = height/2 + satDist * sin(angle) - handleSize/2*sin(angle+HALF_PI);
        
    noStroke(); 
    fill(0, 0, 85);
    ellipse(satHandleX, satHandleY, handleSize+20, handleSize+20);
    
    satValue = map(satDist,outerR,outerR2-handleSize,0,100);
    println("S: "+satValue);
  }
  if(isBLocked) {
    //do brightness update
    float angle = HALF_PI-atan2(colorHandleX-height/2, colorHandleY-width/2);
    float distance = dist(mouseX, mouseY, width/2,height/2);// + (handleSize/2*cos(HALF_PI+angle)), (height/2) + (handleSize/2*cos(HALF_PI+angle)));
    briDist = constrain(distance, outerR, outerR2-handleSize);
    
    briHandleX = width/2  + briDist * cos(angle) + handleSize/2*cos(angle+HALF_PI);
    briHandleY = height/2 + briDist * sin(angle) + handleSize/2*sin(angle+HALF_PI);
    
    noStroke(); 
    fill(0, 0, 85);
    ellipse(briHandleX, briHandleY, handleSize+20, handleSize+20);
    
    brightValue = map(briDist,outerR,outerR2-handleSize,0,100);
    println("S: "+brightValue);
  }
}


/*
 * isWithinCircle
 * boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
 */
boolean isWithinCircle(float x, float y, float r) {
  float fDist = dist(mouseX, mouseY, x, y);
  return (fDist <= r/2);
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
  if (isWithinCircle(satHandleX, satHandleY, handleSize)) {
    isSLocked = true;
  }
  if (isWithinCircle(briHandleX, briHandleY, handleSize)) {
    isBLocked = true;
  }
  if (isWithinCircle(width/2,height/2,10)) {
    //change colour picker mode
    iMode = (iMode+1)%3;
  }
}

/*
 * mouseReleased
 * Unlock control of the handle
 *
 */
void mouseReleased() {
  isLocked = false;
  isSLocked = false;
  isBLocked = false;
}



