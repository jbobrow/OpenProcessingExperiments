
Origin[] origins = new Origin[12];
Control[] controls = new Control[6];

void setup() {
  size(800, 600);
  colorMode(HSB, 100);
  smooth();
  for (int i = 0; i < origins.length; i++) {  
    origins[i] = new Origin(i);
  }
  for (int i = 0; i < controls.length; i++) {
    controls[i] = new Control(i, false);
  }

  //starting the controls on a nice calm setting - not necessary to the program
  controls[0].x = controls[0].ox - 4;
  controls[0].y = controls[0].oy - 27;
  controls[2].x = controls[2].ox - 32;
  controls[2].y = controls[2].oy - 20;
  controls[3].auto = true;
}

//  PROGRAM VARIABLES  //
float a = 0; //global time
int controlSwitch = -1;// keeps track of which button is being dragged
float opac;// triangles and ellipses fill alpha
boolean opS = false;// is the opacity slider selected

//  USER VARIABLES  //
boolean on = true; //on off button
int lineDirection = 1;//rotation direction of outer ring(see below) / direction button
float aInc = 0.04;//global speed
float trails = 100;//background alpha
boolean lines = false;//lines mode
boolean triangles = true;//triangles mode
boolean ellipses = false;//ellipses mode
boolean opacAuto = false;//triangles and ellipses fill alpha auto mode
float opacX = 720;// triangles and ellipses fill alpha button


void draw() {
  bg();
  drawLines();
  fg();
  drawControls();
  update();
}


//===========================================================================================
//                                                      ORIGIN CLASS
//===========================================================================================
//I'm not sure how to best explain these variables,  
//but here goes.
//
//there is an inner ring (origins), and there is an outer ring.
//lines connect the inner ring and outer ring.
//the outer ring is revolving and rotating in opposite directions.
//the inner ring does not revolve, but it can grow or shrink and move up or down.
//the triangles use the origins as one point, and opposete sides of the outer ring for the other 2 points.
//ellipses are centered midway between the inner and outer rings rotated to make a pretty flower or donut.

class Origin {
  int index;
  float x, y;//inner ring coordinates
  float ringSize;//diameter of inner ring
  float originSize;//the rings of the inner ring
  float lineX, lineY;//lines outer ring coordinates
  float triX1, triY1, triX2, triY2;//triangles outer ring coordinates
  float elX, elY;//ellipse coordinates
  float lineD;//diameter of outer ring
  float lineDiam;//diameter of rotation of outer ring
  float lineXdis, lineYdis;//part of the lines calculation
  float elXdis, elYdis;//part of the ellipses calculation
  float lineEndOffsetX, lineEndOffsetY;//offsets outer rings center of rotation
  float lineModA, lineModB;//makes outer ring rotation wobble
  float spinA, spinB;//changes sync between outer ring revolution and rotation
  float yOffset;//moves inner ring up and down    
  float lineHue;
  float lineWeight;

  Origin(int iindex) {
    index = iindex;
  }

