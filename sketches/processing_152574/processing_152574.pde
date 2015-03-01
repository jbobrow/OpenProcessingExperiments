
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 * Using code by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * Using code by Hannu Kulju / Animoottori – 2014 to create array to store and display stored colours
 *
 * This program draws an interactive colour selection wheel
 * Drag the colour circle around the hue wheel to change hue, change the distance
 * from the wheel to control brightness and saturation.
 * Right mouse click to switch between saturation and brightness selection.
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
float outerR = 300; // outer
float outerR2 = outerR * 1; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float brightValue = 100;
float satValue = 100;
float complementryHue = 0;
PGraphics SatWheel;
PGraphics BrightWheel;
boolean sat_or_bright = true;

color mainC[], bgC[];  //  Main and background Color arrays
int currCol, numCols;  //  Number of color rectangles and current color rectangle

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  
  satwheel();
  brightwheel();
  colorHandleX = width/2+300;
  colorHandleY = height/2;
  
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


  if (sat_or_bright) {
    background(0, 0, 0);
    image(SatWheel,0,0);
  } else {
    background(0, 0, 95);
    image(BrightWheel,0,0);
  }

  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(width/2 - innerR, height/2, width/2 - outerR2, height/2);

  //draw itten's color wheel - we'll use a QUAD_STRIP for this


  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40); 

  //draw color handle
  stroke(0,0,100);
  fill(0);
  ellipse(width/2, height/2, 10, 10);
  //   H         S    B
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //complementry color for colorHandle (comHand)
  float angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;
  float radiusComeHand = outerR;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, height/2, comHandX, comHandY, 20); 

  complementryHue = calculateCompHue(hueValue);

  //println("hueValue: "+hueValue + " + "+"comhue: "+complementryHue);

  fill( complementryHue, satValue, brightValue );
  ellipse(comHandX, comHandY, 40, 40);
  
  pickcols();
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
    float radius = constrain(distance, innerR, outerR2); 
    colorHandleX = width/2  + radius * cos(angle);
    colorHandleY = height/2 + radius * sin(angle);

    hueValue = map (degrees(angle), -180, 180, 360, 0);

    // map distance from outer edge of the wheel to brightness
    
    if (sat_or_bright) {
      satValue = map(radius, innerR, outerR2, 0, 100);
    } else {
      brightValue = map(radius, innerR, outerR2, 0, 100);
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
  float distc = dist(mouseX, mouseY, x, y);
  return (distc <= r);
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
  // Added code - Prepare next rectangle on the perimeters for color display
  if (isLocked) {  // New rectangle is used only if colorWheel was used
    if (currCol < numCols-1) currCol++;
    else currCol=0;
  }
  //  Added code - ends
  isLocked = false;
}

void pickcols() {
  mainC[currCol] = color(hueValue, satValue, brightValue);
  bgC[currCol] = color(complementryHue, satValue, brightValue);
  ellipseMode(CORNER);
  // Added Code - Create circles for saving color
  int perSide = numCols/4+1;      // Amount of circles per side
  float rectWidth, rectHeight;
  rectWidth = width/(perSide);
  rectHeight = height/(perSide);
  noStroke();
  for (int u = 0; u < numCols; u++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(HALF_PI*floor(u /(perSide-1)));
    int currBorder = 0;
    if (u == currCol){
     currBorder = 2;
     stroke(0,0,100);
    } else {
      noStroke();
    }
    fill(bgC[u]);
    ellipse(-width/2+ u % (perSide-1) * rectWidth +currBorder, -height/2 + currBorder, width/perSide - currBorder*2, height/perSide -currBorder * 2);
    fill(mainC[u]);
    ellipse(-width/2+ u % (perSide-1) * rectWidth + rectWidth/4, -height/2+ rectHeight/4, width/perSide/2, height/perSide/2);
    popMatrix();
  }
  ellipseMode(CENTER);
}


void satwheel() {
  SatWheel = createGraphics(width, height);
  SatWheel.beginDraw();
  SatWheel.colorMode(HSB, 360, 100, 100);
  SatWheel.noStroke();
  for (int j = 0; j <= 100; j++) {
  SatWheel.beginShape(QUAD_STRIP);

    for (int k=0; k<=360; k++) {
      float angle = radians(1*k-90); // 10 x 36 degree steps
      SatWheel.fill(1*k, 100-j, 100);

      //outside(top)
      SatWheel.vertex(width/2 + (outerR-2*j)*sin(angle), height/2 + (outerR-2*j)*cos(angle) );
      //inside(down)
      SatWheel.vertex(width/2 + (innerR-0*j)*sin(angle), height/2 + (innerR-0*j)*cos(angle) );
    }
    SatWheel.endShape(CLOSE);
  }
    SatWheel.endDraw();
}

void brightwheel() {
  BrightWheel = createGraphics(width, height);
  BrightWheel.beginDraw();
  BrightWheel.colorMode(HSB, 360, 100, 100);
  BrightWheel.noStroke();
  for (int j = 0; j <= 100; j++) {
  BrightWheel.beginShape(QUAD_STRIP);

    for (int k=0; k<=360; k++) {
      float angle = radians(1*k-90); // 10 x 36 degree steps
      BrightWheel.fill(1*k, 100, 100-j);

      //outside(top)
      BrightWheel.vertex(width/2 + (outerR-2*j)*sin(angle), height/2 + (outerR-2*j)*cos(angle) );
      //inside(down)
      BrightWheel.vertex(width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
    }
    BrightWheel.endShape(CLOSE);
  }
    BrightWheel.endDraw();
}

void mouseClicked(){
  if (mouseButton == RIGHT) {
    sat_or_bright = !sat_or_bright;
  }
}

