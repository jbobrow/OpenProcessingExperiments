
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
float handleSize = 50;
// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is lockedâ��released as the left mouse button is released 
//
boolean isLocked = false;
// Wheel radius: inner and outer
//
float innerR = 70; // inner
float outerR = 250; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range
// current and complementry colour
float hueValue = 180;
float brightValue = 100;
float satValue = 100;
float complementryHue = 0;
int num = 0;
color[] colorArray = new color[6];
color[] compArray = new color[6];


void setup() {

  size(800,800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  colorHandleX = width/2+300;
  colorHandleY = height/2;
  for (int i=0;i<6;i++){
   colorArray[i]=color(0,0,0);
   compArray[i]=color(0,0,0);
  }
  
}

void draw() {
  
  //Since were using HSB colour mode this clears the display window to white
  //         H  S  B
  background(0, 0, 100);

  //draw saturation indicator
  stroke(0, 150);
  strokeWeight(0.5);
  fill(0,0,95);
  float radius=map(satValue,100,0,100,10);
  ellipse(width/2,height/2,radius,radius);
 
  //squares   
  
  float w = (width-15)/6;
  float t= height-w;

  for (int i=0;i<6;i++){
      
    fill(colorArray[i]);
    if (i==num){
       noStroke();
       fill(hueValue, satValue, brightValue);
    }
    noStroke();
    rect(i*(w+3),t+2*w/3,w,w/3 );
    fill(compArray[i]);
    if (i==num){
       fill(complementryHue, satValue, brightValue);
    }
      noStroke();
    rect(i*(w+3),height-2*w/3,w ,w/3 );     
  }
  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=360; i++) {
    float angle = radians(i-90); // 360x1  degree steps
    //   Hue   Sat  Brightness
    fill(i, satValue, 100);  // change the colour as we're building the quads
    //outside(top)
    vertex( width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex( width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
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

  //   Hue       Sat  Brightness
  fill(hueValue, satValue, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //complementry color for colorHandle (comHand)
  float angleComHand = atan2(colorHandleY-height/2, colorHandleX-width/2) + PI;
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, height/2, comHandX, comHandY, 20); 

  complementryHue = calculateCompHue(hueValue);

  //println("hueValue: "+hueValue + " + "+"comhue: "+complementryHue);

  fill( complementryHue, satValue, brightValue );
  ellipse(comHandX, comHandY, 40, 40);
}

/* calculateCompHue
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

    // map distance from outer edge of the wheel to brightness
    brightValue = map(radius, outerR, outerR2, 0, 100);

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

void mousePressed() {
  if (isWithinCircle(colorHandleX, colorHandleY, handleSize)) {
    isLocked = true;
  }
}

void mouseReleased() {
  isLocked = false;
  colorArray[num]= color(hueValue, satValue, brightValue);
  compArray[num]= color(complementryHue, satValue, brightValue);
  num++;
  if (num==6) 
      num=0;
}


void keyPressed() {

  if (key == CODED) {
     if (keyCode == UP) {
      if (satValue<100){
      satValue++;
      }
    } else if (keyCode == DOWN) {
      if (satValue >0){
      satValue--;
      }
    } 
  }
}
  

