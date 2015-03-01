
//Raven Kwok aka Guo, Ruiwen
//
// OpenCV facedetection
//
// Debasish Biswas & Riken Patel, 2014
//
// Licensed under the Apache License, Version 2.0 (the "License");
//

/**
 * a simple grid dot attractor
 *
 * MOUSE
 * left click, drag  : attract nodes
 *
 * KEYS
 * r                 : reset nodes
 * s                 : save png
**/

import generativedesign.*;
import java.util.Calendar;

import gab.opencv.*;
import processing.video.*;
import java.awt.*;


int xCount = 150;
int yCount = 150;
float gridSizeX = 600;
float gridSizeY = 440;

int f_x,f_y;
int i,j;
float click_width;
float threshold;
int face_width;

Capture video;
OpenCV opencv;

// nodes array 
Node[] myNodes = new Node[xCount*yCount];

// attractor
Attractor myAttractor;

// image output
boolean saveOneFrame = false;

////////////////////
////////////////////

void setup() 
{  
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);// less resolution to read video
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  println(click_width);
  video.start();

  threshold=50;

  //setup drawing parameters//
  //colorMode(RGB);
  smooth();
  noStroke();

  background(255);
 
  //cursor(CROSS);

  // setup node grid
  initGrid();

  // setup attractor
  myAttractor = new Attractor(0, 0);
}


////////////////////
////////////////////

void draw() 
{
/////////////Code for face recognition////////////////////
  //scale(2);
  opencv.loadImage(video);
  imageMode(CORNER);
  //image(video, 0, 0 );     //switches off back video//
  noFill();
  
  Rectangle[] faces = opencv.detect(); //detects faces//
  
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

//////////////////Code for attractor//////////////////
  
  
  //scale(.5);
  fill(255, 50);
  rect(0, 0, width, height);
  
  for (int i = 0; i < 100; i++) 
  {
    float r = random(0, 255);
    fill (r);
  }

  

      myAttractor.x = f_x; //f_x*2; last code for scaling
      myAttractor.y = f_y; //f_y*2; last code
    
      for (int i = 0; i < myNodes.length; i++) 
      {
        if (face_width>threshold) 
        {
          myAttractor.attract(myNodes[i]);
        }
    
        myNodes[i].update();
    
        // draw nodes
        fill(0);
        //fill(random(100, 200),random(100,100),random(100,200)); //changes color of dots
        //fill(random(100, 200),random(100, 100),random(100, 200));
        rect(myNodes[i].x, myNodes[i].y, 1, 1);
      }
    
      // image output
      if (saveOneFrame == true) 
      {
        saveFrame("grid"+timestamp()+".png");
        saveOneFrame = false;
      }
}


///////////////////////////////////////
///////////////////////////////////////

void initGrid() 
    {
      int i = 0; 
      for (int y = 0; y < yCount; y++) 
      {
        for (int x = 0; x < xCount; x++) 
        {
          float xPos = x*(gridSizeX/(xCount-1))+(width-gridSizeX)/2;
          float yPos = y*(gridSizeY/(yCount-1))+(height-gridSizeY)/2;
          fill(255,255,0);
          
          myNodes[i] = new Node(xPos, yPos);
          myNodes[i].setBoundary(0, 0, width, height);//changes the width and height of dots
          myNodes[i].setDamping(0.02);  //// 0.0 - 1.0
          i++;
        }
      }
    }


void mousePressed() 
{
  if (mousePressed && mouseButton == LEFT) //(key=='r' || key=='R') 
  {
    initGrid();
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







// M_4_2_01.pde
// Attractor.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

class Attractor {
  // position
  float x=0, y=0; 

  // radius of impact
  float radius = 200;


  Attractor(float theX, float theY) {
    x = theX;
    y = theY;
  }


  void attract(Node theNode) {
    // calculate distance
    float dx = x - theNode.x;
    float dy = y - theNode.y;
    float d = mag(dx, dy);

    if (d > 0 && d < radius) {
      // calculate force
      float s = d/radius;
      float f = 1 / pow(s, 0.5) - 1;
      f = f / radius;
      
      // apply force to node velocity
      theNode.velocity.x += dx * f;
      theNode.velocity.y += dy * f;
    }
  }

}









