
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
float satValue=100;
float satLineY=600;
// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is lockedâ��released as the left mouse button is released 
//
boolean isLocked = false;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 90;
float brightValue = 100;
float complementryHue = 0;

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

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

  //draw itten's color wheel - we'll use a QUAD_STRIP for this
  noStroke();
  beginShape(QUAD_STRIP);         //dibuja "cuadros" de manera consecutiva
  for (int i=0; i<=720; i++) {  //segundo valor de i es el numero de "cuadros" que vamos a tener
    float angle = radians(.5*i-90); // 10 x 36 degree steps
    fill(.5*i, 100, 100); //relleno del cuadro en turno

    //outside(top)
    vertex(width/2 + outerR*sin(angle), height/2 + outerR*cos(angle) );
    //inside(down)
    vertex(width/2 + innerR*sin(angle), height/2 + innerR*cos(angle) );
  }
  endShape(CLOSE);


  // colour handle Position Update
  colorHandleUpdate();

  //draw dotted line from center to colorhandle linea punteada del circulo movil
  dotLine(width/2, height/2, colorHandleX, colorHandleY, 40); 

  //draw color handle
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 10, 10); //el puntito negro del centro :V
  //   H         S    B
  fill(hueValue, satValue, brightValue); // color del circulo movil
  ellipse(colorHandleX, colorHandleY, handleSize, handleSize );//circulo movil, tamaÃ±o y posiciÃ³n fijos desde el comienzo 

  //complementry color for colorHandle (comHand)
  float angleComHand = map( atan2(colorHandleX-width/2, colorHandleY-height/2), -PI, PI, TWO_PI, 0) + HALF_PI;
  float radiusComeHand = 150;
  float comHandX = width/2  + radiusComeHand * cos(angleComHand);
  float comHandY = height/2 + radiusComeHand * sin(angleComHand);

  //dotline from center to comHand linea punteada del circulo fijo
  dotLine(width/2, height/2, comHandX, comHandY, 20); //primeros valores punto de origen en x & y, tercer y cuarto valor punto final, ultimo numero de puntos

  complementryHue = calculateCompHue(hueValue);




  //println("hueValue: "+hueValue + " + "+"comhue: "+complementryHue);

  noStroke();
  fill( complementryHue, satValue, brightValue );
  ellipse(comHandX, comHandY, 40, 40); //dibuja el circulo fijo

 for(int i =0; i<100; i++){
   noStroke();
  float barSat = i;
  fill(hueValue, barSat, brightValue);
  rect(30,100+(5*i),20,5);
 }
 stroke (0,100);
  noFill();
 rect(30, 100, 20, 500);
 line(25,satLineY, 55, satLineY);
 fill(50);

  
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
  }
  else 
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

    // map distance from outer edge of the wheel to brightness
    brightValue = map(radius, outerR, outerR2, 0, 100);

    //Shape for the locked colorHandle sombra cuando le clickeas el circulo movil
    noStroke(); 
    fill(0, 0, 85);
    ellipse(colorHandleX, colorHandleY, handleSize+20, handleSize+20);
  }
}         //fin del colorHandUpdate


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
 * draw a dotted line from (x1,y1) to (x2,y2) define los valores para la linea puntada de arriba 
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
    if(mouseX>=30 && mouseX <=50 && mouseY>=100 && mouseY<=600)
  {
    satValue = (mouseY-100)/5;
    satLineY = mouseY;
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
  // left and right arrow keys to change saturation
  if ( keyPressed ) {
    if (keyCode == LEFT && satValue > 5) {
      satValue -= 5;
    }
    else if (keyCode == RIGHT && satValue < 100) {
      satValue += 5;
    }
  }
}
