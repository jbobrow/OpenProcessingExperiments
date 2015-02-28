
// MAIN PARAMETERS

float radians;
float posX;
float posY;

float radiansStep;
float radiusX = 200;
float radiusY = 200;

// DRAWING DATA

float codeX0 = 20;
float codeX4;
float codeX6;
float codeX8;
float codeX15;
float codeX16;
float codeX17;
float codeX18;
float codeY1 = 570;
float codeY2 = 595;
float codeY3 = 620;
float code4CharW;

float checkboxX = 448;  
float checkboxY1 = 572;
float checkboxY2 = 597;
float checkboxY3 = 622;

PFont codeFont;
PFont controlFont;

color radColor = color(220,20,0);
color cosColor = color(30,200,0);
color sinColor = color(45,100,255);
color widthColor = color(0,240,195);
color heightColor = color(25,195,250);

// INTERFACE DATA

String draggingParam = "";
String clickParam = "";
boolean radVisible = false;
boolean cosVisible = false;
boolean sinVisible = false;

// INITIALIZATIONS

void setup()
{
  size(540, 640);
  
  codeFont = createFont("Courier New Bold", 18);
  controlFont = createFont("Verdana", 15);
  textFont(codeFont);
  codeX4 = codeX0 + textWidth("1234");
  codeX6 = codeX0 + textWidth("123456");
  codeX8 = codeX0 + textWidth("12345678");
  codeX15 = codeX0 + textWidth("123456789012345");
  codeX16 = codeX0 + textWidth("1234567890123456");
  codeX17 = codeX0 + textWidth("12345678901234567");
  codeX18 = codeX0 + textWidth("123456789012345678");

  radiansStep = TWO_PI/720;
}

// DRAWING FUNCTIONS

void draw () 
{
  background(224);  

  radians = frameCount*radiansStep;

  posX = cos(radians)*radiusX;
  posY = sin(radians)*radiusY;

  drawGraph();
  drawCode();
  drawControls();
}

void drawGraph() 
{
  translate(width/2, width/2);
  
  float radCos = cos(radians);
  float radSin = sin(radians);

  // graph area
  fill(255);
  noStroke();
  rect(-250, -250, 500, 500);

  // radians arc
  if (radVisible) {
    fill(radColor,26);
    arc(0,0, 80,80, 0, radians % TWO_PI );
  }
  
  // cartesian axes
  stroke(192,200);
  strokeWeight(0.5);
  line(0, -250, 0, 250);
  line(-250, 0, 250, 0);
  
  // cosine and sine projections
  if (cosVisible || sinVisible) {
    line(0, radSin*40, radCos*40, radSin*40);
    line(radCos*40, 0, radCos*40, radSin*40);
  }
  
  strokeWeight(3);
   
  // cosine and horizontal radius lines 
  if (cosVisible) {
    stroke(cosColor);
    line(0, 0, radCos*39, 0);
    stroke(widthColor,160);
    line(1,248,radiusX-1,248);
  }
  
  // sine and vertical radius lines 
  if (sinVisible) {
    stroke(sinColor);
    line(0, 0, 0, radSin*39);
    stroke(heightColor,160);
    line(248,1,248,radiusY-1);
  }

  strokeWeight(1);

  // point projections
  stroke(212);
  line(posX, -250, posX, 250);
  line(-250, posY, 250, posY);

  // point
  stroke(96);
  fill(255);
  ellipse(posX, posY, 7, 7);

  resetMatrix();
}

void drawCode()
{
  // panel area
  noStroke();
  fill(255);
  rect(0, width, width, height-width);

  float radVal = int((radians % TWO_PI) * 100) / 100.0; 
  textFont(codeFont);
  
  // static text
  fill(96);
  text("    =     ;", codeX0, codeY1);
  text("x =    (   ) *", codeX0, codeY2);
  text(";", (radiusX<10)? codeX16 : (radiusX<100)? codeX17 : codeX18, codeY2);
  text("y =    (   ) *", codeX0, codeY3);
  text(";", (radiusY<10)? codeX16 : (radiusY<100)? codeX17 : codeX18, codeY3);
  
  // radiant texts
  fill(radVisible? color(radColor,150):96 );
  text("rad", codeX0, codeY1);
  text(nf(radVal, 1, 2), codeX6, codeY1);
  text("rad", codeX8, codeY2);
  text("rad", codeX8, codeY3);
  
  // cosine and horizontal radius texts
  fill(cosVisible? cosColor:96 );
  text("cos", codeX4, codeY2);
  fill(cosVisible? widthColor:96 );
  text(int(radiusX), codeX15, codeY2);
  
  // sine and vertical radius texts
  fill(sinVisible? sinColor:96 );
  text("sin", codeX4, codeY3);
  fill(sinVisible? heightColor:96 );
  text(int(radiusY), codeX15, codeY3);
}

