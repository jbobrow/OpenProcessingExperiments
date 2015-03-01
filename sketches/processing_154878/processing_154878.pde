
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws an interactive colour selection wheel
 * Drag the colour   circle around the hue wheel to change hue, change the distance
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

float angle;
int sumaAngulo; 

// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
//
boolean isLocked = false;
boolean shift = false;

// Wheel radius: inner and outer
//
float innerR = 80; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float brightValue = 100;
float complementryHue = 0;
float satura = 100;
//MODIFIED
int cuadros = 5;
int tam, tam2;
int centroY; // en centro del circulo cromatico
float radiusComeHand;
float angleComHand;

//color a guardar
float[] base, complementario, brillo, saturacion;

int[] cenX;
int cenY;

float comHandX, comHandY;
float distance, radius;

void setup() {
  size(800, 720);
  //  size(displayWidth/2, displayHeight-100);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

    //MODIFIED
  tam = width/5;
  tam2 = tam-80;

  base = new float[cuadros];
  complementario = new float[cuadros];
  brillo = new float[cuadros];
  saturacion = new float[cuadros];
  cenX = new int[cuadros];
  centroY = height/2 - tam/2;

  colorHandleX = width/2+300;
  colorHandleY = centroY;
  radiusComeHand = 150;

  for (int i=0; i<cuadros; i++) {
    base[i] = 0;
    complementario[i] = 0;
    brillo[i] = 100;
    saturacion[i] = 100;
    cenX[i] = (width/cuadros/2)+width/cuadros*i;
  }
  cenY = height-tam/2;
  sumaAngulo=0;
  //
  //  distance = dist(mouseX, mouseY, width/2, centroY);
  //  radius = constrain(distance, outerR, outerR2);
  //
  //  colorHandleX = width/2  + radius * cos(angle+sumaAngulo);
  //  colorHandleY = centroY + radius * sin(angle+sumaAngulo);
}

void draw() {
  //Since were using HSB colour mode this clears the display window to white
  //         H  S  B
  background(0, 0, 100);

  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(width/2 - innerR, centroY, width/2 - outerR2, centroY);

  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i=0; i<=10; i++) {
    float angle = radians(36*i-90); // 10 x 36 degree steps
    fill(36*i, 100, 100);
    //outside(top)
    vertex(width/2 + outerR*sin(angle), centroY + outerR*cos(angle) );
    //inside(down)
    vertex(width/2 + innerR*sin(angle), centroY + innerR*cos(angle) );
  }
  endShape(CLOSE);

  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle
  dotLine(width/2, centroY, colorHandleX, colorHandleY, 40); 

  //draw color handle
  noStroke();
  fill(0);
  ellipse(width/2, centroY, 10, 10);
  //   H         S    B
  fill(hueValue, satura, brightValue);
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );

  //complementry color for colorHandle (comHand)
  angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-centroY)+radians(sumaAngulo), -PI, PI, TWO_PI, 0) + HALF_PI;
  comHandX = width/2  + radiusComeHand * cos(angleComHand);
  comHandY = centroY + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand
  dotLine(width/2, centroY, comHandX, comHandY, 20); 

  complementryHue = calculateCompHue(hueValue);
  complementryHue = complementryHue%360;

  if (complementryHue<=0)
    complementryHue=complementryHue+360;
  if (complementryHue>=360)
    complementryHue=complementryHue-360;

  //println("hueValue: "+hueValue + " + "+"comhue: "+complementryHue);

  fill(complementryHue, satura, brightValue );
  ellipse(comHandX, comHandY, 40, 40);

  rectMode(CENTER);
  //MODIFICACION
  for (int i=0; i<5; i++) {
    noStroke();  
    fill(base[i], saturacion[i], brillo[i]);
    rect(cenX[i], cenY, tam, tam);
    fill(complementario[i], saturacion[i], brillo[i]);
    rect(cenX[i], cenY, tam2, tam2);
  }

  fill(0);
  text("COLOR EN MODO HSB", 50, 50);
  text("HUE color = " + (int)hueValue, 50, 80);
  text("COMPLEMENTARY HUE color = " + (int)complementryHue, 50, 110);
  text("SATURATION = " + (int)satura, 50, 140);
  text("BRIGHTNESS = " + (int)brightValue, 50, 170);
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
    return hueValue-180+sumaAngulo;
  } else 
    return hueValue+180-sumaAngulo;
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
    angle = atan2(mouseY-centroY, mouseX-width/2);
    distance = dist(mouseX, mouseY, width/2, centroY);
    radius = constrain(distance, outerR, outerR2);

    if (shift) {
      satura = map(radius, outerR, outerR2, 0, 100);
    } else {
      hueValue = map (degrees(angle), -180, 180, 360, 0);
      // map distance from outer edge of the wheel to brightness
      brightValue = map(radius, outerR, outerR2, 0, 100);
      colorHandleX = width/2  + radius * cos(angle);
      colorHandleY = centroY + radius * sin(angle);
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

//MODIFIED
boolean enRecuadros(float x, float y, float r) {
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
  for (int i=0; i<cuadros; i++) {
    if (enRecuadros(cenX[i], cenY, tam/2)) {
      base[i] = hueValue;
      complementario[i] = complementryHue;
      brillo[i] = brightValue;
      saturacion[i] = satura;
    }
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
  if (keyCode==SHIFT) {
    shift = true;
    println(shift);
  }
  if (keyCode==DOWN) {
    sumaAngulo+=30;
    sumaAngulo=sumaAngulo%360;
    println(sumaAngulo);
  }
  if (keyCode==UP) {
    if (sumaAngulo<=0) {
      sumaAngulo= sumaAngulo+360;
    }
    sumaAngulo-=30;
    sumaAngulo=sumaAngulo%360;
    println(sumaAngulo);
  }
  //  println(angleComHand);
}
void keyReleased() {
  if (keyCode==SHIFT) {
    shift = false;
    println(shift);
  }
}



