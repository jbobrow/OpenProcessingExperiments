
//Raven Kwok aka Guo, Ruiwen
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

ArrayList<Particle> pts;
boolean onPressed, showInstruction;
PFont f;

int f_x,f_y;
int face_width;
int i,j;
float click_width;
float threshold;

Capture video;
OpenCV opencv;

// image output
boolean saveOneFrame = false;

///////////////////////////////////////
///////////////////////////////////////
 
void setup() 
{
  size(640, 480);
  smooth();
  frameRate(30);
  colorMode(RGB);
  //rectMode(CENTER);
  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);// less resolution to read video
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  println(click_width);
  video.start();
 
  pts = new ArrayList<Particle>();
  threshold=50;
 
  //showInstruction = true;
  //f = createFont("Calibri", 24, true);
 
  background(255);
}

///////////////////////////////////////
/////////////////////////////////////// 

void draw() 
{
  ///////////////////Code for face detection////////////////////////////////////////
  //scale(2);
  opencv.loadImage(video);
  imageMode(CORNER);
  //image(video, 0, 0 ); //switches off back video
  //noFill();
  //strokeWeight(1);
  
  Rectangle[] faces = opencv.detect(); // detects faces
  
      if(faces.length>0)
      {
        i=0;
        
        println(faces[i].width + "," + faces[i].height);
        rectMode(CORNER);
        //stroke(0, 0, 0);
        //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
        f_x= width-(2*(faces[i].x+faces[i].width/2));
        f_y= 2*(faces[i].y+faces[i].height/2);
        face_width=  faces[i].width;
        
        //ellipseMode(CENTER); 
        //ellipse(f_x,f_y,10,10);
      }
      else
      {
        face_width=0;
      }
  
   //////////////////////code for trees//////////////////////////////////

 
     if (onPressed) 
     {
        for (int i=0;i<10;i++) 
        {
          Particle newP = new Particle(f_x, f_y, i+pts.size(), i+pts.size());
          pts.add(newP);
        }
     }
 
    for (int i=0; i<pts.size(); i++) 
    {
      Particle p = pts.get(i);
      p.update();
      p.display();
    }
 
    for (int i=pts.size()-1; i>-1; i--)
    {
      Particle p = pts.get(i);
      if (p.dead) 
      {
        pts.remove(i);
      }
    }
    
    if(face_width > threshold)
    {
      onPressed = true;
    }
    else
    {
      onPressed = false;
    }
    
   // image output
    if (saveOneFrame == true) 
    {
      saveFrame("grass"+timestamp()+".png");
      saveOneFrame = false;
    }
 
}

///////////////////////////////////////
///////////////////////////////////////


void mousePressed()  //keypressed()  // for using keyboard
{
  if (mousePressed && mouseButton == LEFT) //(key == 'r') 
  {
    for (int i=pts.size()-1; i>-1; i--) 
    {
      Particle p = pts.get(i);
      pts.remove(i);
    }
    background(255);
  }
  
   if (mousePressed && mouseButton == RIGHT)//(key=='s' || key=='S') 
  {
    saveOneFrame = true;
  }
}

class Particle
{
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  color c;
   
  Particle(float x, float y, float xOffset, float yOffset){
    loc = new PVector(x,y);
     
    float randDegrees = random(60);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));
     
    acc = new PVector(0,0);
    lifeSpan = int(random(10, 40));
    decay = random(0.75, 0.9);
    c = color(random(100,255),random(100,255), random(100));
    weightRange = random(3,20);
     
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
   
  void update(){
    if(passedLife>=lifeSpan){
      dead = true;
    }else{
      passedLife++;
    }
     
    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;
     
    acc.set(0,0);
     
    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn),sin(rn));
    acc.add(dir);
    acc.mult(mag);
     
    float randDegrees = random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);
     
    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }
   
  void display(){
    strokeWeight(weight+4);
    stroke(2, alpha);
    point(loc.x, loc.y);
     
    strokeWeight(weight);
    stroke(c);
    point(loc.x, loc.y);
    
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

void captureEvent(Capture c) 
{
  c.read();
}