  void originLines(int i, float a) {

    //  CONTROL BOX 1 PAIR  //
    lineD = map(controls[0].x, controls[0].ox - 34, controls[0].ox + 34, 10, 800); 
    lineDiam = map(controls[0].y, controls[0].oy - 34, controls[0].oy + 34, 10, 800);

    //  CONTROL BOX 2 PAIR  //
    lineEndOffsetX = map(controls[1].x, controls[1].ox - 34, controls[1].ox + 34, -200, 200);
    lineEndOffsetY = map(controls[1].y, controls[1].oy - 34, controls[1].oy + 34, 200, -200); 

    //  CONTROL BOX 3 PAIR  //
    lineHue = map(controls[2].x, controls[2].ox - 34, controls[2].ox + 34, 0, 110); 
    lineWeight = map(controls[2].y, controls[2].oy - 34, controls[2].oy + 34, 1, 9); 

    //  CONTROL BOX 4 PAIR  //
    ringSize = map(controls[3].x, controls[3].ox - 34, controls[3].ox + 34, 20, 200);
    yOffset = map(controls[3].y, controls[3].oy - 34, controls[3].oy + 34, 0, 80);

    //  MOD (pair 5, zigzag button)  //
    lineModA = map(controls[4].y, controls[4].oy - 34, controls[4].oy + 34, 1.8, 1);
    lineModB = map(controls[4].y, controls[4].oy - 34, controls[4].oy + 34, 1.8, 1);

    //  SPIN (pair 6, sinewave button)  //
    spinA = map(controls[5].x, controls[5].ox - 34, controls[5].ox + 34, 1, 1.5);
    spinB = map(controls[5].y, controls[5].oy - 34, controls[5].oy + 34, 1, 1.5);

    //  CALCULATIONS  //
    originSize = lineWeight + 3;
    opac = map(opacX, 697, 763, 0, 50);
    float w = width/2;
    float h = (height - 110)/2;    
    x = w + sin(index * TWO_PI / 12) * ringSize;
    y = h - yOffset + cos(index * TWO_PI / 12) * ringSize;
    float aN = a * spinB * lineModA * lineDirection;

    lineXdis = cos(aN) * lineDiam + lineEndOffsetX;
    lineYdis = sin(aN) * lineDiam + lineEndOffsetY;

    if (on) {
      if (lines || triangles) {//the little rings only get drawn for lines or triangles
        noFill();
        strokeWeight(1);
        stroke(35, 50);
        ellipse(x, y, originSize, originSize);
      }
      if (lines) {
        float aM = a * spinA * lineDirection + i * TWO_PI / 12;
        lineX = w + lineXdis + sin(aM) * lineD;
        lineY = h + lineYdis + cos(aM) * lineD;       
        stroke(lineHue, 200, 100);
        strokeWeight(lineWeight);     
        line(x, y, lineX, lineY);
      }
      else if (triangles) {
        lineXdis = cos(aN) * lineDiam + lineEndOffsetX;
        lineYdis = sin(aN) * lineDiam + lineEndOffsetY;
        float aL = a + 1 * spinA * lineDirection + i * TWO_PI / 12;//triangles
        float aK = a - 1 * spinA * lineDirection + i * TWO_PI / 12;//triangles   
        triX1 = w + lineXdis + sin(aL) * lineD;
        triY1 = h + lineYdis + cos(aL) * lineD;
        triX2 = w + lineXdis + sin(aK) * lineD;
        triY2 = h + lineYdis + cos(aK) * lineD;        
        stroke(lineHue, 200, 100);
        strokeWeight(lineWeight);     
        fill(lineHue, 200, 100, opac);
        triangle(x, y, triX1, triY1, triX2, triY2);
      }
      else if (ellipses) {
        float aM = a * spinA * lineDirection + i * TWO_PI / 12;
        lineX = w + lineXdis + sin(aM) * lineD;
        lineY = h + lineYdis + cos(aM) * lineD; 
        elXdis = cos(aN) * lineDiam * 0.5 + lineEndOffsetX;
        elYdis = sin(aN) * lineDiam * 0.5 + lineEndOffsetY; 
        elX = w + elXdis + sin(aM) * lineD * 0.5;
        elY = h + elYdis + cos(aM) * lineD * 0.5;
        float elwidth = dist(x, y, lineX, lineY)/2;        
        stroke(lineHue, 200, 100);
        strokeWeight(lineWeight);     
        fill(lineHue, 200, 100, opac/2);
        pushMatrix();
        translate(elX, elY);
        rotate(-aM);
        ellipse(0, 0, lineDiam/2 + elwidth, lineD/2 + elwidth);      
        popMatrix();
      }
    }
  }
}

void drawLines() {
  for (int i = 0; i < origins.length; i++) {
    origins[i].originLines(i, a);
  }
}


//===========================================================================================
//                                                      CONTROL CLASS
//===========================================================================================
//the four 2d controls

class Control {
  float ox;//static coordinates used to define mouse constraints
  float oy;
  float x;//actual coordinates used for control points
  float y;
  boolean auto;//auto pilot for the 2d controls
  int autoMode;//auto pilot mode (there are 4)

