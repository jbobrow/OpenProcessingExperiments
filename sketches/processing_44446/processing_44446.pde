
//Copyright Eric Mackie, October 2011, Pittsburgh PA
// CMU: Computing in the Arts with Processing - 60-257 with Jim Roberts

//===============E Specific Variables===============
float w, w2, w4;
float h, h2, h4, h8;
float wSizeBall;
float hSizeBall;

//=================Camera Variables===============
float objX, objY, objZ;
float eyeX, eyeY, eyeZ;

//===================Movement Variables==================
float deltaX, deltaY, deltaZ;
float zPlace, xPlace, yPlace;
float xPos, yPos;
float zPlaceCurrent;

//=================Slider Variables=================
float barX, barX2, barX3, barY, barW, barH;
float knob1X, knob2X, knob3X;
float knob1Y, knob2Y, knob3Y;
float knobD;

//=================Rotation Variables================
float rotX, rotY, rotZ;



void setup() {

  size(500, 500, P3D);
  noStroke();
  textMode(SCREEN);
  textAlign(CENTER,CENTER);
  textSize(10);


  //======= E Specific Variables==========
  w=width;
  w2=width/2;
  w4=width/4;
  h=height;
  h2=height/2;
  h4 = height/4;
  h8 = height/8;
  wSizeBall=width/35;
  hSizeBall=height/35;

  //======== Camera Variables=============
  objX=0;
  objY=0;
  objZ=0;
  eyeX=0;
  eyeY=0;
  eyeZ=500;

  //===================Movement Variables==================
  deltaX=0;
  deltaY=0;
  deltaZ=0;
  zPlace=0;
  xPlace=0;
  yPlace=0;

  //======================Slider Variables===================
  barX=17*width/20;
  barX2=18*width/20;
  barX3=19*width/20;
  barY=height/20;
  barW=width/30;
  barH=3*height/4;
  knob1X=barX+barW/2;
  knob2X=barX2+barW/2;
  knob3X=barX3+barW/2;
  knob1Y=barY+.5*barH;
  knob2Y=barY+.5*barH;
  knob3Y=barY+.5*barH;
  knobD=3*barW/4;
}

void draw() {
  background(5, 5, 20);
  cameraStuff();
  draw_initial_E();
  sliderBars();
  buttons();
  labels();
}


void labels(){
  pushMatrix();
  ambientLight(255,255,255);
  
  text("stop",barX+barW,19*height/20);
  text("reset", barX3, 19*height/20);
  
  text("rotation", barX2+.5*barW,height/20);
  text("x", barX+.5*barW, barY+1.01*barH);
  text("y", barX2+.5*barW, barY+1.01*barH);
  text("z", barX3+.5*barW, barY+1.01*barH);
  
  text("distance", width/10, 8*height/40);
  text("L/R: "+int(xPlace), width/10,9*height/40);
  text("U/D: "+int(yPlace), width/10,10*height/40);
  text("I/O: "+int(zPlace), width/10,11*height/40);
  
  text("speed", width/10,13*height/40);
  text("x: "+int(deltaX), width/10,14*height/40);
  text("y: "+int(deltaY), width/10,15*height/40);
  text("z: "+int(deltaZ), width/10,16*height/40);
  
  text("rotation", width/10,18*height/40);
  text("x: "+int(rotX), width/10,19*height/40);
  text("y: "+int(rotY), width/10,20*height/40);
  text("z: "+int(rotZ), width/10,21*height/40);
  popMatrix();
}



void buttons() {

  //====DRAW spheres for Buttons======
  pushMatrix();
  translate(-width/2, -height/2, 0);
  pushMatrix();
  translate(barX2+barW, 19*height/20, 0);
  sphere(barW);
  popMatrix();
  pushMatrix();
  translate(barX3+2*barW, 19*height/20, 0);
  sphere(barW);
  popMatrix();
  popMatrix();
}






void sliderBars() {
  pushMatrix();
  translate(-width/2, -height/2, 0);
  //============Color and Translate the Bars============
  //ambientLight(255, 255, 255, 0, 0, 0);
  translate(0, 0, 65);
  //====================Draw them!=========================
  rect(barX, barY, barW, barH);
  rect(barX2, barY, barW, barH);
  rect(barX3, barY, barW, barH);

  //===============TESTS for MOVEMENT==========

  //===================SLIDER 1=================
  if ((mouseX>=barX) && (mouseX<=barX+barW) && 
    (mouseY>=barY) && (mouseY<=barY+barH)) {
    if (mousePressed==true) {
      knob1Y= constrain(mouseY, barY, barY+barH);
    }
  }
  pushMatrix();
  translate(knob1X, knob1Y, 0);
  sphere(knobD);
  popMatrix();


  //==================SLIDER 2=================
  if ((mouseX>=barX2) && (mouseX<=barX2+barW)&& 
    (mouseY>=barY) && (mouseY<=barY+barH)) {
    if (mousePressed==true) {
      knob2Y= constrain(mouseY, barY, barY+barH);
    }
  }
  pushMatrix();
  translate(knob2X, knob2Y, 0);
  sphere(knobD);
  popMatrix();


  //====================SLIDER 3==================
  if ((mouseX>=barX3) && (mouseX<=barX3+barW)&& 
    (mouseY>=barY) && (mouseY<=barY+barH)) {
    if (mousePressed==true) {
      knob3Y= constrain(mouseY, barY, barY+barH);
    }
  }
  pushMatrix();
  translate(knob3X, knob3Y, 0);
  sphere(knobD);
  popMatrix();

  //===================ROTATION MAPPING=============

  rotX=map(knob1Y, barY, barY+barH, -360, 360);
  rotY=map(knob2Y, barY, barY+barH, -360, 360);
  rotZ=map(knob3Y, barY, barY+barH, -360, 360);

  popMatrix();
}




