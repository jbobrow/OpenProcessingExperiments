

int x, y, px, py;
int p=0;
float r, g, b;
////
float xpos;
float ypos;
int menuchoice=0;
boolean cleanscreen=false;
//
boolean eraserON=false;
boolean saveOn=false;
boolean infoOn=false;
PImage ex, bg, bg2;

PFont font;
color menuBackground=color(205, 205, 193);
color rd=color(242, 46, 46);
color or=color(242, 155, 48);
color yel=color(181, 209, 51);
//color yel=color(233, 255, 132);
color blu=color(43, 191, 189);
color violet=color(4, 81, 140);
color blc=color(191, 123, 176);
color noir=color(20);
color menuButton=color(170);
color menuRoll=color(70);

color active, fillup;

int Pallette_yS=5;
int Pallette_yE=65;
//Mandala


int BrushSize = 1;
int SliceNumber = 8;

int centerX;
int centerY;
int slices = 8;
int brushSize = 1;
int drawType = 0;
float angleOffset = -PI/2;

int[] colorPlatte; 
/////CP5 
import controlP5.*;
ControlP5 cp5;
ControlP5 slider;
int myColor = color(255);
int sliderValue = 100;

float n, n1;
int menu;
char letter; 

void eraserSwitch() {
  eraserON=!eraserON;
  println(eraserON);
}
void infoSwitch() {
  infoOn=!infoOn;
}

void setup() {
size(600,800);
  orientation(PORTRAIT);
  // oscP5 = new OscP5(this, 12007);  
  //remoteLocation = new NetAddress("192.168.1.100", 12007); //(1)
  //  remoteLocation = new NetAddress("192.168.2.2", 12007); //(1)
  ControlFont cf1 = new ControlFont(createFont("Arial", 20));
  background(255);
  smooth();
  frameRate(30);
  ex=loadImage("ex2.jpg");
  bg=loadImage("menuA.jpg");
  bg2=loadImage("menuB.jpg");
  smooth();
  centerX = round(width/2);
  centerY = round(height/2)+55;
  fill(0);
  drawPlatte();

  active=violet;
  menuCP();
  background(255);

  colorPlatte = new int[7];
  for (int i=0;i<7;i++) {
    colorPlatte[i]=width-60-i*40;
    if (i==0)fillup=rd;
    if (i==1)fillup=or;
    if (i==2)fillup=yel;
    if (i==3)fillup=blu;
    if (i==4)fillup=violet;
    if (i==5)fillup=blc;
    if (i==6)fillup=noir;
    fill(fillup);
    rect(colorPlatte[i], 15, 30, 30);
  }
  fill(0, 100);
  rect(0, 60, width, 50);
}
void drawPlatte() {
  if (infoOn) { 
    image(ex, 0, 110);  //ex is mandala tutorial
  }

  if (eraserON) {
    image(bg2, 0, 0);  //menuB
  }
  else if (infoOn) {
    image(bg2, 0, 0);  //munuB
  }
  else {
    image(bg, 0, 0);
  }
}

public void controlEvent(ControlEvent theEvent) {

  println(theEvent.getController().getName());
  n = 0;
}

// function: Mandala
// args: theValue:integer
// returns: void (or something like this)
// description: function colorA receives changes from 
// controller with name colorA
public void S1(int theValue) {
  letter='a';
  cleanscreen=false;
  //drawPlatte();
}

public void S2(int theValue) {
  letter='b';
  cleanscreen=false;
}

public void S3(int theValue) {
  letter='c';
  cleanscreen=false;
}
public void CLEAR() {
  letter='d';
  background(255);
  drawPlatte();
}

