
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/117601*@* */
//
// OpenCV facedetection
//
// Ale González, 2013
// A drawing generator created to show how to implement an efficient perlin noise vector field using lookup tables
//
// Debasish Biswas & Riken Patel, 2014
//
// Licensed under the Apache License, Version 2.0 (the "License");
//

/**
 * a simple face controlled Depth drawing 
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
int face_width;
int i,j;
float click_width;
float threshold;

Capture video;
OpenCV opencv;

// image output
boolean saveOneFrame = false;

boolean onPressed;

final int 
  WIDTH   = 640,
  HEIGHT  = 480,
  MAX_AGE = 70,
  STEPS = 900,
  FILL = #000000,
  STROKE = #FFFFFF,
  ALFA = 50,
  BACKGROUND = #EEEEEE;

final float 
  SMOOTHNESS = .0005;

PVector[] DIRECTIONS;
int[][] INDICES;
ArrayList<Particle> particles;

PGraphics bg;

///////////////////////////////////////
///////////////////////////////////////

void setup() 
{
    size(640, 480);
    smooth();
    frameRate(30);
    colorMode(RGB);
    fill(FILL, ALFA);
    stroke(STROKE, ALFA);
    
    video = new Capture(this, 640/2, 480/2);
    opencv = new OpenCV(this, 640/2, 480/2);// less resolution to read video
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
    println(click_width);
    video.start();
    
    //Create a fancy degraded background
    reset();
    
    //LUT to store the indices associated with the vector field
    INDICES = new int[WIDTH][HEIGHT];
    for (int y = 0; y < HEIGHT; y++) for (int x = 0; x < WIDTH; x++) 
        INDICES[x][y] = int(noise(x*SMOOTHNESS, y*SMOOTHNESS)*STEPS); 

    //LUT to store the directions associated with the vector field
    DIRECTIONS = new PVector[STEPS];
    for (int i = 0; i < STEPS; i++) 
        DIRECTIONS[i] = new PVector(cos(i*.5)*.1, sin(i*.5)*.1);  
    
    //Particles
    particles = new ArrayList<Particle>();
}
 
void reset(){
    loadPixels();
    for (int i=0; i<WIDTH*HEIGHT; i++) 
        pixels[i] = (0xFF - floor(dist(i%WIDTH, i/HEIGHT, WIDTH/2, HEIGHT/2)*.25)) * 0x01010101;
    updatePixels();
} 
 
///////////////////////////////////////
/////////////////////////////////////// 

void draw()
{
  /////////////////////Code for face detection/////////////////////////////////
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
  
///////////////////////////code for trees/////////////////////////////
  
if(onPressed) 
    particles.add(new Particle(new PVector(f_x, f_y)));   
    
for(int i = 0; i < particles.size(); i++) 
    {
    Particle p = particles.get(i);
    if (p.isDead() == false) 
    {
        p.update();
        p.draw();
    }
    else 
        particles.remove(i);
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
      saveFrame("depth"+timestamp()+".png");
      saveOneFrame = false;
    }
}

///////////////////////////////////////
/////////////////////////////////////// 

void mousePressed()
{ 
  if (mousePressed && mouseButton == LEFT) //(key=='r' || key=='R') 
  {
    reset();
  }

  if (mousePressed && mouseButton == RIGHT) //(key=='s' || key=='S') 
  {
    saveOneFrame = true;
  }  
}

class Particle
{   
  PVector pos, vel;
  int age, x, y;
    
  public Particle(PVector p)
  {
    pos = p;
    vel = new PVector();
    age = MAX_AGE;
  }
   
  boolean isDead() { return age==0; }   
  void draw() {  ellipse(pos.x, pos.y, age, age); }      
  void update() 
  { 
    age--;
    vel.add(DIRECTIONS[INDICES[(int(pos.x)+WIDTH)%WIDTH][(int(pos.y)+HEIGHT)%HEIGHT]]);
    pos.add(vel);
  }  
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

void captureEvent(Capture c) 
{
  c.read();
}

//Giving style to the canvas
//parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: none; padding: 0; box-shadow: 0 0 5px #000; margin: 10px 0;");


