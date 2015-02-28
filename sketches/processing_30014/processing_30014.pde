

 import processing.pdf.*;

HScrollbar ascenderControl, capHeightControl, xHeightControl, theBaselineControl, descenderControl, emWidthControl;

boolean recording;
PGraphicsPDF pdf;
PFont DIN;

color white = color(255);
color black = color(0);
color lightGray = color(225);
color extraLightGray = color(225, 200);

float ascenderHeight = 62.5;
float capHeight = 50.0;
float xHeight = 25.0;
float descenderHeight = 30.0;
float emWidth = 50.0;

float cX = 0;
float charWidthMin = 20;
float charWidthMax = 200;

float l = 2;
float h = 5;

void setup() {
  size(1440, 900);
  background(white);
  frameRate(3);

  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "HAMBURGEFONSTIV.pdf");
  cX = 200;

  //  String[] fontList = PFont.list();
  //  println(fontList);

  ascenderControl = new HScrollbar(ascenderHeight, 10, 40, 100, 10, 10);
  capHeightControl = new HScrollbar(capHeight, 10, 90, 100, 10, 10);
  xHeightControl = new HScrollbar(xHeight, 10, 140, 100, 10, 10);
  descenderControl = new HScrollbar(descenderHeight, 10, 190, 100, 10, 10);
  emWidthControl = new HScrollbar(emWidth, 10, 240, 100, 10, 10);

  DIN = loadFont("DIN-Regular-12.vlw");
  textFont(DIN, 12);

  smooth();
}

void draw() {
 
  
  

  background(white);
  if (!recording) {
    createConsole();
  }

  ascenderHeight = ascenderControl.getPos();
  capHeight = capHeightControl.getPos();
  xHeight = xHeightControl.getPos();
  descenderHeight = descenderControl.getPos();
  emWidth = emWidthControl.getPos();

  float divider = 20.0;

  // draw vertical emWidth rules
  drawVerticalRules(cX+(emWidth * 0)+(divider * 1));
  drawVerticalRules(cX+(emWidth * 1)+(divider * 2));
  drawVerticalRules(cX+(emWidth * 2)+(divider * 3));
  drawVerticalRules(cX+(emWidth * 3)+(divider * 4));
  drawVerticalRules(cX+(emWidth * 4)+(divider * 5));


  // first row
  float firstRowY = 225.0;
  // draw first row horizontal rules
  drawHorizontalRules(cX, firstRowY);
  // draw first row of 5 letters
  drawH(cX+(emWidth * 0)+(divider * 1), firstRowY);
  drawA(cX+(emWidth * 1)+(divider * 2), firstRowY);
  drawM(cX+(emWidth * 2)+(divider * 3), firstRowY);
  drawB(cX+(emWidth * 3)+(divider * 4), firstRowY);
  drawU(cX+(emWidth * 4)+(divider * 5), firstRowY);

  // second row
  float secondRowY = 450.0;
  // draw second row horizontal rules
  drawHorizontalRules(cX, secondRowY);
  // draw second row of 5 letters
  drawR(cX+(emWidth * 0)+(divider * 1), secondRowY);
  drawG(cX+(emWidth * 1)+(divider * 2), secondRowY);
  drawE(cX+(emWidth * 2)+(divider * 3), secondRowY);
  drawF(cX+(emWidth * 3)+(divider * 4), secondRowY);
  drawO(cX+(emWidth * 4)+(divider * 5), secondRowY);

  // third row
  float thirdRowY = 675.0;
  // draw third row horizontal rules
  drawHorizontalRules(cX, thirdRowY);
  // draw third row of 5 letters
  drawN(cX+(emWidth * 0)+(divider * 1), thirdRowY);
  drawS(cX+(emWidth * 1)+(divider * 2), thirdRowY);
  drawT(cX+(emWidth * 2)+(divider * 3), thirdRowY);
  drawI(cX+(emWidth * 3)+(divider * 4), thirdRowY);
  drawV(cX+(emWidth * 4)+(divider * 5), thirdRowY);

  noStroke();
  
  ascenderControl.update();
  capHeightControl.update();
  xHeightControl.update();
  descenderControl.update();
  emWidthControl.update();
  
  if (!recording) {
    ascenderControl.display();
    capHeightControl.display();
    xHeightControl.display();
    descenderControl.display();
    emWidthControl.display();
    fill(0);
    text(ascenderHeight, 115, 45);
    text(capHeight, 115, 95);
    text(xHeight, 115, 145);
    text(descenderHeight, 115, 195);
    text(emWidth, 115, 245);
  }
}

void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } 
    else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } 
  else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }
}
             