  Control(int i, boolean iauto) {
    ox = 170 + i * 113;
    oy = 535;
    x = ox;
    y = oy; 
    auto = iauto;
    autoMode = 1;
  }

  void drawC() {
    stroke(40, 100, 80);
    strokeWeight(2);
    if (dist(mouseX, mouseY, x, y) < 6) { 
      fill(40, 100, 40);
    }
    else { 
      noFill();
    }
    ellipse(x, y, 12, 12);
  }
}

void drawControls() {

  for (int i = 0; i < controls.length - 2; i++) {// the last two elements of the controls array are not drawn, 
    //they are auto on/off only.(mod and spin)
    controls[i].drawC();
  }
}


//===========================================================================================
//                                                      MOUSE FUNCTIONS
//===========================================================================================

void mouseClicked() {

  //  AUTO BUTTONS  //
  for (int i = 0; i < controls.length - 2; i++) {
    if (mouseX > 133 + i * 113 && mouseX < 170 + i * 113 && mouseY > 575 && mouseY < 587) {
      if (controls[i].auto) {
        controls[i].auto = false;
      }
      else {
        controls[i].auto = true;
      }
    }
    //  AUTO MODE BUTTONS  //
    if (mouseX > 182 + i * 113 && mouseX < 207 + i * 113 && mouseY > 575 && mouseY < 587) {
      controls[i].autoMode += 1;
      if (controls[i].autoMode > 4) {
        controls[i].autoMode = 1;
      }
    }
  } 

  //  POWER BUTTON  //
  if (mouseX > 15 && mouseX < 55 && mouseY > 495 && mouseY < 535) {
    if (on) {  
      on = false;
    }
    else {  
      on = true;
    }
  }

  // SPEED BUTTON  //
  if (mouseX > 15 && mouseX < 55 && mouseY > 545 && mouseY < 585) {
    if (aInc == 0.04) { 
      aInc = 0.015;
    }
    else { 
      aInc = 0.04;
    }
  }

  //  DIRECTION BUTTON  //
  if (mouseX > 70 && mouseX < 110 && mouseY > 495 && mouseY < 535) {
    if (lineDirection == 1) {  
      lineDirection = -1;
    }
    else {  
      lineDirection = 1;
    }
  }

  //  TRAILS BUTTON  //
  if (mouseX > 70 && mouseX < 110 && mouseY > 545 && mouseY < 585) {
    if (trails == 100) {
      trails = 20;
    }
    else {
      trails = 100;
    }
  }

  //  MOD BUTTON  //
  if (mouseX > 575 && mouseX < 605 && mouseY > 495 && mouseY < 535) {
    if (controls[4].auto) { 
      controls[4].auto = false;
    }
    else { 
      controls[4].auto = true;
    }
  }

  //  SPIN BUTTON  //
  if (mouseX > 575 && mouseX < 615 && mouseY > 545 && mouseY < 585) {
    if (controls[5].auto) { 
      controls[5].auto = false;
    }
    else { 
      controls[5].auto = true;
    }
  }

  //  LINES BUTTON  //
  if (mouseX > 640 && mouseX < 680 && mouseY > 500 && mouseY < 560) {

    if (lines) { 
      lines = false;
    }
    else { 
      lines = true;
      ellipses = false;
      triangles = false;
    }
  }   

  //  ELLIPSES BUTTON  //
  if (mouseX > 690 && mouseX < 730 && mouseY > 500 && mouseY < 560) {
    if (ellipses) { 
      ellipses = false;
    }
    else { 
      ellipses = true;
      lines = false;
      triangles = false;
    }
  }   

  //  TRIANGLES BUTTON  //
  if (mouseX > 740 && mouseX < 780 && mouseY > 500 && mouseY < 560) {
    if (triangles) { 
      triangles = false;
    }
    else { 
      triangles = true;
      lines = false;
      ellipses = false;
    }
  }    

  //  OpacAuto BUTTON  //
  if (mouseX > 760 && mouseX < 776 && mouseY > 570 && mouseY < 586) {
    if (opacAuto) {
      opacAuto = false;
    }
    else {
      opacAuto = true;
    }
  }
}

