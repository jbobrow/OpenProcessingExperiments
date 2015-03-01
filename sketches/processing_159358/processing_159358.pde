
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
 */

// colourHandle: the user interface element to changing colours over the wheel
// It has a postion and a size


float extraAngle = 0;
float colorHandleX;
float colorHandleY;
float handleSize = 60;
color[] colorInnerSq = new color[5];
color[] colorOuterSq = new color[5];
int j=49;
int k=0;
// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
//  but only when the mouse pointer is close to the handle
boolean isLocked = false;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 180;
float satValue = 100;
float brightValue = 100;
float complementryHue = 0;

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  colorHandleX = width/2+300;
  colorHandleY = height/2;
  // Initialize the stored dimmed colors and their complementary colors
  for (int i=0; i<5; i++) {
    colorOuterSq[i] = colorInnerSq[(i+3)%5] = color(60*i, 10, 100);
  };
}  //end of setup

void draw() {

  //Since we're using HSB colour mode, this clears the display window to nearly white
  //         H  S  B
  background(0, 0, 98);

  fill(0, 0, 0);  //First some captions
  textSize(15);
  String s = "Click on the circular handle and move it round to change colors.  Move it in and out to change brightness, OR to change saturation if any key is also pressed. Color is only stored at bottom if mouse released wihin the handle.";
  text(s, 25, 20, 430, 100);  // Text wraps within text box
  String sa = "Up and Down arrows shift the complementary color by 10 degrees. Enter returns it to original.";
  text(sa, 500, 20, 300, 100); 
  String sb = "Brightness";
  text(sb, 85, 570);
  String sc = "Saturation";
  text(sc, 85, 630);
    String sd = "red";
  text(sd, 85, 400);
      String se = "green";
  text(se, 555, 660);
      String sf = "blue";
  text(sf, 555, 140);
  
  //  For drawing lines etc., angle increases clockwise from vertical at top = zero
  //  Hue however increases anticlockwise starting at -90
  float angleR = radians(-90);
  float angleG = radians(30);
  float angleB = radians(150);
  stroke(0, 40);
  line(width/2 + outerR*sin(angleR), height/2 + outerR*cos(angleR), width/2 + outerR2*sin(angleR), height/2 + outerR2*cos(angleR));
  line(width/2 + outerR*sin(angleG), height/2 + outerR*cos(angleG), width/2 + outerR2*sin(angleG), height/2 + outerR2*cos(angleG));
  line(width/2 + outerR*sin(angleB), height/2 + outerR*cos(angleB), width/2 + outerR2*sin(angleB), height/2 + outerR2*cos(angleB));

  //draw Itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=18; i++) {
    float angle = radians(20*i-80); // 18 x 20 degree steps

    //   Hue   Sat  Brightness
    fill(20*i, 100, 100);  // change the colour as we're building the quads

    //outside(top)
    vertex( width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex( width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);

  // colour handle Position Update. This function defines the hue and brightness
  colorHandleUpdate();
  
 //  Put a ring round the handle when it is close to white in color.
if (satValue <= 15 && brightValue >= 85)  {
noFill();
stroke(1,50);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );
noStroke();
};  
//draw dotted line from center to colorhandle
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40); 

  //draw centre circle
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 10, 10);

  //draw color handle
  //   Hue       Sat  Brightness
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //complementry color for colorHandle (comHand)
  float angleComHand = atan2(colorHandleY-height/2, colorHandleX-width/2) + PI - extraAngle;
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, height/2, comHandX, comHandY, 20); 

  complementryHue = calculateCompHue(hueValue);
  println(" hue = " + hueValue + "   saturation =  " + satValue + "   brightness =   " + brightValue +  "      complement of hue = " + complementryHue );
  fill( complementryHue, satValue, brightValue );
  ellipse(comHandX, comHandY, 40, 40);

  //loop to draw the all of squares with their stored colors
  for (int i=0; i<5; i++ ) {
    fill(colorOuterSq[i]); 
    rect(50 + 150*i, 680, 100, 100);
    fill(colorInnerSq[i]);
    rect(80 +150*i, 710, 40, 40);
  };  //end of for

  if (mousePressed==true) {  //Note: the function mousePressed is not called by this statement
    colorOuterSq[k] = color(hueValue, satValue, brightValue);
    colorInnerSq[k] = color(complementryHue, satValue, brightValue);
  }  //end of if mousePressed
}  //  end of draw

/*
 * calculateCompHue
 *
 * Calculates the complimentary hue from the hue supplied
 */
//FUNCTION
float calculateCompHue(float hueValue) {
  hueValue = hueValue + degrees(extraAngle);
  // Calculate complimentary color with hueValue
  // The complimentary colour should be 180 degrees opposite the selected colour
  if (hueValue >= 180 && hueValue < 390) {  //390 is necessary here to allow for keyboard arrow shift
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

     if (keyPressed != true) {     // map distance from outer edge of the wheel to brightness
         brightValue = map(radius, outerR, outerR2, 0, 100);
  fill(hueValue, satValue, brightValue);
  rect(25, 540, 50, 50);
  }  //end of if keyPressed
  else {
        satValue = map(radius, outerR, outerR2, 0, 100);    // now map to saturation

    fill(hueValue, satValue, brightValue);      
    rect(25, 600, 50, 50);
  } 
    //Grey border around the colorHandle when locked 
    noStroke(); 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  }
}  //end of colorHandleUpdate

/*
 * isWithinCircle
 * boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
 */
// FUNCTION
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
  //  stores the current color and its complement
  if (isWithinCircle(colorHandleX, colorHandleY, handleSize)) {
    j++;
    k=j%5;
    colorOuterSq[k] = color(hueValue, satValue, brightValue);
    colorInnerSq[k] = color(complementryHue, satValue, brightValue);
    if (k!=4) {
      k++;
    } else { 
      k=0;
    };
  }
  isLocked = false;
}  //end of void mouseReleased

//This functionallows shift of complementary color circle
void keyPressed() {
  if (keyCode == UP) {
    extraAngle =radians(10);
  } else if (keyCode == DOWN) {
    extraAngle =radians(-10);
  } else if (keyCode == ENTER) {
    extraAngle =radians(0);
  }
}  //end of void keyPressed



