
import controlP5.*;

/* 
Code Creator:  Jamie Risner
Poject: CFD Couette Flow Analysis
Date Created:10/03/2014
*/

float[] U, UNew;
int ITER = 10000;
int width_x = 1300; //width of window
int width_y = 500;
float dy, dt;
float Re = 5000;
int N = 100;
boolean Looping = true;
int topBorder=70;
int thickRect=10;
int LBorder=30;
int RBorder=500;
float T;
PImage img;
int bottomFlow = width_y - topBorder - thickRect;
float line_length;
float line_height;

ControlP5 cp5;

void setup() {
  size(width_x, width_y);
  background(255);
  smooth();
  PFont Headline = loadFont("AgencyFB-Bold-38.vlw");
  textFont(Headline, 30);
  textAlign(CENTER, BOTTOM);
  fill(#C40A0A);
  noStroke();
  rect(0, 20, width, 60);
  fill(255);
  text("Project 1 CFD Analysis of Couette Flow- Jamie Risner", width/2, 52 );
  textFont(Headline, 14);
  fill(0);
  // text("Finite Difference Method", RBorder+100, 110, 350, 200);
  rectMode(CORNERS);
  textAlign(LEFT);
  PFont font = createFont("arial", 20);
  /*------------------------------
   CP5 CONTROLLER CREATION
   ------------------------------*/
  cp5 = new ControlP5(this);
  cp5.addSlider("ITER")
    .setPosition(RBorder+130, 140)
      .setSize(500, 20)
        .setRange(0, 10000)
          .setColorCaptionLabel(color(0))
            .setCaptionLabel("Number of Iterations")
              .setColorBackground(#C40A0A)
                ;                  
  ;

  cp5.addSlider("Re")
    .setPosition(RBorder+130, 200)
      .setSize(500, 20)
        .setRange(0, 20000)
          .setColorCaptionLabel(color(0))
            .setCaptionLabel("Flow Reynolds Number")
              .setColorBackground(#C40A0A)
                ;

  cp5.addSlider("N")
    .setPosition(RBorder+130, 260)
      .setSize(500, 20)
        .setRange(0, 1000)
          .setColorCaptionLabel(color(0))
            .setCaptionLabel("Set Number of Grid Points")
              .setColorBackground(#C40A0A)
                ;

  cp5.addBang("GO")
    .setPosition(RBorder+170, height-170)
      .setSize(40, 40)
        .setLabel("Run Analysis")
          .setColorBackground(#C40A0A)
            ;

  cp5.addBang("CAPTURE")
    .setPosition(RBorder+370, height-170)
      .setSize(40, 40)
        .setLabel("Capture Image")
          .setColorBackground(#C40A0A)
            ;
 
 /*-----------------------
   -------------------------*/
  U = new float[10000];
  UNew = new float[10000];
  ITER=50;
}
void draw() {
  //REDRAW BACKGROUND SO GRAPHIC CAN UPDATE

  for (int l = 0; l < N; l++) {
    line_length = map(U[l], 0, 1.0, 0.0, (RBorder-LBorder));
    line_height = map(l*dy, 0, 1.0, 0.0, (height - (topBorder + thickRect))-(topBorder+thickRect));
    stroke(#C40A0A);
    line(LBorder, bottomFlow - line_height, LBorder+line_length, bottomFlow-line_height);
  }
  fill(0);

  text("RUN", RBorder+140, height-145);
  text("CAPTURE", RBorder+320, height-145);

  if (Looping) {
    /*-------------------------------------------------------
    Variable Initialisation of Variables for Primary Loop
    -------------------------------------------------------*/

    for (int i = 0; i < N; i++) {
      U[i]=0.0; //RESETs the inital conditions to Zero
    }
    U[N-1]=1.0; //RESET top plate boundary condition
    T=0.0; //Inialise Time to Zero
    dy = 1.0/N; //Calculate DY 
    dt = 0.5*Re*(dy*dy); //Calculate TimeStep
    
    //-------------------------------------------------------
    //Create Graph Framework
    //-------------------------------------------------------
    fill(255);
    noStroke();
    rect(0, 50, width, height);
    stroke(0);
    fill(64, 64, 64);
    rect(LBorder, topBorder, RBorder, topBorder + thickRect);
    rect(LBorder, height - topBorder, RBorder, height - (topBorder + thickRect));
    fill(0);
    line(RBorder, topBorder+thickRect/2, RBorder+100, topBorder+thickRect/2);
    line(RBorder+100, topBorder+thickRect/2, RBorder+90, topBorder-thickRect/2);
    line(RBorder+100, topBorder+thickRect/2, RBorder+90, topBorder+thickRect+thickRect/2);
    text("Ue", RBorder+50, topBorder+2*thickRect);
    //-------------------------------------------------------
    //END OF SETTING UP PLOTTING SPACE
    //-------------------------------------------------------

    Explicit();

    Looping=false;
  }
  Looping = false;
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName().equals("GO")) {
    Looping= true;
  } 
  else if (theEvent.getController().getName().equals("CAPTURE")) {
    img = get(0, 50, RBorder+120, 500);

    img.save("explicit"+ITER+"run.jpg");
  }
}
void Explicit() {
  for (int i = 1; i < ITER; i++) {
    T=T+dt;
    for (int j = 1; j < N-1 ; j++) {
      UNew[j]=U[j]+((1.0/Re)*dt)/(dy*dy) * (U[j+1] - 2.0*U[j]+U[j-1]);
    } 
    for (int k = 1; k < N-1; k++) {
      U[k]= UNew[k];
    }
  }
}


