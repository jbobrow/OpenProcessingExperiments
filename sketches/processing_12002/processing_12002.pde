

//created by prashanta
import ddf.minim.*;
import processing.pdf.*;
import processing.video.*;

PImage bg;

Minim minim;
AudioPlayer myPlayer;
Movie myMovie;

// change coordinate system
int xaxis;
int yaxis;
float t= 3.8;          // starting time
float dt=0.03;        //time increase
float xscaling = .75; // use same scale for x axis!!!!
float yscaling = 1.0; // use same scale for y axis!!!! 
float r = 5;

float xhip,     // hip variables
      yhip;

float xrknee;   // right knee variables
float yrknee;

float xrfoot;   // right knee variables
float yrfoot;

float xneck;    // neck variables
float yneck;

float xlknee;
float ylknee;   // left knee variables 

float xlfoot;  
float ylfoot;   // left foot variables

float xrelbow;
float yrelbow;  // right elbow variables

float xlelbow;
float ylelbow;  // left elbow variables

float xhead;
float yhead;    // head variables

float xrhand;
float yrhand;   // right hand variables

float xlhand;
float ylhand;   // left hand variables

float legsize = 15; // leg variable


//set up the stage for some action
void setup(){
  size(720,606);
  bg = loadImage("climb.jpg"); 
  strokeWeight(10.0*xscaling);
  stroke(0,150); 
  //beginRecord(PDF,"everything.pdf");
  minim = new Minim(this);
  myPlayer = minim.loadFile("groove.mp3");
  myPlayer.loop();
  background(100,200);
  smooth();
  frameRate(27);    //change frame Rate as per your need
  noLoop();
  

  xaxis = width*5/10;
  yaxis = height * 70/100 ;
  
  // set all the points before moving
  xhip = xaxis +15;
  yhip = yaxis;
  xrknee = xaxis + xscaling * 59.8; // starting value(from chart);
  yrknee = yaxis - yscaling * 7.66; // starting value(from chart);
  xrfoot = xaxis + xscaling * 54.7;
  yrfoot = yaxis + yscaling * 53.8;
  xneck = xaxis + xscaling * 7.81;
  yneck = yaxis - yscaling * 85.76;
  xlknee = xaxis - xscaling * 28.23;
  ylknee = yaxis - yscaling * 35.95;
  xrfoot = xaxis - xscaling * 45.03;
  yrfoot = yaxis - yscaling * 73.23;  
  xrelbow = xaxis + xscaling * 31.96;
  yrelbow = yaxis - yscaling * 98.92;
  xlelbow = xaxis - xscaling * 6.53;
  ylelbow = yaxis - yscaling * 94.2;  
  xhead = xaxis + xscaling * 9.03;
  yhead = yaxis - yscaling * 110;
  xrhand = xaxis + xscaling * 21.64;
  yrhand = yaxis - yscaling * 137.3; 
  xlhand = xaxis + xscaling * 24.54;
  ylhand = yaxis - yscaling * 131.6;
}

