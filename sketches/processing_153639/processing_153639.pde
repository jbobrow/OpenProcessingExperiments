
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
 *
 *
 * Switch to the next slot – Enter
 * Change the angle of the complimentary hue by 30 degrees –  Left / Right keys
 * Varying the saturation – Up / Down keys
 *
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
float slope = 0;

// storing colours
int storedNum = 10;
color[] storedColor;
color[] storedComplementaryColor;
int currentStore;

// artboard
int art_width = 800;
int art_height = art_width - 50;
int storeSize = art_width / storedNum;
float complementaryPart = 0.5;
float complementaryOffset = (1 - complementaryPart) * storeSize / 2;

void setup() {

  size(art_width, art_height + storeSize);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

  colorHandleX = width/2+300;
  colorHandleY = art_height/2;
  
  // stored colours
  
  storedColor = new color[storedNum];
  storedComplementaryColor = new color[storedNum];
  
  for (int i=0; i < storedNum; i++) {
      storedColor[i] = color(350 + (i-storedNum)*10);
      storedComplementaryColor[i] = color(350);
  }
  
  setColorsByValues();
 
  currentStore = 0;
  
  
}


void draw() {
  //Since were using HSB colour mode this clears the display window to white
  //         H  S  B
  background(0, 0, 100);

//  // draw reference line at the 0/360 hue boundary
//  stroke(0, 40);
//  line(width/2 - innerR, height/2, width/2 - outerR2, height/2);

  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=10; i++) {
    float angle = radians(36*i-90+18); // 10 x 36 degree steps

    //   Hue   Sat  Brightness
    fill(36*i, 100, 100);  // change the colour as we're building the quads

    //outside(top)
    vertex( width/2 + outerR*sin(angle), art_height/2 + outerR*cos(angle) );
    //inside(down)
    vertex( width/2 + innerR*sin(angle), art_height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);


  //
  //
  // colorHandle
  //
  //
  
  // colour handle Position & mainColor Update
  colorHandleUpdate();


  //draw dotted line from center to colorhandle
  dotLine(width/2, art_height/2, colorHandleX, colorHandleY, 40); 
  
  // draw colorhandle
  fill(mainColor());
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //draw color handle rotation centre
  noStroke();
  fill(0);
  ellipse(width/2, art_height/2, 10, 10);

  //
  //
  //draw color handle rotation centre
  //
  //  
  noStroke();
  fill(0);
  ellipse(width/2, art_height/2, 10, 10);

  //
  //
  // complementry color for colorHandle (comHand)
  //
  //

  float angleComHand = atan2(colorHandleY-art_height/2, colorHandleX-width/2) + PI - slope;
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = art_height/2 + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, art_height/2, comHandX, comHandY, 20); 


  fill( complementaryColor() );
  ellipse(comHandX, comHandY, 40, 40);
  
  //
  //
  // stored colours
  //
  //
  
  noStroke();

  // highlight current slot
  fill(storedColor[currentStore]);
  ellipse((currentStore+0.5)*storeSize, 
          height-0.5*storeSize, 
          storeSize*sqrt(2), 
          storeSize*sqrt(2));


  for (int i = 0; i < storedNum; i++) {
      // main color
      fill(storedColor[i]);
      rect(i*storeSize, height-storeSize, storeSize, storeSize);

      // complementary color
      fill(storedComplementaryColor[i]);
      rect(i*storeSize + complementaryOffset, height-storeSize + complementaryOffset, 
           storeSize * complementaryPart, storeSize * complementaryPart);
  }
  
  
  
}

/*
 * calculateCompHue
 *
 * Calculates the complementary hue from the hue supplied
 */
float calculateCompHue(float hueValue) {

  // Calculate complementary color with hueValue
  // The complementary colour should be 180 degrees opposite the selected colour
  
  float t = hueValue+180+degrees(slope);
  return t % 360;
  
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
    float angle = atan2(mouseY-art_height/2, mouseX-width/2  );
    float distance = dist(mouseX, mouseY, width/2, art_height/2);
    float radius = constrain(distance, outerR, outerR2); 
    colorHandleX = width/2  + radius * cos(angle);
    colorHandleY = art_height/2 + radius * sin(angle);

    hueValue = map (degrees(angle), -180, 180, 360, 0);

    // map distance from outer edge of the wheel to brightness
    brightValue = map(radius, outerR, outerR2, 0, 100);
    
    //Shape for the locked colorHandle 
    noStroke(); 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  } 
  
  setColorsByValues();
}

void setColorsByValues() {
    
    storedColor[currentStore] = color(hueValue, saturationValue, brightValue);
    storedComplementaryColor[currentStore] = color(calculateCompHue(hueValue), 
                                                    saturationValue, brightValue);

}


color mainColor() {
    return storedColor[currentStore];
}

color complementaryColor() {
    return storedComplementaryColor[currentStore];
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
}


void keyPressed() {
    if (key == CODED) {
        if (keyCode == LEFT) {
            slope += radians(30);
            slope = (slope + TWO_PI) % TWO_PI;
        } else if (keyCode == RIGHT) {
            slope -= radians(30);
            slope = (slope + TWO_PI) % TWO_PI;
        } else if (keyCode == DOWN) {
            saturationValue -= 10;
            if (saturationValue < 0) saturationValue = 0;
         } else if (keyCode == UP) {
            saturationValue += 10;
            if (saturationValue > 100) saturationValue = 100;
        }
    } else if (key == ENTER) {
        currentStore++;
        if (currentStore >= storedNum) currentStore = 0;
    }
}
