
/*
 * Creative Coding
 * Exercise W04_01 - WheelSampleC
 * by  DEFurugen with help of code from Renzo Wouters
 *
 * This program draws an interactive colour selection wheel
 * Drag the colour circle around the hue wheel to change hue, change the distance
 * from the wheel to control brightness.
 *
 * Another colour circle is displayed showing the colour 180 degrees from the current colour
 * 
 */
 
 class Box {
  float x, y, innerX, innerY;
  float s, innerS;
  color innerCol, outerCol;
  color innerStr, outerStr;
  color stCol = color(0, 0, 100);
  color stStr = color(50, 0, 25);
  float strokeW = 1;
  Box (float posx, float posy, float size) {
    /* initiate Box
     *
     * defaults - innerC and outerC: white
     *          - innerS and outerS: grey
     */

    x = posx;
    y = posy;
    s = size;
    innerS = size * 0.5;
    innerX = x + ((s - innerS)/2);
    innerY = y + ((s - innerS)/2);
    innerCol = stCol;
    outerCol = stCol;
    innerStr = stStr;
    outerStr = stStr;
  }

  void drawBox() {
    strokeWeight(strokeW);
    fill(outerCol);
    stroke(outerStr);
    rect(x, y, s, s);
    fill(innerCol);
    stroke(innerStr);
    rect(innerX, innerY, innerS, innerS);
  }

  void setBox (color outer, color inner) {
    outerCol = outer;
    innerCol = inner;
    strokeW = 0;
  }

  void resetBox() {
    innerCol = stCol;
    outerCol = stCol;
    innerStr = stStr;
    outerStr = stStr;
    strokeW = 1;
  }
}

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
boolean isModified = false;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float brightValue = 100;
float saturationValue = 100;
float complementryHue = 0;
float saturation;
// arrays to store locked colors
Box[] boxes;
int numBoxes = 5;
int boxSize = 100;
int currentBox = 0;

void setup() {

  size(700, 700);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

    colorHandleX = width/2+300;
  colorHandleY = height/2;

  boxes = new Box[numBoxes];

  float posY = 590;
  float margin = (width - numBoxes * boxSize)/2;

  for (int pos = 0; pos < numBoxes; pos++) {
    float posX = margin + pos * boxSize;
    boxes[pos] = new Box(posX, posY, boxSize);
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
  for (int i=0; i<=20; i++) {
    float angle = radians(18*i-45); // 10 x 36 degree steps
    fill(18*i, 100, 100);

    //outside(top)
    vertex(width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex(width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);


  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 20);

  //draw color handle
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 20, 20);
  //   H         S    B
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

  // set the colors of the current box
  color handleColor = color(hueValue, saturationValue, brightValue);
  color complementryColor = color(complementryHue, saturationValue, brightValue);
  boxes[currentBox].setBox(handleColor, complementryColor);

  // draw the boxes

  for (int i=0; i < numBoxes; i++) {
    boxes[i].drawBox();
  }
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

    // calculate angle of handle based on mouse position
    // atan2 value is in the range from pi to -pi
    float angle = atan2(mouseY-height/2, mouseX-width/2  );
    float distance = dist(mouseX, mouseY, width/2, height/2);
    float radius = constrain(distance, outerR, outerR2);
    colorHandleX = width/2  + radius * cos(angle);
    colorHandleY = height/2 + radius * sin(angle);

    hueValue = map (degrees(angle), -180, 180, 360, 0);

    if (isModified) {
      brightValue = 100;
      saturationValue = map(radius, outerR, outerR2, 0, 100);
    } else {
      // map distance from outer edge of the wheel to brightness
      brightValue = map(radius, outerR, outerR2, 0, 100);
      saturationValue = 100;
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
  }
}

/*
 * mouseReleased
 * Unlock control of the handle
 *
 */
void mouseReleased() {
  isLocked = false;
 
 }

void keyPressed() {
  switch (key) {
  case 'm':
    isModified = true;
    break;
  }
}

void keyReleased() {
  isModified = false;
}
void mouseWheel(MouseEvent event) { 
  float e = event.getCount(); 

  if (e < 0) { 
    if (saturation >0) 
      saturation --;
  } else if (e > 0) { 
    if (saturation <100) 
      saturation ++;
  }
}