void cameraStuff() {

  camera(eyeX, eyeY, eyeZ, objX, objY, objZ, 0, 1.0, 0);
}





void draw_initial_E() {

  //================Keep Lighting Constant, Rotate Initial=============
  pushMatrix();
  lighting();
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));

  //=====Fix Location for Camera=======

  translate(-width/2, -height/2, 0);

  //==================Transformation/Movement!===============
  zPlace+=deltaZ;
  xPlace+=deltaX;
  yPlace+=deltaY;
  //=====================Limit Sight and Draw the thing!=============

  if (zPlace<eyeZ) {
    topSpheres();
    bottomSpheres();
    middleSpheres();
    connectSpheres();
  }
  popMatrix();
}

void lighting() {
  directionalLight(160, 180, 40, 0, 1, 1);
  directionalLight(160, 180, 40, 0, -1, 1);
}

void topSpheres() {
  for (float i=.025; i<=3.2;i+=i) {
    pushMatrix();
    xPos = w2+w4*(cos(radians(i*millis())));
    yPos = h8+.5*h8*(cos(radians(2*i*millis())));
    translate(xPos+xPlace, yPos+yPlace, zPlace);
    sphere(wSizeBall+hSizeBall);
    popMatrix();
  }
}

void bottomSpheres() {
  for (float i=.025; i<=3.2;i+=i) {
    pushMatrix();
    xPos = w2+w4*(cos(radians(i*millis())));
    yPos = 7*h8-.5*h8*(cos(radians(2*i*millis())));
    translate(xPos+xPlace, yPos+yPlace, zPlace);
    sphere(wSizeBall+hSizeBall);
    popMatrix();
  }
}

void middleSpheres() {
  for (int i=2; i<7; i++) {
    pushMatrix();
    xPos=w4+2*wSizeBall*i;
    yPos=h2;    
    float zPos=0+30*(cos(radians(.5*millis()+25*i)));
    translate(xPos+xPlace, yPos+yPlace, zPos+zPlace);
    sphere(wSizeBall+hSizeBall);
    popMatrix();
  }
}

void connectSpheres() {
  //======TOP Diagonol
  for (int i=0; i<3; i++) {
    float zPos=0+30*(cos(radians(.5*millis()+25*i)));
    pushMatrix();
    translate(w4+wSizeBall*i+xPlace, 3*h8+hSizeBall*i+yPlace, zPos+zPlace);
    sphere(.5*wSizeBall+.5*hSizeBall);
    popMatrix();
  }


  //=====BOTTOM Diagonal
  for (int i=0; i<3; i++) {
    float zPos=0+30*(cos(radians(.5*millis()+25*i)));
    pushMatrix();
    translate(w4+wSizeBall*i+xPlace, 5*h8-hSizeBall*i+yPlace, zPos+zPlace);
    sphere(.5*wSizeBall+.5*hSizeBall);
    popMatrix();
  }
}



void keyPressed() {

  //=================Movement Controls================

  if (keyCode==UP) {
    deltaY+=-1;
  }

  if (keyCode==DOWN) {
    deltaY+=1;
  }

  if (keyCode==RIGHT) {
    deltaX+=1;
  }

  if (keyCode==LEFT) {
    deltaX+=-1;
  }

  if (key== 'a') {
    deltaZ+=-1;
  }

  if (key== 'c') {
    deltaZ+=1;
  }


  //==============Stopping and Reset Controls===========

  if (key== 's') {
    deltaX=0;
    deltaY=0;
    deltaZ=0;
  }

  if (key == 32) {
    objX=0;
    objY=0;
    objZ=0;
    eyeX=0;
    eyeY=0;
    eyeZ=500;
    deltaX=0;
    deltaY=0;
    deltaZ=0;
    zPlace=0;
    xPlace=0;
    yPlace=0;
    knob1Y=barY+.5*barH;
    knob2Y=barY+.5*barH;
    knob3Y=barY+.5*barH;
  }

  //================ZOOM CONTROLS====================
  //Thanks to Ziad Ewais for the 
  //idea of switching the order of the zPlace
  // and zPlaceCurrent variables

  if (key== 'z') {
    zPlaceCurrent=zPlace;
    zPlace=-500;
  }
  if (key== 'x') {
    zPlace=zPlaceCurrent;
  }
}

//===========================Reset and Stop BUTTONS===================
void mousePressed() {
  if (dist(mouseX, mouseY, barX+.5*barW, 17.75*height/20)<=barW) {
    deltaX=0;
    deltaY=0;
    deltaZ=0;
  }
  if (dist(mouseX, mouseY, barX2+1.5*barW, 17.75*height/20)<barW) {
    objX=0;
    objY=0;
    objZ=0;
    eyeX=0;
    eyeY=0;
    eyeZ=500;
    deltaX=0;
    deltaY=0;
    deltaZ=0;
    zPlace=0;
    xPlace=0;
    yPlace=0;
    knob1Y=barY+.5*barH;
    knob2Y=barY+.5*barH;
    knob3Y=barY+.5*barH;
  }
}