void mouseDragged() {
  if (dist(mouseX, mouseY, opacX, 580) < 6) {
    opS = true;
    opacAuto = false;
  }
  if (opS) {
    opacX = constrain(mouseX, 697, 753);
  }
  if (controlSwitch == -1) {

    for (int i = 0; i < controls.length - 2; i ++) {
      if (dist(mouseX, mouseY, controls[i].x, controls[i].y) < 6) {
        controlSwitch = i;//once contact is detected it locks on to the control until mouse is released.
        //otherwise if you move the mouse too fast it let's go
        controls[i].auto = false;//overrides auto
      }
    }
  }
  else {
    controls[controlSwitch].x = constrain(mouseX, controls[controlSwitch].ox - 34, controls[controlSwitch].ox + 34);
    controls[controlSwitch].y = constrain(mouseY, controls[controlSwitch].oy - 34, controls[controlSwitch].oy + 34);
  }
}

void mouseReleased() {
  controlSwitch = -1;  //lets go of control only when mouse is released
  opS = false;
}


//===========================================================================================
//                                                      UPDATE
//===========================================================================================
  
void update() {
  a += aInc;

  for (int i = 0; i < controls.length; i++) {
    if (controls[i].auto) {
      //the four auto pilot modes
      if (controls[i].autoMode == 1) {
        controls[i].x = controls[i].ox + sin(a / 5.0 + i) * 30;
        controls[i].y = controls[i].oy + cos(a / 7.0 + i + 1) * 30;
      }
      else if (controls[i].autoMode == 2) {
        controls[i].x = controls[i].ox + sin(a/6.0 + i*2) * 30;
        controls[i].y = controls[i].oy + cos(a/4.0 + i*3) * 30;
      }
      else if (controls[i].autoMode == 3) {
        controls[i].x = controls[i].ox + sin(a / 3.0 + i * 9) * sin(a * 1.5) * 30;
        controls[i].y = controls[i].oy + cos(a / 5.0 + i + 1) * sin(a * 2.1) * 30;
      }
      else {
        controls[i].x = controls[i].ox + sin(a / 2.0 + i * 9) * sin(a *3) * 30;
        controls[i].y = controls[i].oy + cos(a / 4.0 + i + 1) * sin(a * 5) * 30;
      }
    }
  }

  if (opacAuto) {
    opacX = 725 + sin(a/4.0)*28;
  }
}




//===========================================================================================
//                                                      BACKGROUND & FOREGROUND
//===========================================================================================

void bg() {
  noStroke();
  fill(50, 20, 20, trails);
  rect(0, 0, width, height);
}  

