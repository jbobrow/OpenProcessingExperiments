
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
// true if SHIFT is pressed (-> change saturation instead of brightness)
boolean shiftPressed = false;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float brightValue = 100;
float satValue = 100;
float complementryHue = 0;

// BM variables for rects at bottom
float rectSize; 
int currentRect = 0; 
int rectNum = 5; 
color[] c1 = new color[rectNum];
color[] c2 = new color[rectNum];

float mx, my;  // BM midpoint for colorwheel    
int quadStep;  // BM number of quads used for the color wheel 

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

  colorHandleX = width/2+300;
  colorHandleY = height/2;

  for (int i = 0; i < rectNum; i++) {
    c1[i] = color(0, 0, 100);
    c2[i] = color(0, 0, 100);
  }   
  rectSize = width/5;

  mx = width/2; 
  my = height/2 - rectSize/2;
}


void draw() {
  //Since were using HSB colour mode this clears the display window to white
  //         H  S  B
  background(0, 0, 100);

  // BM draw the rectangles at the bottom of the screen 
  drawChosenColor(); 

  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(mx - innerR, my, mx - outerR2, my);

  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  quadStep = 30; 
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=quadStep; i++) {
    float angle = radians(360 / quadStep *i-90); // (360 / quadStep) = degree steps
    fill(360 / quadStep *i, 100, 100);

    //outside(top)
    vertex(mx + outerR*sin(angle), my + outerR*cos(angle) );
    //inside(down)
    vertex(mx + innerR*sin(angle), my + innerR*cos(angle) );
  }
  endShape(CLOSE);


  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle
  dotLine(mx, my, colorHandleX, colorHandleY, 40);  

  //draw color handle
  noStroke();
  fill(0);
  ellipse(mx, my, 10, 10);
  //   H         S    B
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //complementry color for colorHandle (comHand)
  //float angleComHand = map( atan2(colorHandleX-mx, colorHandleY-my), -PI, PI, TWO_PI, 0) + HALF_PI;
  float angleComHand = (atan2(colorHandleY-my, colorHandleX-mx) + PI);  //???
  float radiusComeHand = 150;
  float comHandX = mx + radiusComeHand * cos(angleComHand);
  float comHandY = my + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(mx, my, comHandX, comHandY, 20); 

  complementryHue = calculateCompHue(hueValue);
  
  fill( complementryHue, satValue, brightValue );  
  ellipse(comHandX, comHandY, 40, 40);
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
    float angle = atan2(mouseY-my, mouseX-mx);
    float distance = dist(mouseX, mouseY, mx, my);
    float radius = constrain(distance, outerR, outerR2); 
    colorHandleX = mx + radius * cos(angle);
    colorHandleY = my + radius * sin(angle);

    hueValue = map (degrees(angle), -180, 180, 360, 0);
    
    // map distance from outer edge of the wheel to brightness/saturation    
    if(!shiftPressed){
      brightValue = map(radius, outerR, outerR2, 0, 100);     
      satValue = 100;  
    } else {
      satValue = map(radius, outerR, outerR2, 0, 100);
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
  float d = dist(mouseX, mouseY, x, y);
  return (d <= r);
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
  // BM go to the next free rectangle
  if (isLocked) {
    currentRect++; 
    if (currentRect >= rectNum) {
      currentRect = 0;
    }
  }

  // if the user clicks in one of the rectangles at the bottom, print the color values
  if (mouseY > height-rectSize) {
    printColorValues();
  }
  //BM
  
  isLocked = false;    
}

// BM draw recttangles with chosen color at the bottom of the canvas 
void drawChosenColor() {
  float rectSizeC = rectSize/2;   

  if (isLocked) {
    c1[currentRect] = color(hueValue, satValue, brightValue);
    c2[currentRect] = color(calculateCompHue(hueValue), satValue, brightValue);
  } 

  for (int i = 0; i < rectNum; i++) {    
    fill(c1[i]);
    rect(i * rectSize, height-rectSize, rectSize, rectSize);
    fill(c2[i]);
    rect(i * rectSize + rectSize/4, height-rectSize+rectSize/4, rectSize/2, rectSize/2);
  }
}

void printColorValues() {
  int rectClicked; 
  float h, s, b;      // HSB-Values of clicked rect 
  float hc, sc, bc;   // HSB-Values of complementary color

  rectClicked = floor(mouseX/rectSize); // determine which rect has been clicked 
  h =  hue(c1[rectClicked]);
  s =  saturation(c1[rectClicked]);
  b =  brightness(c1[rectClicked]);
  hc = hue(c2[rectClicked]);
  sc = saturation(c2[rectClicked]);
  bc = brightness(c2[rectClicked]);

  println("color hue: "+h + " saturation: "+s + " brightness: "+ b);
  println("complementary color hue: "+hc + " saturation: "+sc + " brightness: "+ bc);
}

void keyPressed(){
  if( key == CODED && keyCode == SHIFT){
    shiftPressed = true; 
  }
}

void keyReleased(){
  shiftPressed = false; 
  satValue = 100; 
}


