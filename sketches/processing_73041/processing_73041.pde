
/*****************************************
 * Assignment 03
 * Name:         Xinyin Huang
 * E-mail:       xhuang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    2/10/2012
 * 
 * This assingment is about three people (actually three faces) wanting to 
  eat four eggs. When you move the mouse closer to the eggs, they change color
  from white to red and when the mouse is within a certain distance, they are too
  afraid that their eyes appear. At the same time, the further the mouse is, 
  the bigger the faces are. Then, when you click on any of the eggs, the 
  motionless faces will change to greedy faces and an image of knife and forks
  will move as the mouse moves. The four eggs will change to the "after cook"
  color. When you click outside of the eggs, it will go back to original 
  motionless faces and "white-red" eggs. 
***********************************************/

PImage k; 

//define variables;
boolean IWantEgg=false; 

float color1;
float color2;
float color3;

float egg1x=int (random (50.0, 125.0));
float egg1y=int (random (100.0, 150.0));
float egg1w= int (random (50.0, 100.0));
float egg1h=1.5*egg1w;

float egg2x=int (random (150.0, 250.0));
float egg2y=int (random (100.0, 150.0));
float egg2w= int (random (50.0, 100.0));
float egg2h= egg2w*1.5;

float egg3x=int (random (275.0, 320.0));
float egg3y=int (random (100.0, 150.0));
float egg3w= int (random (50.0, 100.0));
float egg3h= egg3w*1.5;

float egg4x=int (random (320.0, 450.0));
float egg4y=int (random (100.0, 150.0));
float egg4w= int (random (50.0, 100.0));
float egg4h= egg4w*1.5;

float face1x=int (random (50.0, 75.0));
float face1y=int (random (300.0, 450.0));
float face1w= int (random (50.0, 100.0));
float face1h= int (random (75.0, 100.0));

float face2x=int (random (250.0, 300.0));
float face2y=int (random (300.0, 450.0));
float face2w= int (random (50.0, 100.0));
float face2h= int (random (75.0, 100.0));

float face3x=int (random (450.0, 475.0));
float face3y=int (random (300.0, 450.0));
float face3w= int (random (50.0, 100.0));
float face3h= int (random (75.0, 100.0));

void setup () {
  size (500, 500);
  smooth();
  k= loadImage ("knife and fork.jpg");
}

//randomly draw 4 eggs and they changes color when mouse moves
void drawEgg (float x, float y, float objectW, float objectH, boolean IWantEgg) {
  if (IWantEgg==false) {
  color1=255;
  color2=dist (mouseX, mouseY,x,y);
  color3=random (200, 255);
  ellipseMode (CENTER);
  fill (color1, color2, color3);
  ellipse (x, y, objectW, objectH);
    if (color2 < objectW+10) {
      fill (255);
      ellipse (x-objectW/5, y-objectH/10, objectW/3, objectH/2);
      ellipse (x+objectW/5, y-objectH/10, objectW/3, objectH/2);
    }
  }
 else {
   fill (255, 228, 196);
   ellipseMode (CENTER);
   ellipse (x, y, objectW, objectH);
 }
} 

//randomly draw 3 faces and they change size when mouse moves 
void drawFace (float a, float b, float ow, float oh, boolean IWantEgg) {
  if (IWantEgg==false) {
    ow=120.0;
    oh=120.0;
    fill (255, 255, 0);
    float distmf =dist (a, b, mouseX, mouseY);
    if (distmf >ow) {
      ellipseMode (CENTER);
      ellipse (a, b, distmf, distmf);
      fill (0);
      ellipse (a-distmf/5, b-distmf/5, distmf/6, distmf/6);
      ellipse (a+distmf/5, b-distmf/5, distmf/6, distmf/6);
      rect (a-distmf/5, b+distmf/5, distmf/2.5, 2);
    }
    else {
      ellipse (a, b, ow, oh);
      fill (0);
      ellipse (a-24, b-24, 20, 20);
      ellipse (a+24, b-24, 20, 20);
      rect (a-24, b+24, 50, 2);
    }
  }

  else  {
    image (k, mouseX-25, mouseY-50, 50, 100);
    ow=120.0;
    oh=120.0;
    fill (255, 255, 0);
    float distmf =dist (a, b, mouseX, mouseY);
    if (distmf >ow) {
      ellipseMode (CENTER);
      ellipse (a, b, distmf, distmf);
      fill (255, 0, 0);
      rect (a-distmf/4, b-distmf/4, distmf/6, distmf/6);
      rect (a+distmf/6, b-distmf/4, distmf/6, distmf/6);
      fill (255);
      rect (a-distmf/4, b, distmf/2, distmf/3);
      fill (255, 0, 0);
      rect (a-distmf/4, b+distmf/6, distmf/2, distmf/32);
      rect (a-distmf/7, b, distmf/32, distmf/3);
      rect (a, b, distmf/32, distmf/3);
      rect (a+distmf/7, b, distmf/32, distmf/3);
      
    }
    else {
      ellipse (a, b, ow, oh);
      fill (255);
      rect (a-30, b, 60, 40);
      fill (255, 0, 0);
      rect (a-30, b-30, 20, 20);
      rect (a+20, b-30, 20, 20);
      rect (a-30, b+20, 60, 3.25);
      rect (a-120/7, b, 3.25, 40);
      rect (a, b, 3.25, 40);
      rect (a+120/7, b, 3.25, 40);
    }
  }
}

void draw () {
  background (255);
  drawEgg (egg1x, egg1y, egg1w, egg1h,IWantEgg);
  drawEgg (egg2x, egg2y, egg2w, egg2h,IWantEgg);
  drawEgg (egg3x, egg3y, egg3w, egg3h,IWantEgg);
  drawEgg (egg4x, egg4y, egg4w, egg4h,IWantEgg);
  drawFace (face1x, face1y, face1w, face1h, IWantEgg);
  drawFace (face2x, face2y, face2w, face2h, IWantEgg);
  drawFace (face3x, face3y, face3w, face3h, IWantEgg);
}

//click mouse on the egg and faces change (why not click on the egg and change faces?)
void mouseClicked () {
  float distmf1= dist (egg1x, egg1y, mouseX, mouseY);
  float distmf2= dist (egg2x, egg2y, mouseX, mouseY);
  float distmf3= dist (egg3x, egg3y, mouseX, mouseY);
  float distmf4= dist (egg4x, egg4y, mouseX, mouseY);
  if (distmf1 < egg1w || distmf2 < egg2w || distmf3 < egg3w || distmf4 < egg4w) {
    IWantEgg=true;
  }
  else {
    IWantEgg=false;
  }
}



