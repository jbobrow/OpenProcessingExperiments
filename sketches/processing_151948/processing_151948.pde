
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * Edited by Hannu Kulju / Animoottori – 2014
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
/**/float colorHandleX;
/**/float colorHandleY;
/**/float handleSize = 30;


// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
//
/**/boolean isLocked = false;

// Wheel radius: inner and outer
//
/**/float innerR = 100; // inner
/**/float outerR = 200; // outer
/**/float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
/**/float hueValue = 90;
/**/float brightValue = 100;
/**/float complementryHue = 0;

// Added code
color mainC[], bgC[];  //  Main and background Color arrays
int currCol, numCols;  //  Number of color rectangles and current color rectangle
float saturationValue = 100;
float satStoreVal = 100;
boolean shift = false;  // boolean for tracking shift-key
float satPosX,satPosY;  // MousePosition tracking for saturation alteration
// Added code ends


void setup() {

  /**/  size(800, 800);
  /**/  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

  /**/    colorHandleX = width/2+300;
  /**/  colorHandleY = height/2;

  //  Added code
  numCols = 36;
  currCol = 0;
  mainC = new color[numCols];
  bgC = new color[numCols];

  for (int u=0; u < numCols; u++) {
    mainC[u] = color(0, 0, 80);
    bgC[u] = color(0, 0, 40);
  }
  //  Added code ends
}


void draw() {
  //Since were using HSB colour mode this clears the display window to white
  //         H  S  B
  /**/  background(0, 0, 100);

  // Added code -  Calculate divisions for colorWheel
  int colors, degs;
  colors = 12;  // Number of colours on the colourwheel
  degs = 360/colors; // Angle of each colour

  //  Translate the coordinate system
  //   to rotate the colourwheel into a better position
  pushMatrix();
  translate(width/2, height/2);  //  Move origo to center of window
  rotate(radians(-degs/2));      //  Rotate coordinate system

  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(- innerR, 0, - outerR2, 0);

  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();

  beginShape(QUAD_STRIP);
  for (int i=0; i<=colors; i++) {
    float angle = radians(degs*i-90); // 10 x 36 degree steps
    fill(degs*i, 100, 100);

    //outside(top)
    vertex(outerR*sin(angle), outerR*cos(angle) );
    //inside(down)
    vertex(innerR*sin(angle), innerR*cos(angle) );
  }
  endShape(CLOSE);
  popMatrix();    //  Reset coordinate system
  //  End of added code


  // colour handle Position Update
  colorHandleUpdate();
  complementryHue = calculateCompHue(hueValue); // This line has been moved earlier to calculate the complementary color in better position

  // Added Code - Mark current color
  mainC[currCol] = color(hueValue, saturationValue, brightValue);
  bgC[currCol] = color(complementryHue, saturationValue, brightValue);

  // Added Code - Create rectangles for saving color
  int perSide = numCols/4+1;      // Amount of rectangles per side
  float rectWidth, rectHeight;
  rectWidth = width/(perSide);
  rectHeight = height/(perSide);
  noStroke();
  for (int u = 0; u < numCols; u++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(HALF_PI*floor(u /(perSide-1)));
    //println(u+" "+bgC[u]);
    int currBorder = 0;
    if (u == currCol) currBorder = 2; // stroke(128);
    else noStroke();
    fill(bgC[u]);
    rect(-width/2+ u % (perSide-1) * rectWidth +currBorder, -height/2 + currBorder, width/perSide - currBorder*2, height/perSide -currBorder * 2);
    fill(mainC[u]);
    rect(-width/2+ u % (perSide-1) * rectWidth + rectWidth/4, -height/2+ rectHeight/4, width/perSide/2, height/perSide/2);
    //rect(-width/2+(numCols/32)+u % perSide*rectWidth,-height/2+(numCols/32),width/(numCols/16),height/(numCols/16));
    popMatrix();
  }
  // Added code ends

  //complementry color for colorHandle (comHand)
  /**/  float angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;
  /**/  float radiusComeHand = 150;
  /**/  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  /**/  float comHandY = height/2 + radiusComeHand * sin(angleComHand);

//draw color handle
  /**/  noStroke();
  //  Saturation indicator
  fill(0,0,75);
  ellipse(width/2,height/2,innerR/2,innerR/2);
  fill (0,0,100);
  arc(width/2,height/2,innerR/2-2,innerR/2-2,angleComHand-TWO_PI* (100-saturationValue) / 100.0 - PI, angleComHand - PI,PIE);
 
 //draw dotted line from center to colorhandle
  /**/  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40); 
 
  /**/  fill(0);
  /**/  ellipse(width/2, height/2, 10, 10);  // Pin point
   //   H         S    B
  /**/  fill(hueValue, saturationValue, brightValue);
  strokeWeight(1);
  stroke(0, 0, saturationValue / 4 + 75);
  /**/  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );



  //dotline from center to comHand
  /**/  dotLine(width/2, height/2, comHandX, comHandY, 20); 

  //println("hueValue: "+hueValue + " + "+"comhue: "+complementryHue);

  /**/  fill( complementryHue, saturationValue, brightValue );
  /**/  ellipse(comHandX, comHandY, 40, 40);
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
  } else 
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
    if (shift) {  // When Shift is pressed changes saturation
      float change = dist(mouseX,mouseY,satPosX,satPosY); //  Saturation changes according to the distance from mouse to the position when pressed
      if (abs(mouseX-satPosX) > abs(mouseY-satPosY)) {    //  If mouse is further away on X-axis then X is used 
        if (mouseX < satPosX) saturationValue = satStoreVal-change;
        else if (mouseX > satPosX) saturationValue = satStoreVal+change;
      }  //  If mouse is further away on Y-axis then Y is used
      else if (mouseY < satPosY) saturationValue = satStoreVal-change;
      else saturationValue = satStoreVal+change;
      saturationValue = max(0,min(100,saturationValue));
      
    } else {  // Else color is changed otherwise
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
    isLocked = true;
    //  Added code - store mouse position for saturation alteration
    satPosX = mouseX;
    satPosY = mouseY;
    satStoreVal = saturationValue;
    //  Added code ends
    
  } /*else if (mouseX <= width/(numCols/4+1) || mouseX >= width - width/(numCols/4+1)
   || mouseY <= height/(numCols/4+1) || mouseY >= height - height/(numCols/4+1)) {  //  If mouse is clicked on 
   color c = get(mouseX,mouseY);
   println(hue(c));
   }*/
}

/*
 * mouseReleased
 * Unlock control of the handle
 *
 */
void mouseReleased() {
  // Added code - Prepare next rectangle on the perimeters for color display
  if (isLocked) {  // New rectangle is used only if colorWheel was used
    if (currCol < numCols-1) currCol++;
    else currCol=0;
  }
  //  Added code - ends
  isLocked = false;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) shift = true;
  }
}
void keyReleased() {
  shift = false;
}