// loop begins here
void draw(){
  background(bg);
//  fill(80,100);
//  rect(0, 0, width, height);
//  fill(0, 100, 200);
  if ( t >= 3.8 && t <= 18.8) {
   t= t +dt;
  } else {
    t= 3.8;
  }
  headMotion(t);
  hipMotion(t);
  rightKneeMotion(t);
  rightFootMotion(t);
  neckMotion(t);
  leftKneeMotion(t);
  leftFootMotion(t);
  rightElbowMotion(t);
  leftElbowMotion(t);
  rightHandMotion(t);
  leftHandMotion(t);

  line(xhip,yhip,xrknee,yrknee);     //hip to right knee 
  line(xrknee,yrknee,xrfoot,yrfoot); //right knee to right foot
  line(xneck,yneck,xhip,yhip);       // neck to hip
  line(xhip,yhip,xlknee,ylknee);     // hip to left knee
  line(xlknee,ylknee,xlfoot,ylfoot); // left knee to left foot
  line(xneck,yneck,xrelbow,yrelbow); // neck to right elbow
  line(xneck,yneck,xlelbow,ylelbow); // neck to right elbow
  line(xhead,yhead,xneck,yneck);     // head to neck
  line(xrelbow,yrelbow,xrhand,yrhand);// right elbow to right hand 
  line(xlelbow,ylelbow,xlhand,ylhand); // left elbow to left hand
  
  //right foot
  line(xrfoot, yrfoot, xrfoot + legsize * leg(xrfoot-xrknee,-yrfoot+yrknee)[0], yrfoot - legsize * leg(xrfoot-xrknee,-yrfoot+yrknee)[1]);
  
  //left foot
  if (xlfoot < xhip){
    line(xlfoot, ylfoot, xlfoot + legsize * leg(xlfoot-xlknee,ylfoot-ylknee)[0], ylfoot - legsize * leg(xlfoot-xlknee,ylfoot-ylknee)[1]);
  }else {
    line(xlfoot, ylfoot, xlfoot + legsize * leg(xlfoot-xlknee,-ylfoot+ylknee)[0], ylfoot - legsize * leg(xlfoot-xlknee,-ylfoot+ylknee)[1]);
  }
  

  
  // t = map( mouseX, 0, width, 3.8, 18.8);
//  noFill();
//  stroke(255);
//  beginShape();
//  curveVertex(xneck, yneck); // the first control point
//  curveVertex(xneck -10 , yneck); // is also the start point of curve
//  curveVertex(xlelbow , ylelbow + 5 );
//  curveVertex(xlhand +5 , ylhand - 5);
//  curveVertex(xlelbow , ylelbow + 5);
//  curveVertex(xhip, yhip); // the last point of curve
//  curveVertex(xhip , yhip); // is also the last control point
//  endShape();
}

// motion of the hip
void hipMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.2, 5.6, 6.6, 8, 8.8, 10.9, 12.4, 14.1, 17.6, 18.4, 19};
  float[] xslopes={63.0, 0.93, -27.9, -15, 34, 10, -15.6, 29.3, -28.1, 57.9, 26.1};
  x= xaxis + xscaling*( 15 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = { 3.8, 4.2, 4.9, 5.9, 9.2, 9.8, 13.0, 13.81, 16.1, 17.6, 18.8};
  float[] yslopes= { 57.8,0, 62.26, 9.76, 64, 0, 115.25, 4.27, 60.65, 44.33};
  
  y = yaxis-yscaling * cumsum(ytimes,yslopes,t);   //consider scaling
  xhip = x;
  yhip = y;
  ellipse(xhip, yhip,r ,r);
  //print(y);
}

void rightKneeMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.9, 7.5, 8.4, 9.6, 11, 12, 12.6, 14, 15.3, 15.9, 17, 17.5, 18.4, 18.9, 19};
  float[] xslopes={18.56, -5.1, 78, 7.94, 5.14, -7.2, -30.9, 24.3, -21.3, 9.5, -46, 25.8, -37.2, 10, -40.4};
  x= xaxis + xscaling * (59.8 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = { 3.8, 5.9, 7.8, 8.3, 10, 11.9, 12.4, 13.7, 16, 17.1, 17.5, 18.1, 19};
  float[] yslopes= { 9.5, 0, 164.15, 16.64, -3.67, 125.4, 22.15, -6.34, 117.72, -42.75, 97.54, 0};
  
  y = yaxis-yscaling * (7.66 + cumsum(ytimes,yslopes,t));   //consider scaling
  xrknee=x;
  yrknee=y;
  ellipse(xrknee, yrknee,r ,r);
  //print(y);
}

void rightFootMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 7.4, 8.3, 12, 12.7, 16.1, 17.5, 17.7, 17.9, 18.1, 19};
  float[] xslopes={1.92, 135.3, 0, -29.1, 0, -67.9, 70.83, -51.95, 28.5, -16.14};
  x= xaxis + xscaling*(54.7 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 7.6, 8.4, 12, 12.4, 16, 17.1, 17.4, 18, 19 };
  float[] yslopes= {3.8, 167.3, 0, 149.5, 0, 115.28, -38.2, 89.3, 0};
  
  y = yaxis+ yscaling*(53.8 -  cumsum(ytimes,yslopes,t));   //consider scaling
  xrfoot=x;
  yrfoot=y;
  ellipse(xrfoot, yrfoot,r ,r);
  //print(y);
}

void neckMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.9, 6.3, 8.2, 10.3, 11, 11.9, 12.2, 12.9, 14, 15.1, 16, 17, 17.1, 17.6, 18.1, 18.4, 19};
  float[] xslopes={14.12, 16.9, -7.12, 20.83, -10.3, 0, -14.4, 34.21, 0, -27.03, 17.98, -19.34, 41.94, -49.65, 37, -37,0};
  x= xaxis + xscaling*(0 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 4.1, 5.1, 5.9, 7.5, 8.2, 8.8, 9.7, 11.1, 12.9, 13.8, 16, 17, 19};
  float[] yslopes= {54.73, 0, 66.17, 5.26, 27.74, 0, 49.88, 9.84, -7.43, 84.79, 5.98, 85.23,0};
  
  y = yaxis- yscaling*(85.76 + cumsum(ytimes,yslopes,t));   //consider scaling
  xneck=x;
  yneck=y;
  ellipse(xneck, yneck,r ,r);
  //print(y);
}

void leftKneeMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.3, 4.8, 5.6, 6.1, 6.4, 7.3, 9.1, 11.4, 11.7, 13.5, 14.2, 15.1, 15.6, 16.5, 17.6, 18.1, 19};
  float[] xslopes={22.9, 10.6, 0 , 54.8, -16.7, 85.1, 13.92, -8.83, 43.3, -10, 22.5, -44.9, 31.4, 0, -25.2, 36.7, -42.7};
  x= xaxis + xscaling * (-28.23 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = { 3.8, 4.1, 6.1, 6.8, 10.6, 11.2, 12.5, 13.8, 14.5, 15.3, 18, 19};
  float[] yslopes= {135.7, 7.97, 130.9, 0, 90, 0, 30.2, -19.25, 96, 0, 82.6};
  
  y = yaxis+yscaling * (35.95 - cumsum(ytimes,yslopes,t));   //consider scaling
  xlknee=x;
  ylknee=y;
  ellipse(xlknee, ylknee,r ,r);
  //print(y);
}

void leftFootMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.1, 4.5, 4.8, 6.1, 7.2, 7.8, 10.6, 10.8, 11.5, 11.6, 14.6, 15.5, 17.2, 17.6, 18.3, 19};
  float[] xslopes={110.1, 0, 54.37, -6.69, 82, -19.3, 0, 133, 0, 85.1, 0, -71, -2.15, -17.9, 36, -70.8};
  x= xaxis + xscaling*(-45.0 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 4.2, 6.1, 6.8, 10.7, 11.2, 14.5, 15.3, 17.9, 18.9 };
  float[] yslopes= {68.16, 5.83, 146.1, 0, 137.9, 4.29, 95.97, 0, 77.7};
  
  y = yaxis+ yscaling*(73.23 -  cumsum(ytimes,yslopes,t));   //consider scaling
  xlfoot=x;
  ylfoot=y;
  ellipse(xlfoot, ylfoot,r ,r);
  //print(y);
}

void rightElbowMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4, 5.2, 5.7, 8.3, 10.3, 10.9, 11.1, 11.9, 12.9, 13.3, 13.8, 14.8, 16.3, 16.9, 17.1, 17.7, 18, 19};
  float[] xslopes={32.7, 0, 70.9, 0, 13.29, 0, -50.7, 0, 5.64, 88.4, -65.5, -12.05, 10.59, -22.86, 42, -35.23, 38.6, -8.73};
  x= xaxis + 1.5* xscaling*(31.96 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = { 3.8, 4.1, 5, 5.9, 10.8, 11.1, 13.2, 13.7, 16.5, 17.3, 19};
  float[] yslopes= { 51, 0, 104, 3.83, 75.6, 0, 231.6, 0, 131.63, 0};
  
  y = yaxis-yscaling* (98.82 + cumsum(ytimes,yslopes,t));   //consider scaling
  xrelbow = x;
  yrelbow = y;
  ellipse(xrelbow, yrelbow,r ,r);
  //print(y);
}

void leftElbowMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 5.5, 7.4, 8.3, 9.8, 12.6, 14.1, 14.7, 15.2, 15.7, 17, 17.4, 17.7, 18.1, 19};
  float[] xslopes={0, 8.61, -8.747, 47.67, 0, 10.37, -35.7, 0 , 31.24, -39, 0, 68.7, -23.2, 0 };
  x= xaxis + 1.5* xscaling*(-15 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 7.7, 8.5, 9.6, 13.1, 13.4, 16, 16.5, 19};
  float[] yslopes= { 5.5, 28.6, 117.6, 0, 66.7, 2.2, 211.3, 0};
  
  y = yaxis-yscaling* (94.2 + cumsum(ytimes,yslopes,t));   //consider scaling
  xlelbow = x;
  ylelbow = y;
  ellipse(xlelbow, ylelbow,r ,r);
  //print(y);
}

void headMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.6, 5.0, 6.8, 7.5, 8.6, 10.5, 11.1, 12, 12.1, 13.1, 14.9, 16.5, 17.1, 17.7, 18, 19};
  float[] xslopes={20, -14.3, 16.3, 0, -19.6, 31, -26.6, 0, -102.3, 24.3, -20.9, 16.3, -38.5, -28, 50.4, -10.2};
  x= xaxis + xscaling*(2 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 4, 5, 5.9, 7.4, 9.6, 12.8,  13.8, 16.3, 16.6, 19};
  float[] yslopes= { 69.8, 0, 73.28, 0, 31.03, 1.88, 80.82, 7.53, 150.3, 0};
  
  y = yaxis-yscaling* (110 + cumsum(ytimes,yslopes,t));   //consider scaling
  xhead = x;
  yhead = y;
  fill(0,150);
  ellipse(xhead, yhead,5*r ,5*r);
  //print(y);
}

void rightHandMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 5.3, 5.9, 13.1, 13.2, 13.7, 16.9, 17.6,18.2, 19};
  float[] xslopes={0, 109.1, 0, 410.2, -83.31, 0, -47.84, 40.5, 0};
  x= xaxis + 1.5 * xscaling*(21.64 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 5.3, 5.8, 13.1, 13.7, 19 };
  float[] yslopes= {0, 236.6, 0, 242.5, 0};
  
  y = yaxis- yscaling*(137.3 +  cumsum(ytimes,yslopes,t));   //consider scaling
  xrhand=x;
  yrhand=y;
  ellipse(xrhand, yrhand,r ,r);
  //print(y);
}

void leftHandMotion(float t) {
  float x;
  float y;
  ///////////////////////////////////////////
  // define the x times parametrically, piecewise with linear approximations
  float[] xtimes={3.8, 4.1, 5, 8, 8.6, 9.6, 14.6, 14.8, 15.1, 16.2, 16.3, 16.5, 17.9, 18.1, 19 };
  float[] xslopes={-12.5, 0, -6.63, 0, 104, 0, -70, 38.33, 0, -433.9, 70.5, -21.81, 34.95, 0};
  x= xaxis + 1.5 * xscaling*(24.54 + cumsum(xtimes, xslopes,t));  //consider scaling
  
  // define the y times parametrically, piecewise with linear approximations
  float[] ytimes = {3.8, 8.8, 9.6, 15.9, 16.4, 19.1};
  float[] yslopes= {0, 213.2, 0, 191.1, 0};
  
  y = yaxis- yscaling*(131.6 +  cumsum(ytimes,yslopes,t));   //consider scaling
  xlhand=x;
  ylhand=y;
  ellipse(xlhand, ylhand,r ,r);
  //print(y);
}

// start motion at mouse press
void mousePressed(){
  loop(); 
}

// performs cumulative sum for a piecewise, linear curve
float cumsum(float[] time, float[] slop, float t){
  float sum = 0;
  int index = 0;
  // find the location of the time
  for (int i=0; i < time.length-1; i++) {
    if( time[i]< t && t<= time[i+1]) {
      index = i;
    }   
  }
  // find the sum 
  for (int i=0; i<= index; i++){
    if ( i < index){
    sum = sum + (time[i+1]-time[i])*slop[i];
    }
    if ( i == index){
    sum = sum + (t - time[i])*slop[i];
    }
  }
  return sum;
}

float[] leg(float xslope, float yslope){
  float normalization = sqrt(xslope*xslope+yslope*yslope);
  float[] perp = {-yslope/normalization, xslope/normalization}; 
  return perp; 
}

void keyPressed() {
  if (key == 'q'){
    endRecord();
    exit();
  }
}

void stop()
{
  myPlayer.close();
  minim.stop();
  super.stop();
}


