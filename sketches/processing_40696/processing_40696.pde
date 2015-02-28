
/* THUY LINH DO 
ASSIGNMENT 4 CREATION & COMPUTATION
OCAD UNIVERSITY FALL 2011 */

import processing.video.*;
Capture video;
color trackColor; 
void setup()
{
  size(534, 400);
  video = new Capture(this,width,height,30);
  // Start off tracking for red
  trackColor = color(255,0,0);
  smooth();
  frameRate(30);
}

void draw() {
  
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);
  float worldRecord = 500;   
  int closestX = 0;
  int closestY = 0;  
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);  
      float d = dist(r1,g1,b1,r2,g2,b2);
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }    
    }
  }

  if (worldRecord < 10) { 
    // Draw a circle at the tracked pixel
    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX,closestY,16,16);
  }
  
strokeWeight (3);
//ROBOT HEAD
//coloring the head
stroke(174,223,228); 
fill(174,223,228);
rect (closestX-60,closestY-150,120,120);
rect (closestX-80,closestY-130,160,80); 
//antennae
stroke(0);
line (closestX, closestY-150, closestX-10, closestY-170);
line (closestX, closestY-150, closestX+10, closestY-170);
//head border lines
line (closestX-60, closestY-150, closestX+60, closestY-150);
line (closestX-60, closestY-30, closestX+60, closestY-30);
line (closestX-80, closestY-130, closestX-80, closestY-50);
line (closestX+80, closestY-130, closestX+80, closestY-50);
//head's corners
ellipseMode(CORNER);
arc(closestX-80, closestY-150, 40, 40, PI, TWO_PI-PI/2);
arc(closestX+40, closestY-150, 40, 40, TWO_PI-PI/2, TWO_PI);
arc(closestX+40, closestY-70, 40, 40, 0, PI/2);
arc(closestX-80, closestY-70, 40, 40, PI/2, PI);
//eyes
ellipseMode(CENTER);
fill(0);
ellipse(closestX-45,closestY-120,10,10);
ellipse(closestX+45,closestY-120,10,10);
//blush
ellipseMode(CENTER);
stroke(247,165,170);
fill(247,165,170); 
ellipse(closestX-50,closestY-100,10,10);
ellipse(closestX+50,closestY-100,10,10);
//mouth
stroke(0); 
line (closestX-20, closestY-100, closestX+20, closestY-100);

//ROBOT BODY
fill(174,223,228);
rect (closestX-25,closestY-30,50,50);
//button
ellipse (closestX,closestY-5,30,30);
line (closestX-5, closestY-10, closestX-5, closestY);
line (closestX+5, closestY-10, closestX+5, closestY);
//hands
line (closestX-25, closestY-30, closestX-35, closestY+5);
line (closestX+25, closestY-30, closestX+35, closestY+5);
//legs
line (closestX-15, closestY+20, closestX-15, closestY+45);
line (closestX+15, closestY+20, closestX+15, closestY+45);
}

void mousePressed() {
//say hello
println("Where is this place?!I'm scared!");
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}