//******************************** draw *********************************//////
void draw() {

  switch(letter) {
  case 'a': 
    menuchoice=1;
    rectMode(CORNER);
    drawPlatte();

    //start 
    if (eraserON==false) {
      drawMirroredSlices(SliceNumber, x, y);
      //player1 drawing
      if (mousePressed && mouseY>120) {
        drawMirroredSlices(SliceNumber, mouseX, mouseY);
      }
    }
    else {  
      strokeWeight(10+BrushSize*4);
      stroke(255);
      if (mousePressed) {
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    } 

    break;
  default: 
    menuchoice=1;
    rectMode(CORNER);
    drawPlatte();

    //start 
    if (eraserON==false) {
      //player2 are drawing
      drawMirroredSlices(SliceNumber, x, y);

      //player1 drawing
      if (mousePressed && mouseY>120) {
        drawMirroredSlices(SliceNumber, mouseX, mouseY);
      }
    }
    else {  
      strokeWeight(10+BrushSize*4);
      stroke(255);
      if (mousePressed) {
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    } 

    break;
  case 'b': 
    menuchoice=2;
    rectMode(CORNER);
    drawPlatte();

    if (eraserON==false) {
      //player2 drawing
      drawSlices(SliceNumber, x, y);
      //player1 drawing
      if (mousePressed && mouseY>120) {
        drawSlices(SliceNumber, mouseX, mouseY);
      }
    }
    else {  
      strokeWeight(10+BrushSize);
      stroke(255);
      if (mousePressed) {
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    }
    break;

  case 'c': 

    menuchoice=3;
    noStroke();
    fill(255);
    rect(0, 0, width, 135);
    drawPlatte();
    if (eraserON==false) {
      stroke(active);
      //stroke(0);
      float remoteSpeed = dist(px, py, x, y);  //(2)
      //  strokeWeight(remoteSpeed);  //(3)
      float dik=20-remoteSpeed;
      if (dik<1)dik=1;
      strokeWeight(dik);
      line(px, py, x, y);  //(4)
      px = x;  //(5)
      py = y;  //(6)

      if (mousePressed) {
        strokeWeight(random(10)*BrushSize);
        stroke(active, 40);
        //point((mouseX+15), (mouseY+15));
        point(mouseX, mouseY);
        point((600-mouseX), mouseY);
      }
    } 
    else {  

      strokeWeight(10+BrushSize);
      stroke(255);
      if (mousePressed) {
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    }
    noStroke();
    break;
  }
}

float getRadius(int lx, int ly) {
  return sqrt(sq(lx-centerX)+sq(ly-centerY));
}

float getAngle(int lx, int ly) {
  return atan2((ly-centerY), (lx-centerX));
}

void drawSlices(int numSlices, int mx, int my) {
  float radius = getRadius(mx, my);
  float angle = getAngle(mx, my);
  int px=pmouseX;
  int py=pmouseY;
  noStroke();
  if (menuchoice==1) {
    for (int i = 0; i < numSlices; i++) {
      int lx = centerX + round(radius*cos(angle+i*((2*PI)/numSlices)));
      int ly = centerY + round(radius*sin(angle+i*((2*PI)/numSlices)));
      myDraw(lx, ly);
    }
  }
  else if (menuchoice==2) {
    for (int i = 0; i < numSlices; i++) {
      int lx = centerX + round(radius*cos(angle+i*((2*PI)/numSlices)));
      int ly = centerY + round(radius*sin(angle+i*((2*PI)/numSlices)));
      myDraw2(lx, ly, px, py);
    }
  }
}

void drawMirroredSlices(int numSlices, int mx, int my) {
  float radius = getRadius(mx, my);
  float angle = getAngle(mx, my);
  int px=pmouseX;
  int py=pmouseY;
  float sliceAngle = (2*PI)/numSlices;
  if (menuchoice==1) {
    for (int i = 0; i < numSlices+3; i=i+2) {
      int x1 = centerX + round(radius*cos(angle+i*sliceAngle));
      int y1 = centerY + round(radius*sin(angle+i*sliceAngle));
      myDraw(x1, y1);
      int x2 = centerX + round(radius*cos(-angle+i*sliceAngle));
      int y2 = centerY + round(radius*sin(-angle+i*sliceAngle));
      myDraw(x2, y2);
    }
  }
  else if (menuchoice==2) {
    for (int i = 0; i < numSlices+3; i=i+2) {
      int x1 = centerX + round(radius*cos(angle+i*sliceAngle));
      int y1 = centerY + round(radius*sin(angle+i*sliceAngle));
      myDraw2(x1, y1, px, py);
      int x2 = centerX + round(radius*cos(-angle+i*sliceAngle));
      int y2 = centerY + round(radius*sin(-angle+i*sliceAngle));
      myDraw2(x2, y2, px, py);
    }
  }
}


void myDraw(int lx, int ly) {

  noStroke();
  int brushTrial=int(random(1, 3));
  //fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  fill(active);
  smooth();
  ellipse(lx, ly, BrushSize+brushTrial, BrushSize+brushTrial);
  fill(active, 100);

  // ellipse((lx-15), (ly-15), brushSize+brushTrial, brushSize+brushTrial);

  //line(lx, ly, centerX+random(50), centerY+random(50));
  //filter(BLUR,1);
}
void myDraw2(int lx, int ly, int px, int py) {

  noStroke();
  int brushTrial=1;
  //fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  stroke(active);
  smooth();
  ellipse(lx, ly, BrushSize+brushTrial, BrushSize+brushTrial);
  ellipse(px, py, BrushSize+brushTrial, BrushSize+brushTrial);
  strokeWeight(1+brushTrial);
  //background(255);
  //line(lx, ly, px, py);
  fill(active, 100);
  //ellipse((lx-15), (ly-15), brushSize+brushTrial, brushSize+brushTrial);
  //line(lx,ly,centerX+random(50),centerY+random(50));
  //filter(BLUR,1);
}
void mouseReleased() {
  p=0;
}

void mousePressed() {
  if (mouseY<60) {
    if (eraserON) {
      eraserON=false;
    } 
    if (infoOn) {
      infoOn=false;
    }
  }
  if (mouseX>colorPlatte[0] && mouseX< colorPlatte[0]+30 && mouseY > Pallette_yS && mouseY<  Pallette_yE) {
    active=rd;
  }
  if (mouseX>colorPlatte[1] && mouseX< colorPlatte[1]+30 && mouseY > Pallette_yS && mouseY<  Pallette_yE) {
    active=or;
  }
  if (mouseX>colorPlatte[2] && mouseX< colorPlatte[2]+30 && mouseY > Pallette_yS && mouseY<  Pallette_yE) {
    active=yel;
  }
  if (mouseX>colorPlatte[3] && mouseX< colorPlatte[3]+30 && mouseY > Pallette_yS && mouseY<  Pallette_yE) {
    active=blu;
  }
  if (mouseX>colorPlatte[4] && mouseX< colorPlatte[4]+30 && mouseY > Pallette_yS && mouseY<  Pallette_yE) {
    active=violet;
  }
  if (mouseX>colorPlatte[5] && mouseX< colorPlatte[5]+30 && mouseY > Pallette_yS && mouseY<  Pallette_yE) {
    active=blc;
  }
  if (mouseX>colorPlatte[6] && mouseX< colorPlatte[6]+30 && mouseY >  Pallette_yS && mouseY<  Pallette_yE) {
    active=noir;
  }
  if (mouseX>180 && mouseX< 220 && mouseY > 15 && mouseY< 45) {
    eraserSwitch();
    //  setup();width-360,15
  }
  if (mouseX>230 && mouseX< 260 && mouseY > 15 && mouseY< 45) {
    saveFrame("Paint-######.png");
  }
  if (mouseX>270 && mouseX< 300 && mouseY > 15 && mouseY< 45) {
    infoSwitch();
  }
}
void menuCP() {
  cp5 = new ControlP5(this);
  slider = new ControlP5(this);

  ControlFont cf1 = new ControlFont(createFont("Dialog", 13));
  slider.addSlider("BrushSize")
    .setPosition(width-200, 70)
      .setSize(110, 25)
        .setRange(0, 12) // values can range from big to small as well
          .setValue(1)
            .setNumberOfTickMarks(12)
              .setSliderMode(Slider.FLEXIBLE)
                .captionLabel().setControlFont(cf1)
                  ;
  slider.addSlider("Slices")
    .setPosition(width-360, 70)

      .setSize(110, 25)
        .setColorActive(active)
          .setColorBackground(color(191, 42, 42))
            .setRange(2, 12) // values can range from big to small as well
              .setValue(9)
                .setNumberOfTickMarks(11)
                  .setSliderMode(Slider.FLEXIBLE)
                    .captionLabel().setControlFont(cf1)
                      ;
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
  // by default it is Slider.FIX
  cp5.addButton("S1")
    .setValue(0)
      .setPosition(20, 70)
        .setSize(38, 40)
          //.setHeight(50)
          .captionLabel().setControlFont(cf1)
            ;

  // and add another 2 buttons
  cp5.addButton("S2")
    .setValue(100)
      .setPosition(60, 70)
        .setSize(38, 40)
          //.setHeight(50)
          .captionLabel().setControlFont(cf1)

            ;

  cp5.addButton("S3")
    .setPosition(100, 70)
      .setSize(38, 40)

        //.setHeight(50)
        .captionLabel().setControlFont(cf1)
          // .getCaptionLabel().align(CENTER, CENTER)
          //   .setValue(0)
          ;

  cp5.addButton("CLEAR")
    .setPosition(160, 70)
      .setSize(38, 29)
        .setValue(0)
          ;
}



