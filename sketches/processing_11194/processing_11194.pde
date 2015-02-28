
int xPos, yPos, a, b;
int rectWidth = 40;
int rectHeight = 70;
boolean active = false;
int segLength = 30;
int radius = 20;
int scalar = 3;
float ang = 0;
float angleInc = PI/20;
float c = 0;
float d = 0;
boolean hover = false;
int legMove = 8;

//arm 1------------------------
float x, y, x2, y2;
float mX, mY;
boolean arm1Active = false;
int displaceX = rectWidth/2 - 3;
int displaceY = -rectHeight/2 + 5;
//-----------------------------

//arm 2------------------------
float x1, y1, x21, y21;
float mX1, mY1;
boolean arm2Active = false;
int displaceX1 = -rectWidth/2 + 3;
int displaceY1 = -rectHeight/2 + 5;
//-----------------------------

//leg 1------------------------
float x11, y11, x211, y211;
float mX11, mY11;
boolean leg1Active = false;
int displaceX11 = -rectWidth/2 + 6;
int displaceY11 = -rectHeight/2 + 65;
//-----------------------------

//leg 2------------------------
float x111, y111, x2111, y2111;
float mX111, mY111;
boolean leg2Active = false;
int displaceX111 = rectWidth/2 - 7;
int displaceY111 = -rectHeight/2 + 65;
//-----------------------------

void setup() {
  smooth();
  size(400, 400);
  rectMode(CENTER);
  ellipseMode(RADIUS);
  xPos = width/2;
  yPos = height/2;

  //arm 1-------------------------
  x = width/2 + 20;
  y = height/2 + 20;
  x2 = width/2;
  y2 = height/2;
  mX = width/2 + 20;
  mY = height/2 + 48;
  //------------------------------

  //arm 2-------------------------
  x1 = width/2 - 20;
  y1 = height/2 + 20;
  x21 = width/2;
  y21 = height/2;
  mX1 = width/2 - 20;
  mY1 = height/2 + 48;
  //------------------------------
  
  //leg 1-------------------------
  x11 = width/2 - 20;
  y11 = height/2 - 120;
  x211 = width/2;
  y211 = height/2;
  mX11 = width/2;
  mY11 = height/2 + 92;
  //------------------------------
  
  //leg 2-------------------------
  x111 = width/2 + 20;
  y111 = height/2 - 120;
  x2111 = width/2;
  y2111 = height/2;
  mX111 = width/2;
  mY111 = height/2 + 92;
  //------------------------------
}