class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float startSPOS, int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    
    xpos = xp;
    //ratio = (float)sw / (float)widthtoheight;
    ratio = 1;
    //println("ratio: " + ratio);
    ypos = yp-sheight/2;
    spos = startSPOS;
    //spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (over()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      //spos = spos + (newspos-spos)/loose;
      spos = spos + (newspos-spos);
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {

      fill(50);
    } 
    else {
      fill(lightGray);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    
    int pos = int(spos * ratio);
    
    //println(pos);
    
    float result = map(spos, sposMin, sposMax, charWidthMin, charWidthMax);
    return result;
  }
}
   void createConsole() {
  if (!recording) {
    noStroke();
    fill(lightGray);
    rect(0, 0, 200, height); 
    stroke(lightGray);
    fill(0);
    text("OPACITY", 10, 20);
    text("CAP HEIGHT", 10, 70);
    text("X-HEIGHT", 10, 120);
    text("BALL SIZE", 10, 170);
    text("EM WIDTH", 10, 220);
  }
}

void drawHorizontalRules(float xPos, float yPos) {
  if (!recording) {
    stroke(lightGray);
    fill(lightGray);
    line(xPos, yPos + descenderHeight, width, yPos + descenderHeight);
    text("BALL SIZE", width - 100, (yPos + descenderHeight) - 5);
    line(xPos, yPos, width, yPos);
    text("THE BASELINE", width - 100, yPos - 5);
    line(xPos, yPos - xHeight, width, yPos - xHeight);
    text("X-HEIGHT", width - 100, (yPos - xHeight) - 5);
    line(xPos, yPos - capHeight, width, yPos - capHeight);
    text("CAP HEIGHT", width - 100, (yPos - capHeight) - 5);
    line(xPos, yPos - ascenderHeight, width, yPos - ascenderHeight);
    text("OPACITY", width - 100, (yPos - ascenderHeight) - 5);
  }
}

void drawVerticalRules(float xPos) {
  if (!recording) {
    stroke(lightGray);
    fill(lightGray);
    line(xPos, 0, xPos, height);
    line(xPos + emWidth, 0, xPos + emWidth, height);
    text("EM WIDTH", xPos + 10, height -10);
   }
}
boolean button = false;

//DECLARE
float x, y;
float rad;
float theta;  
float dtheta;
float rad2;
float rad3;
float rad4;
float radExtra;




