
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws an interactive colour selection wheel
 * Drag the colour circle around the hue wheel to change hue,
 * 
 *
 * Another colour circle is displayed showing the colour 180 degrees
 * from the current colour
 * Modified to change Saturation or Brightness
 * using LEFT and RIGHT mouse buttons
 *
 * the sample boxes can be individually chosen
 * and the current one is highlighted
 * 
 */

/* colourHandle: the user interface element to changing colours
 * over the wheel
 * It has a postion and a size
*/
float colorHandleX;
float colorHandleY;
float handleSize = 30;

// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
// mode 1 is for adjusting brightness; mode 2 is for adjusting saturation 
boolean isLocked = false;
int mode;

// boxes
int box = 0; // first press changes it to 0
float[] outercol = new float [4];
float[] innercol = new float [4];
float[] outersat = new float [4];
float[] innersat = new float [4];
float[] outerbri = new float [4];
float[] innerbri = new float [4];

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 100;
float brightValue = 100;
float satValue = 100;
float complementryHue = 0;
float complementrySat = 0;
float complementryBri = 0;

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  // use HSB colour mode, H=0 to 360, S=0 to 100, B=0 to 100

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

  //draw Itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=360; i++) {
    float angle = radians(i-90); // 360 x 1 degree steps
    fill(i, 100, 100);

    //outside(top)
    vertex(width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex(width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);
  
  // add lables
  fill(0);
  text("Press 'b'", 100, 30);
  text("for next box", 100, 50);
  text("ROTATE", 10, 130);
  text("hue", 100, 130);
  text("RIGHT", 10, 150);
  text("saturation", 100, 150);
  text("LEFT", 10, 170);
  text("brightness", 100, 170);


  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40); 

  //draw color handle
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 10, 10);
  //   H         S    B
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );
  
  //store parameters of outer box if mouse pressed
  if(isLocked == true) {  
  outercol[box] = hueValue;
  outersat[box] = satValue;
  outerbri[box] = brightValue;
  }
  
  //draw all outer boxes and labels
  for(int i = 0; i < 4; i++) { 
    fill(outercol[i], outersat[i], outerbri[i]);
    rect(i*100 + 200, 0, 100, 100);
    fill(0);
    text((int) outercol[i], i*100 + 200, 130);
    text((int) outersat[i], i*100 + 200, 150);
    text((int) outerbri[i], i*100 + 200, 170);
  }
  

  //complementry color for colorHandle (comHand)
  float angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, height/2, comHandX, comHandY, 20); 

  complementryHue = calculateCompHue(hueValue);
  complementrySat = satValue;
  complementryBri = brightValue;

  // println("hueValue: " + (int) hueValue + " + comhue: " + (int) complementryHue);
  // println("satValue: " + (int) complementrySat + " ; brightValue : " + (int) complementryBri);

  fill( complementryHue, complementrySat, complementryBri);
  ellipse(comHandX, comHandY, 40, 40);
  
  //store parameters of inner box
  if(isLocked == true) {  
    innercol[box] = complementryHue;
    innersat[box] = complementrySat;
    innerbri[box] = complementryBri;
  }

  //draw all inner boxes and labels when button pressed
  for(int i = 0; i < 4; i++) {
    noStroke(); 
    fill(innercol[i], innersat[i], innerbri[i]);
    rect(i*100 + 225, 25, 50, 50);
    fill(0);
    text((int) innercol[i], i*100 + 225, 130);
    text((int) innersat[i], i*100 + 225, 150);
    text((int) innerbri[i], i*100 + 225, 170);
  }
   
   // highlight current box
   strokeWeight(4);
   stroke(200);
   noFill();
   rect(box*100 + 202, 1, 96, 96);
}

/*
 * calculateCompVals
 *
 * Calculates the complimentary hue from the hue supplied
 */
float calculateCompHue(float hueValue) {
  // Calculate complimentary color with hueValue
  // The complimentary colour should be 180 degrees opposite the selected colour
  if (hueValue >= 180 && hueValue < 360) {
    return hueValue-180;
  } else return hueValue+180;
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

    // map distance from outer edge of the wheel for brightness or saturation
    if(mode == 1) {
      brightValue = map(radius, outerR, outerR2, 0, 100);
    } else if(mode ==2) {
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
  if(mouseButton == LEFT) {
    mode = 1;
  } else if(mouseButton == RIGHT) {
    mode = 2;
  }
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
  if(key == 'b' || key == 'B') {
    box = (box + 1) % 4;
  }
}



