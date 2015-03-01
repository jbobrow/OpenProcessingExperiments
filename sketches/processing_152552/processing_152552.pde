
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 *
 * HUE rotate handle
 * SAT/BRI handle in/out + 180 deg complementary color
 *
 * Possible improvement #3
 * 1=Current colour & complement in row of colour squares along the bottom of the window.
 * 2=Change angle of complementary hue eg inc/decrement angle by 30 degrees using arrow keys.
 * 3=Vary the saturation, using keyPressed shift to vary sat instead of bright
 */

// colourHandle has postion and size
float colorHandleX;
float colorHandleY;
float handleSize = 30;
float radius;

// color hand is locked–released as the left mouse button is released 
boolean isLocked = false;
boolean isCapped = false;

// Wheel radius: inner and outer
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float satbriValue = 100;
float complementryHue = 0;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100); //H=0->360, S/B=0->100
    colorHandleX = width/2+300;
  colorHandleY = height/2;
}

void draw() {
  background(0, 0, 100);   //in HSB clear window to white
  stroke(0, 40);   // draw reference line at the 0/360 hue boundary
  line(width/2 - innerR, height/2, width/2 - outerR2, height/2);
  noStroke();   //draw itten's color wheel - we'll use a QUAD_STRIP for this
  beginShape(QUAD_STRIP);
  for (int i=0; i<=10; i++) {
    float angle = radians(36*i-90); // 10 x 36 degree steps
    fill(36*i, 100, 100);
    vertex(width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );     //outside(top)
    vertex(width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );    //inside(down)
  }
  endShape(CLOSE);
  colorHandleUpdate();   // colour handle Position Update
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40);    //draw dotted line from center to colorhandle
  noStroke();   //draw color handle
  fill(0);
  ellipse(width/2, height/2, 10, 10);
  fill(hueValue, 100, satbriValue); //hsb
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );
  float angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;   //complementry color 4 comHand
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);
  dotLine(width/2, height/2, comHandX, comHandY, 20);   //dotline from center to comHand
  complementryHue = calculateCompHue(hueValue);
  fill( complementryHue, 100, satbriValue );
  ellipse(comHandX, comHandY, 40, 40);
}

//calculates the complimentary hue 180 degrees opposite the selected colour
 float calculateCompHue(float hueValue) {
  if (hueValue >= 180 && hueValue < 360) {
    return hueValue-180;
  }
  else 
    return hueValue+180;
}

//updates pos and orientation of the colour handle based on mouse position when left mouse button is pressed.
void colorHandleUpdate() {
  if (isLocked) {   // isLocked true if press mouse down while over the handle
    // calculate angle of handle based on mouse position, atan2 value is in the range from pi to -pi
    float angle = atan2(mouseY-height/2, mouseX-width/2  );
    float distance = dist(mouseX, mouseY, width/2, height/2);
    radius = constrain(distance, outerR, outerR2); 
    colorHandleX = width/2  + radius * cos(angle);
    colorHandleY = height/2 + radius * sin(angle);
    hueValue = map (degrees(angle), -180, 180, 360, 0);
    // map distance from outer edge of the wheel to brightness
    if(isCapped) {
     satbriValue = map(radius, outerR, outerR2, 100, 0); 
    }
    else {
     satbriValue = map(radius, outerR, outerR2,  0, 100); 
    }
    noStroke();     //Shape for the locked colorHandle 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  }
}

//boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
boolean isWithinCircle(float x, float y, float r) {
  float dist = dist(mouseX, mouseY, x, y);
  return (dist <= r);
}

//draw a dotted line from (x1,y1) to (x2,y2)
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

void keyPressed() {
 isCapped = false;
 if (key == CODED) {
    if (keyCode == SHIFT) {
      isCapped = true;
    } 
  } 
}

//When mouse button is pressed, check if the user has pressed over the colour handle
void mousePressed() {
  if (isWithinCircle(colorHandleX, colorHandleY, handleSize)) {
    isLocked = true;
  }
}

//Unlock control of the handle
void mouseReleased() {
  isLocked = false;
}

