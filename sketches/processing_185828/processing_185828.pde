
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2363*@* */
// Gravity Swarm
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico
//
// OpenCV facedetection
//
// Debasish Biswas & Riken Patel, 2014
//
// Licensed under the Apache License, Version 2.0 (the "License");
//

/**
 * a simple face controlled Grass drawing 
 *
 * WEBCAM
 * facedetection  : draw nodes
 *
 * KEYS
 * r                 : reset nodes
 * s                 : save png
 **/

import java.util.Calendar;

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

int f_x,f_y;
int i,j;
float click_width;
float threshold;
int face_width;
boolean onPressed;

Capture video;
OpenCV opencv;

// image output
boolean saveOneFrame = false;

particle[] Z = new particle[10000];
float colour = random(1);

///////////////////////////////////////
///////////////////////////////////////

void setup() {
  smooth();
  size(640,480,P2D);  
  background(255);
  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);// less resolution to read video
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  println(click_width);
  video.start();

  threshold=50;
  
  for(int i = 0; i < Z.length; i++) {
    Z[i] = new particle( random(width), random(height), 0, 0, 1 );
  }
  
  frameRate(30);
  colorMode(RGB,255);

}

///////////////////////////////////////
/////////////////////////////////////// 

void draw() 
{
  /////////////////////////////Code for face detection////////////////////////////
  //scale(2);
    opencv.loadImage(video);
    imageMode(CORNER);
  //image(video, 0, 0 ); //switches off back video
    noFill();

  Rectangle[] faces = opencv.detect(); // detects faces
  
  if(faces.length>0)
  {
    i=0;
    
    println(faces[i].width + "," + faces[i].height);
    rectMode(CORNER);
    //stroke(10, 10, 10, 50); // hides the rect box
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    f_x= width- 2*((faces[i].x+faces[i].width/2));
    f_y= 2*(faces[i].y+faces[i].height/2);
    face_width=  faces[i].width;
    //ellipseMode(CENTER); 
    //ellipse(f_x,f_y,10,10);
  }
  
  else
  {
    face_width=0;
  }

///////////////////////////////code for swarm///////////////////////////////////////
  
  //filter(INVERT);

  float r;

  //stroke(0);
  //fill(0);// does amazing effect
  //rect(0,0,width,height);
  
  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) 
  {
    if( onPressed ) 
    {
      Z[i].gravitate( new particle( f_x, f_y, 0, 0, 1 ) );
    }
    else 
    {
      Z[i].repel( new particle( f_x, f_y, 0, 0, 1 ) );
    }
//    else 
//    {
//      Z[i].deteriorate();
//    }
    Z[i].update();
    r = float(i)/Z.length;
    stroke( colour, pow(r,0.1), 1-r, 0.15 );
    Z[i].display();
  }
  
   if(face_width > threshold)
    {
      onPressed = true;
    }
    else
    {
      onPressed = false;
    }
    
  colorMode(RGB,255);
  
  colour+=random(0.01);
  if( colour > 1 ) 
  { 
    colour = colour%1;
  }

  //filter(INVERT);
  
 // image output
  if (saveOneFrame == true) 
  {
    saveFrame("grass"+timestamp()+".jpg");
    saveOneFrame = false;
  }
  
}

///////////////////////////////////////
///////////////////////////////////////

void mousePressed() 
{
   if (mousePressed && mouseButton == LEFT) //(key == 'r') 
  {
   
    background(255);
  }
  
   if (mousePressed && mouseButton == RIGHT)//(key=='s' || key=='S') 
  {
    saveOneFrame = true;
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

void captureEvent(Capture c) 
{
  c.read();
}



class particle {
  
  float x;
  float y;
  float px;
  float py;
  float magnitude;
  float angle;
  float mass;
  
  particle( float dx, float dy, float V, float A, float M ) {
    x = dx;
    y = dy;
    px = dx;
    py = dy;
    magnitude = V;
    angle = A;
    mass = M;
  }
  
  void reset( float dx, float dy, float V, float A, float M ) {
    x = dx;
    y = dy;
    px = dx;
    py = dy;
    magnitude = V;
    angle = A;
    mass = M;
  }
  
  void gravitate( particle Z ) {
    float F, mX, mY, A;
    if( sq( x - Z.x ) + sq( y - Z.y ) != 0 ) {
      F = mass * Z.mass;
      mX = ( mass * x + Z.mass * Z.x ) / ( mass + Z.mass );
      mY = ( mass * y + Z.mass * Z.y ) / ( mass + Z.mass );
      A = findAngle( mX - x, mY - y );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = findAngle( mX, mY );
    }
  }

  void repel( particle Z ) {
    float F, mX, mY, A;
    if( sq( x - Z.x ) + sq( y - Z.y ) != 0 ) {
      F = (mass * Z.mass);
      mX = ( mass * x + Z.mass * Z.x ) / ( mass + Z.mass );
      mY = ( mass * y + Z.mass * Z.y ) / ( mass + Z.mass );
      A = findAngle( x - mX, y - mY );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = findAngle( mX, mY );
    }
  }
  
  void deteriorate() {
    magnitude *= 0.925;
  }
  
  void update() {
    
    x += magnitude * cos(angle);
    y += magnitude * sin(angle);
    
  }
  
  void display() {
    line(px,py,x,y);
    px = x;
    py = y;
  }
  
  
}

float findAngle( float x, float y ) {
  float theta;
  if(x == 0) {
    if(y > 0) {
      theta = HALF_PI;
    }
    else if(y < 0) {
      theta = 3*HALF_PI;
    }
    else {
      theta = 0;
    }
  }
  else {
    theta = atan( y / x );
    if(( x < 0 ) && ( y >= 0 )) { theta += PI; }
    if(( x < 0 ) && ( y < 0 )) { theta -= PI; }
  }
  return theta;
}
 