void drawControls() 
{
  stroke(0);
  fill(255);

  // horizontal radius cursors
  float x1 = 270-radiusX;
  float x2 = 270+radiusX;
  triangle(x1,520, x1+6,530, x1-6, 530);
  triangle(x2,520, x2+6,530, x2-6, 530);

  // vertical radius cursors
  float y1 = 270-radiusY;
  float y2 = 270+radiusY;
  triangle(520,y1, 530,y1+6, 530,y1-6);
  triangle(520,y2, 530,y2+6, 530,y2-6);

  stroke(96);
  textFont(controlFont);
  
  // checkboxes  
  rect(checkboxX,checkboxY1-9,10,9);
  rect(checkboxX,checkboxY2-9,10,9);
  rect(checkboxX,checkboxY3-9,10,9);
  fill(0);
  if (radVisible) {
    text("x", checkboxX+1, checkboxY1); 
  }
  if (cosVisible) {
    text("x", checkboxX+1, checkboxY2); 
  }
  if (sinVisible) {
    text("x", checkboxX+1, checkboxY3); 
  }

  // checkbox labels
  fill(radColor,150);
  text("radians", checkboxX+16, checkboxY1);
  fill(cosColor);
  text("cosine", checkboxX+16, checkboxY2);
  fill(sinColor);
  text("sine", checkboxX+16, checkboxY3);
}

// EVENT FUNCTIONS

void mouseMoved () 
{
  draggingParam = "";
  clickParam = "";

  cursor(ARROW);
  if (mouseX > 520 && mouseX <530) {           // check for vertical radius cursors
    float y1 = 270 - radiusY;
    float y2 = 270 + radiusY;
    float dy1 = abs(mouseY - y1);
    float dy2 = abs(mouseY - y2);
    if (dy1 < 5 || dy2 < 5) {
      draggingParam = "radiusY";
      cursor(MOVE);
    }
  } else if (mouseY > 520 && mouseY <530) {   // check for horizontal radius cursors
    float x1 = 270 - radiusX;
    float x2 = 270 + radiusX;
    float dx1 = abs(mouseX - x1);
    float dx2 = abs(mouseX - x2);
    if (dx1 < 5 || dx2 < 5) {
      draggingParam = "radiusX";
      cursor(MOVE);
    }
  } else if (mouseX>checkboxX && mouseX<520 && mouseY>checkboxY1-16) {   // check for checkboxes
      if (mouseY<checkboxY1) {
        clickParam = "radVisible";
      } else if (mouseY>checkboxY2-16 && mouseY<checkboxY2) {
        clickParam = "cosVisible";
      } else if (mouseY>checkboxY3-16 && mouseY<checkboxY3) {
        clickParam = "sinVisible";
      }
      if (clickParam != "") {
        cursor(HAND);
      }
  }
}

void mouseDragged() 
{
  if (draggingParam == "radiusX") {           // dragging horizontal radius cursors
    float newradiusX = abs(mouseX - 270);
    if (newradiusX > 250) {
      draggingParam = "";
      cursor(ARROW);
    } else {
      radiusX = newradiusX;
    }
  } else if (draggingParam == "radiusY") {    // dragging vertical radius cursors
    float newradiusY = abs(mouseY - 270);
    if (newradiusY > 250) {
      draggingParam = "";
      cursor(ARROW);
    } else {
      radiusY = newradiusY;
    }
  }
}

void mouseClicked()
{
  // check and change checkboxes status
  if (clickParam == "radVisible") {
    radVisible = !radVisible;
  } else if (clickParam == "cosVisible") {
    cosVisible = !cosVisible;
  } else if (clickParam == "sinVisible") {
    sinVisible = !sinVisible;
  }
}