void drawH(float xPos, float yPos) {

  // H LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.009, 0.97);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }  

  // H LETTER SKELETON
  strokeWeight(1);
  line (xPos, yPos, xPos, yPos - capHeight);
  line (xPos + emWidth, yPos, xPos + emWidth, yPos - capHeight);
  line (xPos, yPos - capHeight * .5, xPos + emWidth, yPos - capHeight * .5); 

  // H LEFT LINE | BOTTOM TO TOP
  noStroke();
  ellipse(xPos, yPos-capHeight*.0, r4+descenderHeight/4.5, r4+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.38, r3+descenderHeight/4.5, r3+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse ( xPos, yPos - capHeight * .7, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.8, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);

  // H HORIZONTAL LINE | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.5, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.5, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.6, yPos-capHeight*.5, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.5, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.5, r4+descenderHeight/4.5, r4+descenderHeight/4.5);

  // H RIGHT STEM | BOTTOM TO TOP
  ellipse(xPos + emWidth, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos + emWidth, yPos-capHeight*.1, r+descenderHeight/4, r+descenderHeight/4); 
  ellipse(xPos + emWidth, yPos-capHeight*.3, r2+descenderHeight/5, r2+descenderHeight/5); 
  ellipse(xPos + emWidth, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse ( xPos + emWidth, yPos - capHeight * .7, r+descenderHeight/3, r+descenderHeight/3);
  ellipse(xPos + emWidth, yPos-capHeight*.89, r + descenderHeight/4.5, r +descenderHeight/4.5);
  ellipse(xPos + emWidth, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
}

void drawA(float xPos, float yPos) {

  // A LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  // Map size based on sine function  
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta; 

  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }

  // A SKELETON
  strokeWeight(1);
  line(xPos, yPos, xPos+emWidth*.50, yPos-capHeight);
  line(xPos+emWidth, yPos+capHeight*.0, xPos+emWidth*.50, yPos-capHeight);
  line (xPos+emWidth*.25, yPos-capHeight/2, xPos+emWidth*.75, yPos-capHeight/2);

  // A LEFT LINE | BOTTOM TO TOP
  noStroke();
  ellipse(xPos, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos+emWidth*.048, yPos-capHeight*.1, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.096, yPos-capHeight*.2, r3+descenderHeight/4.5, r3+descenderHeight/4.5); 
  ellipse(xPos+emWidth*.2, yPos-capHeight*.4, r4+descenderHeight/4, r4+descenderHeight/4);
  ellipse(xPos+emWidth*.35, yPos-capHeight*.7, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.42, yPos-capHeight*.84, r2*rade + descenderHeight/3, r2*rade + descenderHeight/3);
  ellipse(xPos+emWidth*.5, yPos-capHeight, r2+descenderHeight/4.5, r2+descenderHeight/4.5);

  // A RIGHT LINE | BOTTOM TO TOP  
  ellipse(xPos+emWidth*.99, yPos-capHeight*.0, r+descenderHeight/5.5, r+descenderHeight/5.5);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.2, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.4, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.67, yPos-capHeight*.65, r+descenderHeight/4.5, r+descenderHeight/4.5);
  //ellipse(xPos+emWidth*.62, yPos-capHeight*.76, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.57, yPos-capHeight*.85, r+descenderHeight/5, r+descenderHeight/5);


  // A HORIZONTAL LINE | LEFT TO RIGHT
  ellipse(xPos+emWidth*.35, yPos-capHeight/2, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight/2, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.7, yPos-capHeight/2, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.65, yPos-capHeight/2, r*rade+descenderHeight/7, r*rade+descenderHeight/7);
}

void drawM(float xPos, float yPos) {

  // M LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }  

  //M SKELETON
  strokeWeight(1);
  line(xPos, yPos, xPos, yPos - capHeight);
  //M LEFT DIAGONAL
  line(xPos, yPos - capHeight, xPos + emWidth * .5, yPos - capHeight/2 );
  //M RIGHT DIAGONAL
  line(xPos+emWidth*.5, yPos - capHeight/2, xPos+emWidth, yPos-capHeight);
  //M RIGHT STEM
  line(xPos+emWidth, yPos, xPos+emWidth, yPos-capHeight);

  //M METABALLS
  noStroke();
  // M LEFT STEM BOTTOM TO TOP
  ellipse(xPos, yPos-capHeight*.0, r3+descenderHeight/4.5, r3+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.15, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos, yPos - capHeight * .7, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.8, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos, yPos-capHeight*.99, r2*rade+descenderHeight/4.5, r2*rade+descenderHeight/4.5);

  // M LEFT DIAGONAL TOP TO BOTTOM
  ellipse(xPos + emWidth * .1, yPos-capHeight*.9, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth * .2, yPos-capHeight*.8, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos + emWidth * .35, yPos-capHeight*.65, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .4, yPos-capHeight*.6, r3+descenderHeight/6, r3+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  
  // M RIGHT DIAGONAL TOP TO BOTTOM
  ellipse(xPos + emWidth * .9, yPos-capHeight*.9, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth * .85, yPos-capHeight*.85, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos + emWidth * .65, yPos-capHeight*.65, r3*rade+descenderHeight/6, r3*rade+descenderHeight/6);
  
  // M RIGHT STEM BOTTOM TO TOP
  ellipse(xPos + emWidth, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos + emWidth, yPos-capHeight*.15, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth, yPos-capHeight*.3, r4+descenderHeight/4.5, r4+descenderHeight/4.5);
  ellipse(xPos + emWidth, yPos-capHeight*.7, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos + emWidth, yPos - capHeight * .8, r+descenderHeight/5, r+descenderHeight/5);
  ellipse(xPos + emWidth, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
 
}

void drawB(float xPos, float yPos) {

 // B LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }  
  
  //B SKELETON  
  noFill();
  line(xPos, yPos, xPos, yPos - capHeight);
  
  // B UPPER BULDGE
  beginShape();
  curveVertex(xPos, yPos);
  curveVertex(xPos, yPos);
  curveVertex(xPos + emWidth * .8, yPos - capHeight*.05);
  
  // B LOWER PEAK
  curveVertex(xPos + emWidth, yPos - capHeight*.25);
  curveVertex(xPos + emWidth * .8, yPos - capHeight*.45);
  curveVertex(xPos + emWidth*.3, yPos - capHeight*.5);
  curveVertex(xPos + emWidth*.3, yPos - capHeight*.5);
  vertex(xPos, yPos - capHeight / 2);
  endShape();
  
  // B LOWER BULDGE
  beginShape();  
  curveVertex(xPos + emWidth*.3, yPos - capHeight/2);
  curveVertex(xPos + emWidth*.3, yPos - capHeight/2);
  curveVertex(xPos + emWidth * .8, yPos - capHeight*.55);
  
  //B UPPER PEAK
  curveVertex(xPos + emWidth, yPos - capHeight*.75);  
  curveVertex(xPos + emWidth * .8, yPos - capHeight*.95);
  curveVertex(xPos, yPos - capHeight);
  curveVertex(xPos, yPos - capHeight);
  endShape();

  // B META BALLS BOTTOM BULDGE | LEFT TO RIGHT AND UP
  fill (0, 0, 0, ascenderHeight * 2);
  noStroke();
  ellipse(xPos, yPos-capHeight*.0, r+descenderHeight/5, r+descenderHeight/5);
  ellipse(xPos + emWidth*.1, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos + emWidth*.2, yPos-capHeight*.0, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth*.4, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos + emWidth*.7, yPos-capHeight*.0, r4+descenderHeight/4.5, r4+descenderHeight/4.5);
  ellipse(xPos + emWidth*.85, yPos-capHeight*.07, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.98, yPos-capHeight*.15, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.99, yPos-capHeight*.3, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth*.8, yPos-capHeight*.45, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.6, yPos-capHeight*.5, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.5, r3*rade+descenderHeight/6, r3*rade+descenderHeight/6);
  ellipse(xPos + emWidth*.35, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.2, yPos-capHeight*.5, r2+descenderHeight/6, r2+descenderHeight/6);
  
  //B UPPER BULDGE
  
  ellipse(xPos + emWidth*.75, yPos-capHeight*.55, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.85, yPos-capHeight*.57, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.99, yPos-capHeight*.7, r2*rade+descenderHeight/4.5, r2*rade+descenderHeight/4.5);
  //fill (250, 0 , 0);
  ellipse(xPos + emWidth*.9999, yPos-capHeight*.8, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.9, yPos-capHeight*.9, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth*.7, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos + emWidth*.3, yPos-capHeight*.99, r+descenderHeight/3, r+descenderHeight/3);
  ellipse(xPos + emWidth*.2 , yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  
  // B RIGHT STEM | BOTTOM TO TOP
  ellipse(xPos, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.1, r+descenderHeight/4, r+descenderHeight/4); 
  ellipse(xPos, yPos-capHeight*.3, r2+descenderHeight/5, r2+descenderHeight/5); 
  ellipse(xPos, yPos-capHeight*.4, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse ( xPos, yPos - capHeight * .7, r+descenderHeight/3, r+descenderHeight/3);
  ellipse(xPos, yPos-capHeight*.89, r + descenderHeight/4.5, r +descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  
}

void drawU(float xPos, float yPos) {
  // U LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }  
  
  
  
  // U SKELETON
  noFill();
  beginShape();
  vertex(xPos, yPos-capHeight); 
  curveVertex(xPos, yPos-capHeight);
  curveVertex(xPos, yPos-capHeight);
  curveVertex (xPos+emWidth*.10, yPos-capHeight*.2);
  //U CURVE PEAK
  curveVertex(xPos+emWidth*.5, yPos);
  curveVertex (xPos+emWidth*.90, yPos-capHeight*.2);
  //END CURVE
  curveVertex(xPos+emWidth, yPos-capHeight);
  curveVertex(xPos+emWidth, yPos-capHeight);
  endShape();
  
  //U METABALLS LEFT DOWN RIGHT UP
  noStroke();
  fill(0,0,0,ascenderHeight*2);
  ellipse(xPos, yPos-capHeight, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight * .9, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .02, yPos-capHeight * .7, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth * .04, yPos-capHeight * .5, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  
  ellipse(xPos + emWidth * .06, yPos-capHeight * .4, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .12, yPos-capHeight * .2, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .3, yPos-capHeight * .05, r4+descenderHeight/6, r4+descenderHeight/6);
  ellipse(xPos + emWidth * .4, yPos-capHeight * .0, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight * .0, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .6, yPos-capHeight * .0, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth * .8, yPos-capHeight * .1, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .9, yPos-capHeight * .2, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth * .95, yPos-capHeight * .3, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth * .98, yPos-capHeight * .5, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth * .99, yPos-capHeight * .7, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  ellipse(xPos + emWidth * .99, yPos-capHeight * .99, r4+descenderHeight/4.5, r4+descenderHeight/4.5); 
  
}

void drawR(float xPos, float yPos) {
  
  // R LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }   
  
  //R SKELETON
  //R LEFT STEM
  noFill();
  line(xPos, yPos, xPos, yPos-capHeight);
  //R Buldge
  beginShape();
  curveVertex(xPos, yPos - capHeight );
  curveVertex(xPos, yPos - capHeight );
  curveVertex(xPos + emWidth*.8, yPos - capHeight * .95);
  //CURVE PEAK
  curveVertex(xPos + emWidth, yPos - capHeight * .75);
  curveVertex(xPos + emWidth*.8, yPos - capHeight * .55);
  curveVertex(xPos, yPos - capHeight * .5);
  curveVertex(xPos, yPos - capHeight * .5);
  endShape();
  // R STEM
  line(xPos + emWidth * .7, yPos - capHeight * .53, xPos + emWidth, yPos);
  
  // R METABALLS
  // R STEM BOTTOM TO TOP
  fill(0,0,0, ascenderHeight*2);
  noStroke();
  ellipse(xPos, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.15, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos, yPos-capHeight*.3, r4+descenderHeight/4.5, r4+descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.7, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos, yPos - capHeight * .8, r+descenderHeight/5, r+descenderHeight/5);
  ellipse(xPos, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  
  //R BULDGE
  ellipse(xPos + emWidth*.6, yPos-capHeight*.5, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth*.35, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.2, yPos-capHeight*.5, r3+descenderHeight/6, r3+descenderHeight/6);
  ellipse(xPos + emWidth*.85, yPos-capHeight*.57, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.99, yPos-capHeight*.7, r2*rade+descenderHeight/4.5, r2*rade+descenderHeight/4.5);
  ellipse(xPos + emWidth*.9999, yPos-capHeight*.8, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.9, yPos-capHeight*.9, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth*.7, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.3, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth*.2 , yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  
  //R STEM
  ellipse(xPos + emWidth*.73, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.84, yPos-capHeight*.3, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  //ellipse(xPos + emWidth*.87, yPos-capHeight*.2, r2+descenderHeight/4.5, r2+descenderHeight/4.5);    
  ellipse(xPos + emWidth*.9, yPos-capHeight*.2, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
}

void drawG(float xPos, float yPos) {
  
  // G LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }


  noFill();
  ellipse( xPos + emWidth * .5, yPos - capHeight * .5, emWidth, capHeight);
  //WHITE BOX OUT
  noStroke();
  fill(255,255,255);
  beginShape();
  vertex( xPos + emWidth * .3, yPos - capHeight * .5);
  vertex( xPos + emWidth + 1, yPos - capHeight * .5);
  vertex( xPos + emWidth, yPos - capHeight * .75);
  vertex( xPos + emWidth *.3, yPos - capHeight * .75);
  endShape();  
  
    if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }
  
  // G LINE
  noFill();
  strokeWeight(1);
  beginShape();
  vertex( xPos + emWidth * .5, yPos - capHeight * .5);
  vertex( xPos + emWidth, yPos - capHeight * .5);
  endShape();
  
  noStroke();
  fill ( 0,0,0, ascenderHeight*2);
  //G COUNTER METABALLS
  ellipse(xPos + emWidth*.5, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.6, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos + emWidth*.7, yPos-capHeight*.5, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.75, yPos-capHeight*.5, r*rade+descenderHeight/6, r*rade+descenderHeight/6);
  ellipse(xPos + emWidth*.92, yPos-capHeight*.5, r*rade+descenderHeight/6, r*rade+descenderHeight/6);
  ellipse(xPos + emWidth, yPos-capHeight*.5, r2+descenderHeight/6, r2+descenderHeight/6);
  
   //G BODY METABALLS RIGHT TO LEFT DOWN UP RIGHT
  ellipse(xPos + emWidth * .9, yPos-capHeight * .8, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth * .8, yPos-capHeight * .9, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  ellipse(xPos + emWidth * .7, yPos-capHeight * .95, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  ellipse(xPos + emWidth * .6, yPos-capHeight * .99, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight * .99, r2+descenderHeight/6, r2+descenderHeight/6);  
  ellipse(xPos + emWidth * .25, yPos-capHeight * .92, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth * .1, yPos-capHeight * .8, r3+descenderHeight/6, r3+descenderHeight/6);
  ellipse(xPos + emWidth * .02, yPos-capHeight * .7, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth * .01, yPos-capHeight * .5, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .03, yPos-capHeight * .4, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .1, yPos-capHeight * .2, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .3, yPos-capHeight * .05, r4+descenderHeight/6, r4+descenderHeight/6);
  ellipse(xPos + emWidth * .4, yPos-capHeight * .0, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight * .0, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .6, yPos-capHeight * .0, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth * .8, yPos-capHeight * .1, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .92, yPos-capHeight * .2, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .99, yPos-capHeight * .4, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth * .97, yPos-capHeight * .35, r+descenderHeight/4.5, r+descenderHeight/4.5);
 
}

void drawE(float xPos, float yPos) {
  
  // E LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }
  
  // E BOTTOM STEM
  line(xPos, yPos, xPos + emWidth, yPos);
  // E LEFT STEM
  line(xPos, yPos, xPos, yPos-capHeight);
  // E MIDDLE STEM
  line(xPos, yPos - capHeight * .5, xPos + emWidth * .75, yPos-capHeight * .5);
  // E TOP STEM
  line(xPos, yPos - capHeight, xPos + emWidth, yPos - capHeight);
  
  //E METABALLS
  // H RIGHT STEM | BOTTOM TO TOP
  noStroke();
  ellipse(xPos, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.1, r+descenderHeight/4, r+descenderHeight/4); 
  ellipse(xPos, yPos-capHeight*.3, r2+descenderHeight/5, r2+descenderHeight/5); 
  ellipse(xPos, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos, yPos - capHeight * .7, r+descenderHeight/3, r+descenderHeight/3);
  ellipse(xPos, yPos-capHeight*.89, r + descenderHeight/4.5, r +descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  
  // E HORIZONTAL LINE TOP | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.99, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.99, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.6, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.99, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  
  // E HORIZONTAL LINE CENTER | LEFT TO RIGHT
 
  ellipse(xPos+emWidth*.5, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  
  
   // I HORIZONTAL LINE BOTTOM | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.0, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.0, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.65, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.0, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);

  
}

void drawF(float xPos, float yPos) {
  
  // F LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }
  
  // LEFT STEM
  line(xPos, yPos, xPos, yPos-capHeight);
  line(xPos, yPos - capHeight * .5, xPos + emWidth * .75, yPos-capHeight * .5);
  // TOP STEM
  line(xPos, yPos - capHeight, xPos + emWidth, yPos - capHeight);
  
  
    //F METABALLS
  // F RIGHT STEM | BOTTOM TO TOP
  noStroke();
  ellipse(xPos, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.1, r+descenderHeight/4, r+descenderHeight/4); 
  ellipse(xPos, yPos-capHeight*.3, r2+descenderHeight/5, r2+descenderHeight/5); 
  ellipse(xPos, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos, yPos - capHeight * .7, r+descenderHeight/3, r+descenderHeight/3);
  ellipse(xPos, yPos-capHeight*.89, r + descenderHeight/4.5, r +descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  
   // I HORIZONTAL LINE BOTTOM | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.99, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.99, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.65, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.99, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  
  // F HORIZONTAL LINE CENTER | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.5, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.5, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  //fill(250,0,0);
  ellipse(xPos+emWidth*.55, yPos-capHeight*.5, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  ellipse(xPos+emWidth*.6, yPos-capHeight*.5, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.75, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  
}

void drawO(float xPos, float yPos) {
  
  // O LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }
 
  //O SKELETON
  noFill();
  ellipse(xPos + emWidth * .50, yPos - capHeight * .50, emWidth, capHeight);
  
  //O METABALLS
  
   //G BODY METABALLS RIGHT TO LEFT DOWN UP RIGHT
  fill(0,0,0,ascenderHeight*2);
  noStroke();
  ellipse(xPos + emWidth * .9, yPos-capHeight * .8, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth * .8, yPos-capHeight * .9, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  ellipse(xPos + emWidth * .7, yPos-capHeight * .95, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
  ellipse(xPos + emWidth * .6, yPos-capHeight * .99, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight * .99, r2+descenderHeight/6, r2+descenderHeight/6);  
  ellipse(xPos + emWidth * .25, yPos-capHeight * .92, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth * .1, yPos-capHeight * .8, r3+descenderHeight/6, r3+descenderHeight/6);
  ellipse(xPos + emWidth * .02, yPos-capHeight * .7, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth * .01, yPos-capHeight * .5, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .03, yPos-capHeight * .4, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .1, yPos-capHeight * .2, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .3, yPos-capHeight * .05, r4+descenderHeight/6, r4+descenderHeight/6);
  ellipse(xPos + emWidth * .4, yPos-capHeight * .0, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight * .0, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .6, yPos-capHeight * .0, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth * .8, yPos-capHeight * .1, r2*rade+descenderHeight/6, r2*rade+descenderHeight/6);
  ellipse(xPos + emWidth * .92, yPos-capHeight * .2, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .99, yPos-capHeight * .4, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth * .97, yPos-capHeight * .35, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth * .97, yPos-capHeight * .6, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  
}

void drawN(float xPos, float yPos) {
  
  // N LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }
  
  //N SKELETON
  line ( xPos, yPos, xPos, yPos - capHeight);
  line ( xPos + emWidth, yPos, xPos + emWidth, yPos - capHeight);
  line ( xPos, yPos - capHeight, xPos + emWidth, yPos);
  
  
  //N METABALLS
  noStroke();
  // N LEFT STEM BOTTOM TO TOP
  ellipse(xPos, yPos-capHeight*.0, r3+descenderHeight/4.5, r3+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.15, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos, yPos-capHeight*.5, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos, yPos - capHeight * .7, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos, yPos-capHeight*.8, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos, yPos-capHeight*.99, r2*rade+descenderHeight/4.5, r2*rade+descenderHeight/4.5);

  // N LEFT DIAGONAL TOP TO BOTTOM
  ellipse(xPos + emWidth * .1, yPos-capHeight*.9, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth * .2, yPos-capHeight*.8, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos + emWidth * .35, yPos-capHeight*.65, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .4, yPos-capHeight*.6, r3+descenderHeight/6, r3+descenderHeight/6);
  ellipse(xPos + emWidth * .5, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth * .7, yPos-capHeight*.3, r2+descenderHeight/6, r2+descenderHeight/6);
  
  
  // N RIGHT STEM BOTTOM TO TOP
  ellipse(xPos + emWidth, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos + emWidth, yPos-capHeight*.15, r+descenderHeight/6, r+descenderHeight/6); 
  ellipse(xPos + emWidth, yPos-capHeight*.3, r4+descenderHeight/4.5, r4+descenderHeight/4.5);
  ellipse(xPos + emWidth, yPos-capHeight*.7, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos + emWidth, yPos - capHeight * .8, r+descenderHeight/5, r+descenderHeight/5);
  ellipse(xPos + emWidth, yPos-capHeight*.99, r*rade+descenderHeight/4.5, r*rade+descenderHeight/4.5);
 
}

void drawT(float xPos, float yPos) {
  
  // T LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }
  
  line ( xPos + emWidth * .50, yPos, xPos + emWidth * .50, yPos - capHeight);
  line ( xPos, yPos - capHeight, xPos + emWidth, yPos - capHeight);
  
  
  // T METABALL
  // T LEFT LINE | BOTTOM TO TOP
  noStroke();
  ellipse(xPos + emWidth*.5, yPos-capHeight*.0, r4+descenderHeight/4.5, r4+descenderHeight/4.5); 
  ellipse(xPos + emWidth*.5, yPos-capHeight*.2, r+descenderHeight/4.5, r+descenderHeight/4.5);
    ellipse(xPos + emWidth*.5, yPos-capHeight*.4, r+descenderHeight/6, r+descenderHeight/6);

  ellipse(xPos + emWidth*.5, yPos-capHeight*.6, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.7, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.8, r+descenderHeight/6, r+descenderHeight/6);
  
  
  
  // T HORIZONTAL LINE TOP | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.99, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.99, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.6, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.99, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
}

void drawS(float xPos, float yPos) {
  
  // S LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  } 
  noFill();

  strokeWeight(1);

  
  beginShape();
  curveVertex (xPos + emWidth , yPos - capHeight*.8);
  curveVertex (xPos + emWidth , yPos - capHeight*.8);
  curveVertex (xPos + emWidth * .8 , yPos - capHeight *.92);
  // PEAK AT TOP
  curveVertex (xPos + emWidth *.5 , yPos - capHeight); 
  curveVertex (xPos + emWidth * .15 , yPos - capHeight *.92);
  //PEAK
  curveVertex (xPos , yPos - capHeight * .75);  
  curveVertex (xPos + emWidth * .15 , yPos - capHeight *.57);  
  curveVertex (xPos + emWidth * .5 , yPos - capHeight * .5);
  curveVertex (xPos + emWidth * .5 , yPos - capHeight * .5);
  
  endShape();

  
 beginShape();
  curveVertex(xPos, yPos - capHeight * .2);
  curveVertex(xPos, yPos - capHeight * .2);
  
  curveVertex( xPos + emWidth *.2, yPos - capHeight * .07);
  //BOTTOM OF S
  curveVertex (xPos + emWidth * .5, yPos);

  //curveVertex(xPos + emWidth * .8, yPos - capHeight*.05);
   curveVertex (xPos + emWidth *.8, yPos - capHeight * .07);
  // B LOWER PEAK
  curveVertex(xPos + emWidth, yPos - capHeight*.25);
 
 curveVertex(xPos + emWidth * .8, yPos - capHeight*.45);
  curveVertex(xPos + emWidth*.5, yPos - capHeight*.5);
  curveVertex(xPos + emWidth*.5, yPos - capHeight*.5);
  
  endShape();
  
  stroke(250,0,0);
  

  // B META BALLS BOTTOM BULDGE | LEFT TO RIGHT AND UP
  fill (0, 0, 0, ascenderHeight * 2);
  noStroke();
  ellipse(xPos, yPos-capHeight*.2, r+descenderHeight/5, r+descenderHeight/5);
  ellipse(xPos + emWidth*.1, yPos-capHeight*.125, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos + emWidth*.2, yPos-capHeight*.1, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos + emWidth*.4, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.02, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos + emWidth*.7, yPos-capHeight*.02, r4+descenderHeight/4.5, r4+descenderHeight/4.5);
  ellipse(xPos + emWidth*.85, yPos-capHeight*.09, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.95, yPos-capHeight*.16, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.99, yPos-capHeight*.3, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth*.8, yPos-capHeight*.45, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.6, yPos-capHeight*.5, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.5, r3*rade+descenderHeight/6, r3*rade+descenderHeight/6);
  ellipse(xPos + emWidth*.35, yPos-capHeight*.5, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos + emWidth*.15, yPos-capHeight*.6, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos, yPos-capHeight*.7, r+descenderHeight/6, r+descenderHeight/6);
 
  //B UPPER BULDGE
  


  ellipse(xPos + emWidth*.9999, yPos-capHeight*.8, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.9, yPos-capHeight*.9, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth*.7, yPos-capHeight*.97, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth*.5, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  ellipse(xPos + emWidth*.3, yPos-capHeight*.99, r+descenderHeight/3, r+descenderHeight/3);
  ellipse(xPos + emWidth*.1 , yPos-capHeight*.9, r+descenderHeight/4.5, r+descenderHeight/4.5);
 
   
  
}

void drawI(float xPos, float yPos) {
  
  // I LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }

  line ( xPos + emWidth * .50, yPos, xPos + emWidth * .50, yPos - capHeight);
  line ( xPos, yPos - capHeight, xPos + emWidth, yPos - capHeight);
  line ( xPos, yPos, xPos + emWidth, yPos );
  
    // I METABALL
  // I LEFT LINE | BOTTOM TO TOP
  noStroke();
  ellipse(xPos + emWidth*.5, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos+ emWidth*.5, yPos-capHeight*.27, r3+descenderHeight/4.5, r3+descenderHeight/4.5); 
  ellipse(xPos+ emWidth*.5, yPos-capHeight*.6, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse ( xPos+ emWidth*.5, yPos - capHeight * .7, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+ emWidth*.5, yPos-capHeight*.8, r + descenderHeight/3, r +descenderHeight/3);
  ellipse(xPos+ emWidth*.5, yPos-capHeight*.8, r + descenderHeight/6, r +descenderHeight/6);
  ellipse(xPos+ emWidth*.5, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  
  // I HORIZONTAL LINE TOP | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.99, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.99, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.99, r3+descenderHeight/4.5, r3+descenderHeight/4.5);
  //ellipse(xPos+emWidth*.5, yPos-capHeight*.99, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.6, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.99, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
  
  
  // I HORIZONTAL LINE BOTTOM | LEFT TO RIGHT
  ellipse(xPos+emWidth*.1, yPos-capHeight*.0, r2+descenderHeight/6, r2+descenderHeight/6);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.0, r+descenderHeight/8, r+descenderHeight/8);
  ellipse(xPos+emWidth*.3, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.5, yPos-capHeight*.0, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  ellipse(xPos+emWidth*.65, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.8, yPos-capHeight*.0, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos+emWidth*.9, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5);
  
}

void drawV(float xPos, float yPos) {
 
   // V LETTER SETUP
  x = 0 ;
  y = random(height);  
  rad = random(-1, 1);
  rad2 = random (2, 5);
  rad3 = random (0, 10);
  rad4 = random (3, 13);
  radExtra = random (.1, .5);
  theta = random(0);  
  dtheta = random(0.01, 0.1);
  fill (0, 0, 0, ascenderHeight * 2);

  // MAP SIZED BASED ON SIN FUNCTION
  float r = rad + rad * (sin(theta) + 1);
  float r2 = rad2 + rad2 * (sin(theta) + 1);
  float r3 = rad3 + rad3 * (sin(theta) + 1);
  float r4= rad4 + rad4 * (sin(theta) + 1);
  float rade= radExtra + radExtra * (sin(theta) + 1);
  // Display circle
  theta += dtheta;
  if (mouseX > width * .14 && mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }

  if (button) {
    stroke(0);
  } 
  else {
    stroke(255);
  }

  //LETTER SKELETON
  line ( xPos, yPos - capHeight, xPos + emWidth * .5, yPos);
  line ( xPos + emWidth * .5, yPos, xPos + emWidth, yPos - capHeight);
  
  // A LEFT LINE | BOTTOM TO TOP
  noStroke();
  ellipse(xPos + emWidth * .5, yPos-capHeight*.0, r+descenderHeight/4.5, r+descenderHeight/4.5); 
  ellipse(xPos+emWidth*.46, yPos-capHeight*.1, r+descenderHeight/6, r+descenderHeight/6);
  ellipse(xPos+emWidth*.41, yPos-capHeight*.2, r3+descenderHeight/4.5, r3+descenderHeight/4.5); 
  ellipse(xPos+emWidth*.24, yPos-capHeight*.5, r4+descenderHeight/4, r4+descenderHeight/4);
  ellipse(xPos+emWidth*.15, yPos-capHeight*.7, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos+emWidth*.09, yPos-capHeight*.84, r2*rade + descenderHeight/3, r2*rade + descenderHeight/3);
  ellipse(xPos+emWidth*.0, yPos-capHeight, r2+descenderHeight/4.5, r2+descenderHeight/4.5);
  
  
    // V RIGHT LINE | BOTTOM TO TOP
  noStroke();

  ellipse(xPos + emWidth * .55, yPos-capHeight*.1, r+descenderHeight/7, r+descenderHeight/7); 
  ellipse(xPos + emWidth * .6, yPos-capHeight*.2, r2+descenderHeight/4.5, r2+descenderHeight/4.5); 
  ellipse(xPos + emWidth * .65, yPos-capHeight*.3, r+descenderHeight/4.5, r+descenderHeight/4.5);
  ellipse(xPos + emWidth * .7, yPos-capHeight*.4, r3+descenderHeight/4.5, r3+descenderHeight/4.5);  
  ellipse(xPos + emWidth * .8, yPos-capHeight*.6, r+descenderHeight/7, r+descenderHeight/7);
  ellipse(xPos + emWidth * .9, yPos-capHeight*.8, r4+descenderHeight/4.5, r4+descenderHeight/4.5);
  ellipse(xPos + emWidth, yPos-capHeight*.99, r+descenderHeight/4.5, r+descenderHeight/4.5);
 
  
  
}


          
               