void draw() {
  background(255);
  noStroke();
  fill(#F7C9AA);
  
  if(hover == true) {
    translate(0, -c);
  }
  
  rect(xPos, yPos, rectWidth, rectHeight);
  //head
  ellipse(xPos, yPos - 57, radius, radius);
  //neck
  rect(xPos, yPos - 49, 10, 30);
  fill(0);
  //eyes
  ellipse(xPos - 7, yPos - 61, 3, 3);
  ellipse(xPos + 7, yPos - 61, 3, 3);
  //mouth
  if(hover == true) {
    ellipse(xPos, yPos - 49, 5, 4);
  } else {
    rect(xPos, yPos - 49, 10, 1);
  }
  
  if(hover == true) {
    c = sin(ang) * scalar;
    ang = ang + angleInc;
    d = cos(ang) * scalar;
  }

  //arm1-----------------------------
  pushMatrix();
  translate(xPos - width/2 + displaceX, yPos - height/2 + displaceY);
  strokeWeight(13);
  if(dist((x + (xPos - width/2 + displaceX)), (y + (yPos - height/2 + displaceY)), mouseX, mouseY) < 35 || arm1Active == true) {
    stroke(#F9E2D2);
  }
  else {
    stroke(#F7C9AA);
  }
  if(arm2Active == true || leg1Active == true || leg2Active == true) {
    stroke(#F7C9AA);
  }
  float dx = mX - x;
  float dy = mY - y;
  float angle1 = atan2(dy, dx);  

  float tx = mX - cos(angle1) * segLength;
  float ty = mY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  float angle2 = atan2(dy, dx);  
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;
  mY = mY + c;

  segment(x, y, angle1); 
  segment(x2, y2, angle2);
  popMatrix();
  //-------------------------------

  //arm2-----------------------------
  pushMatrix();
  translate(xPos - width/2 + displaceX1, yPos - height/2 + displaceY1);
  if(dist((x1 + (xPos - width/2 + displaceX1)), (y1 + (yPos - height/2 + displaceY1)), mouseX, mouseY) < 35 || arm2Active == true) {
    stroke(#F9E2D2);
  } 
  else {
    stroke(#F7C9AA);
  }
  if(arm1Active == true || leg1Active == true || leg2Active == true) {
    stroke(#F7C9AA);
  }
  float dx1 = mX1 - x1;
  float dy1 = mY1 - y1;
  float angle11 = atan2(dy1, dx1);  

  float tx1 = mX1 - cos(angle11) * segLength;
  float ty1 = mY1 - sin(angle11) * segLength;
  dx1 = tx1 - x21;
  dy1 = ty1 - y21;
  float angle21 = atan2(dy1, dx1);  
  x1 = x21 + cos(angle21) * segLength;
  y1 = y21 + sin(angle21) * segLength;
  mY1 = mY1 + c;

  segment1(x1, y1, angle11); 
  segment1(x21, y21, angle21);
  popMatrix();
  //-------------------------------
  
  //leg 1-----------------------------
  pushMatrix();
  translate(xPos - width/2 + displaceX11, yPos - height/2 + displaceY11);
  if(dist((x11 + (xPos - width/2 + displaceX11)), (y11 + (yPos - height/2 + displaceY11)), mouseX, mouseY) < 35 || leg1Active == true) {
    stroke(#F9E2D2);
  } 
  else {
    stroke(#F7C9AA);
  }
  if(leg2Active == true || arm1Active == true || arm2Active == true) {
    stroke(#F7C9AA);
  }
  float dx11 = mX11 - x11;
  float dy11 = mY11 - y11;
  float angle111 = atan2(dy11, dx11);  

  float tx11 = mX11 - cos(angle111) * segLength;
  float ty11 = mY11 - sin(angle111) * segLength;
  dx11 = tx11 - x211;
  dy11 = ty11 - y211;
  float angle211 = atan2(dy11, dx11);  
  x11 = x211 + cos(angle211) * segLength;
  y11 = y211 + sin(angle211) * segLength;
  mY11 = mY11 + d/legMove;
  y11 = y11 + d/legMove;

  segment11(x11, y11, angle111); 
  segment11(x211, y211, angle211);
  popMatrix();
  //-------------------------------
  
  //leg 2-----------------------------
  pushMatrix();
  translate(xPos - width/2 + displaceX111, yPos - height/2 + displaceY111);
  if(dist((x111 + (xPos - width/2 + displaceX111)), (y111 + (yPos - height/2 + displaceY111)), mouseX, mouseY) < 35 || leg2Active == true) {
    stroke(#F9E2D2);
  } 
  else {
    stroke(#F7C9AA);
  }
  if(leg1Active == true) {
    stroke(#F7C9AA);
  }
  float dx111 = mX111 - x111;
  float dy111 = mY111 - y111;
  float angle1111 = atan2(dy111, dx111);  

  float tx111 = mX111 - cos(angle1111) * segLength;
  float ty111 = mY111 - sin(angle1111) * segLength;
  dx111 = tx111 - x2111;
  dy111 = ty111 - y2111;
  float angle2111 = atan2(dy111, dx111);  
  x111 = x2111 + cos(angle2111) * segLength;
  y111 = y2111 + sin(angle2111) * segLength;
  mY111 = mY111 + d/legMove;
  y111 = y111 + d/legMove;

  segment111(x111, y111, angle1111); 
  segment111(x2111, y2111, angle2111);
  popMatrix();
  //-------------------------------

  println(mouseY);
}

//arm1--------------------------------
void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
//-------------------------------------

//arm2--------------------------------
void segment1(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
//-------------------------------------

//leg1--------------------------------
void segment11(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
//-------------------------------------

//leg2--------------------------------
void segment111(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
//-------------------------------------

void mousePressed() {
  if(mouseX > xPos - rectWidth/2 && mouseX < xPos + rectWidth/2 && mouseY > yPos - rectHeight/2 && mouseY < yPos + rectHeight/2) {
    active = true;
  }
  a = abs(xPos - mouseX);
  b = abs(yPos - mouseY);

  //arm1---------------------------------------------
  if(dist((x + (xPos - width/2 + displaceX)), (y + (yPos - height/2 + displaceY)), mouseX, mouseY) < 35) {
    arm1Active = true;
  }
  //------------------------------------------------

  //arm2---------------------------------------------
  else if(dist((x1 + (xPos - width/2 + displaceX1)), (y1 + (yPos - height/2 + displaceY1)), mouseX, mouseY) < 35) {
    arm2Active = true;
  }
  //------------------------------------------------
  
  //leg1---------------------------------------------
  else if(dist((x11 + (xPos - width/2 + displaceX11)), (y11 + (yPos - height/2 + displaceY11)), mouseX, mouseY) < 35) {
    leg1Active = true;
  }
  //------------------------------------------------
  
  //leg2---------------------------------------------
  else if(dist((x111 + (xPos - width/2 + displaceX111)), (y111 + (yPos - height/2 + displaceY111)), mouseX, mouseY) < 35) {
    leg2Active = true;
  }
  //------------------------------------------------
}

void mouseReleased() {
  active = false;

  //arm1---------------------------
  arm1Active = false;
  //-------------------------------

  //arm2---------------------------
  arm2Active = false;
  //-------------------------------
  
  //leg1---------------------------
  leg1Active = false;
  //-------------------------------
  
  //leg2---------------------------
  leg2Active = false;
  //-------------------------------
}

void mouseDragged() {
  if(active == true) {
    if(mouseX < xPos) {
      xPos = mouseX + a;
    }
    else if(mouseX > xPos) {
      xPos = mouseX - a;
    }
    if(mouseY < yPos) {
      yPos = mouseY + b;
    }
    else if(mouseY > yPos) {
      yPos = mouseY - b;
    }
  }

  //arm1--------------------------------------------
  if(arm1Active == true) {
    mX = mouseX - (xPos - width/2 + displaceX);
    mY = mouseY - (yPos - height/2 + displaceY);
  }
  //------------------------------------------------

  //arm2--------------------------------------------
  if(arm2Active == true) {
    mX1 = mouseX - (xPos - width/2 + displaceX1);
    mY1 = mouseY - (yPos - height/2 + displaceY1);
  }
  //------------------------------------------------
  
  //leg1--------------------------------------------
  if(leg1Active == true) {
    mX11 = mouseX - (xPos - width/2 + displaceX11);
    mY11 = mouseY - (yPos - height/2 + displaceY11);
  }
  //------------------------------------------------
  
  //leg2--------------------------------------------
  if(leg2Active == true) {
    mX111 = mouseX - (xPos - width/2 + displaceX111);
    mY111 = mouseY - (yPos - height/2 + displaceY111);
  }
  //------------------------------------------------
}

void keyPressed() {
  if(key == '1') {
    mX = width/2 + 30;
    mY = height/2 - 50;
    mX1 = width/2 - 30;
    mY1 = height/2 - 50;
    
    x11 = width/2 - 30;
    y11 = height/2 + 63;
    mX11 = width/2 - 20;
    mY11 = height/2 + 53;
    
    x111 = width/2 + 30;
    y111 = height/2 + 63;
    mX111 = width/2 + 20;
    mY111 = height/2 + 53;
    hover = true;
  }
  else if(key == '2') {
    hover = false;
    c = 0;
    d = 0;
    ang = 0;
  }
}









