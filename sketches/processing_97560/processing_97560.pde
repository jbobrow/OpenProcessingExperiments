
// Click and Drag an object
// Daniel Shiffman <http://www.shiffman.net>

import controlP5.*;
ControlP5 cp5, txt;

//import ketai.ui.*;
boolean trigger=false;
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress remoteLocation;
int x=0;
int y=0;
int px=0;
int py=0;
int menuChoice=0;
int myColorBackground = color(255);

int sliderValue = 100;
Textarea myTextarea;
//import ketai.sensors.*;
//KetaiSensor sensor;
public int h1 = 0;
public int s1 = 77;
public int b1 = 77;

int hueX=10;
int hueY=15;
int satX=240;
int  briX=435;
public color primary, secondary;
Textlabel primaryLabel, secondaryLabel, title;
PFont title2;
///

int Pallette_yS;
int Pallette_yE;

public int choice=0;
color active, active1, active2, fillup;
PImage img, colorload, info;
//
/*
PVector accelerometer = new PVector();
 PVector pAccelerometer = new PVector();
 */
//
int counter=0;
int color_mode=0;
///
int rectSize;
int ellipseSize;

void setup() {
  //  sensor = new KetaiSensor(this);
  //  sensor.start();
   size(600, 800);
  smooth();
  background(myColorBackground);
  colorMode (HSB, 360, 100, 100);
  //Pallette_yS=height-75;
  //Pallette_yE=height-45;
  rectSize=0;
  drawPlatte();

  ControlFont cf1 = new ControlFont(createFont("Dialog", 13));
  title2 = loadFont("ArialNarrow-Bold-48.vlw");
  rectSize=10;
  orientation(PORTRAIT);
  //oscP5 = new OscP5(this, 12007);  
  //remoteLocation = new NetAddress("192.168.1.100", 12007); //(1)
  //d = new Draggable(30, 40, 40, 40);
}
void drawPlatte() {
  img=loadImage("dds2.png");
  info=loadImage("ddsinfo2.png");
  colorload=loadImage("color2.png");
  trigger=true;

  ///
  cp5 = new ControlP5(this);
  //txt = new ControlP5(this);
  //controlP5 = new ControlP5(this);
  cp5.addSlider("h1", 0, 360, h1, hueX, hueY, 200, 30);
  Slider slider1 = (Slider)cp5.controller("h1");
  slider1.setLabel(" Hue");
  cp5.addSlider("s1", 0, 100, s1, satX, hueY, 100, 30);
  Slider slider2 = (Slider)cp5.controller("s1");
  slider2.setLabel(" Saturation");
  cp5.addSlider("b1", 0, 100, b1, satX, hueY+40, 100, 30);
  Slider slider3 = (Slider)cp5.controller("b1");
  slider3.setLabel(" Brightness");
  // By default all controllers are stored inside Tab 'default' 
  // add a second tab with name 'extra'
  fill(0);
  rect(10, hueY+40, 200, 50);
}
void draw() {
  if (trigger) {
    image(img, 0, 0);
    image(colorload, 10, 28+15);
    trigger=false;
  }//  println(mouseX+","+ mouseY);
  noStroke();
  ellipseSize=10+int(random(-4, 5));

  /*
  float delta = PVector.angleBetween(accelerometer, pAccelerometer);
   if (degrees(delta) > 35) {
   shake();
   }
   // storing a reference vector
   pAccelerometer.set(accelerometer);
   */
/*
  float remoteSpeed = dist(px, py, x, y);  //(2)
  //  strokeWeight(remoteSpeed);  //(3)
  float dik=20-remoteSpeed;
  if (dik<1)dik=1;

  line(px, py, x, y);  //(4)
  px = x;  //(5)
  py = y;  //(6)
  ellipse(x, y, ellipseSize, ellipseSize);
*/
  color primary = color (h1, s1, b1);
  fill (primary); //primary color tone
  ellipse(502, 70, 30, 30);
  color fillup = color (h1-random(0, 30), s1-random(0, 30), b1-random(0, 30));
  fill(fillup); //fillup is random color according to primary color 

  if (mousePressed&&mouseY>135) {
    if (menuChoice==0) {

      ellipse(mouseX, mouseY, ellipseSize, ellipseSize);
    }
    else if (menuChoice==1) {
      ellipse(mouseX, mouseY, ellipseSize, ellipseSize);
    }
    else if (menuChoice==2) {
      ellipse(mouseX, mouseY, ellipseSize, ellipseSize);
    }
  }
  if (menuChoice==0) {
    fill(0);
    rect(10, hueY+40, 200, 50);
    textFont(title2, 15 );
    fill(255);
    text("Make a picture using ", 13, 80);
    text(" availabel function.", 13, 100);
  }
  else if (menuChoice==1) {
    fill(0);
    rect(10, hueY+40, 200, 50);
    fill(255);
    textFont(title2, 13 );
    text("Draw a picture of a tree. ", 13, 80);
  }
  else if  (menuChoice==2) {
    fill(0);
    rect(10, hueY+40, 200, 50);
    textFont(title2, 13 );
    fill(255);
    text("Make a picture of how you're feeling,", 15, 80);
    text("using lines, shapes, and colors.", 15, 100);
  }

  /*
  if (mousePressed) {
   
   if (menuChoice==1) {
   rect(mouseX, mouseY, rectSize, rectSize);
   }
   if (menuChoice==0) {
   ellipse(mouseX, mouseY, ellipseSize, ellipseSize);
   }
   }
   */

  //////////////
  /*
  OscMessage myMessage = new OscMessage("AndroidData"); 
  myMessage.add(mouseX); 
  myMessage.add(mouseY);
  // myMessage.add(int(mousePressed));
  oscP5.send(myMessage, remoteLocation);
*/
}

void mousePressed() {
  counter++;
  if (mouseX>415 && mouseX <600 && mouseY >0 &&mouseY<60) {
    image(info, 0, 110);
  }
  if (mouseX>415 && mouseX <468 && mouseY >75 &&mouseY<140) {
    println("1");
    //KetaiAlertDialog.popup(this, "DDS drawing Step1", "Make a picture using availabel function.");
    menuChoice=0;
  }
  if (mouseX>480 && mouseX <525 && mouseY >95 &&mouseY<165) { 
    println("2");
    menuChoice=1;
  }
  if (mouseX>535 && mouseX <590 && mouseY >75 &&mouseY<140) { 
    println("3");
    menuChoice=2;
  }
}
/*
void onAccelerometerEvent(float x, float y, float z)
 { 
 accelerometer.x = x;
 accelerometer.y = y;
 accelerometer.z = z;
 }
 
 void shake() {
 setup();
 }
 */
void mouseReleased() {
} 