void fg() {

  color green = color(40, 100, 80);
  color darkGreen = color(40, 60, 10, 75);
  color darkGreen2 = color(40, 60, 26, 75);

  stroke(40);
  strokeWeight(2);
  line(0, 480, width, 480);

  //  CONTROL BOXES  //
  int bx = 130;
  for (int i = 0; i < 4; i++) {
    fill(darkGreen);
    rect(bx + i * 113, 495, 80, 80, 10);//control box  
    rect(bx + 52 + i * 113, 575, 25, 12, 10);//auto mode
    if (controls[i].auto) {
      fill(darkGreen2);
    }
    else {
      fill(darkGreen);
    }    
    rect(bx + 3 + i * 113, 575, 37, 12, 10);//auto on/off
    fill(40, 100, 80);
    textSize(10);
    text("AUTO", bx + 8 + i * 113, 585); 
    textSize(9);
    text(controls[i].autoMode, bx + 63 + i * 113, 585);
  }

  //  POWER BUTTON  // 
  if (on) {
    fill(darkGreen2);
  }
  else {
    fill(darkGreen);
  }
  rect(15, 495, 40, 40, 10);
  strokeWeight(5);
  stroke(green);
  ellipse(35, 515, 20, 20);
  if (on) {
    stroke(20);
  }
  else {
    stroke(10);
  }
  strokeWeight(2);
  fill(green);
  rect(31, 500, 8, 16, 18);

  //  DIRECTION BUTTON  //
  stroke(40);
  fill(darkGreen);
  rect(70, 495, 40, 40, 10);
  stroke(green);
  noFill();
  ellipse(90, 515, 20, 20);
  stroke(10);
  strokeWeight(2);
  fill(green);
  if (lineDirection == 1) {
    triangle(86, 500, 86, 512, 96, 506);
  }
  else {
    triangle(95, 500, 95, 512, 85, 506);
  }

  //  SPEED BUTTON  //
  fill(darkGreen);
  stroke(40);
  strokeWeight(2);
  rect(15, 545, 40, 40, 10);
  stroke(green);
  noFill();
  ellipse(35, 565, 22, 22);
  point(35, 557);
  point(35, 573);
  point(27, 565);
  point(43, 565);
  if (aInc == 0.015) {
    line(35, 565, 42, 558);
  }
  else {
    line(35, 565, 42, 572);
  }

  //  TRAILS BUTTON  //  
  stroke(40);
  if (trails == 100) {
    fill(darkGreen);
  }
  else {
    fill(darkGreen2);
  }
  rect(70, 545, 40, 40, 10);
  stroke(green);
  strokeWeight(3);
  line(80, 575, 100, 555);
  strokeWeight(2);
  line(80, 575, 102, 560);
  strokeWeight(1);
  line(80, 575, 103, 565);

  //  MOD BUTTON  //
  stroke(40);
  strokeWeight(2);
  if (!controls[4].auto) {
    fill(darkGreen);
  }
  else {
    fill(darkGreen2);
  }
  rect(575, 495, 40, 40, 10);
  stroke(green);
  strokeWeight(2);
  line(585, 520, 589, 510);
  line(589, 510, 593, 520);
  line(593, 520, 597, 510);
  line(597, 510, 601, 520);
  line(601, 520, 605, 510);

  //  SPIN BUTTON  //
  stroke(40);
  strokeWeight(2);
  if (!controls[5].auto) {
    fill(darkGreen);
  }
  else {
    fill(darkGreen2);
  }
  rect(575, 545, 40, 40, 10); 
  stroke(green);
  strokeWeight(2);
  bezier(585, 565, 590, 540, 590, 590, 595, 565);
  bezier(595, 565, 600, 540, 600, 590, 605, 565);

  //  LINES BUTTON  //
  stroke(40);
  strokeWeight(2);
  if (lines) {
    fill(darkGreen2);
  }
  else {
    fill(darkGreen);
  }
  rect(640, 500, 40, 60, 10); 
  stroke(green);
  line(660, 515, 660, 545);

  //  ELLIPSES BUTTON  //
  stroke(40);
  strokeWeight(2);
  if (ellipses) {
    fill(darkGreen2);
  }
  else {
    fill(darkGreen);
  }
  rect(690, 500, 40, 60, 10); 
  stroke(green);
  noFill();
  ellipse(710, 530, 15, 30); 

  //  TRIANGLES BUTTON  //
  stroke(40);
  strokeWeight(2);
  if (triangles) {
    fill(darkGreen2);
  }
  else {
    fill(darkGreen);
  }
  rect(740, 500, 40, 60, 10);
  stroke(green);
  noFill();
  triangle(750, 545, 770, 545, 760, 515);

  //  OPACITY SLIDER  //
  if (triangles || ellipses) {//only drawn for triangles or ellipses
    stroke(40);
    strokeWeight(2);
    fill(darkGreen);
    rect(690, 570, 70, 20, 10);//
    noFill();
    stroke(green);
    ellipse(opacX, 580, 12, 12);  


    //  OPACITY AUTO  //
    if (opacAuto) {
      fill(darkGreen2);
    }
    else {
      fill(darkGreen);
    }
    stroke(40);
    rect(760, 570, 16, 16, 10);
    fill(green);
    textSize(12);
    text("a", 765, 582);
  }
}

