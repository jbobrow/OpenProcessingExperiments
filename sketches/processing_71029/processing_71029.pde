
/*****************************************
* Assignment 2
 * Name:        Emily Chang
 * E-mail:      echang@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:   9/19/2012
 *
 *This sketch illustrates a night sky over a field. Pressing any
 *key creates a background that changes the color of the grass 
 *and position of the moon. Clicking in different areas of the 
 *sky draws clouds with various transparencies, stars of
 *different colors, and blimps of slightly different shapes and 
 *sizes.
***********************************************/
    void setup() {
    size (500, 500);
    smooth();
  }
  void draw() 
  {
  }
  void mousePressed() {
    
    //draw clouds
    if (mouseY < 100) {
      strokeWeight(0);
      fill(200, random(100, 255));
      ellipse (mouseX, mouseY, 75, 25);
      
    //draw stars
    } else if (mouseY < 250 && mouseY > 150) {
      fill(random(150, 255), random (200, 215), 0);
      ellipse(mouseX, mouseY, 7, 7);
      
    //draw blimps
    }else if (mouseY < 325 && mouseY > 275) {
      strokeWeight(0);
      fill(255);
      triangle (mouseX-10,mouseY, mouseX-15, mouseY+5, mouseX-15,mouseY-5);
      ellipse (mouseX, mouseY, random(25, 30), random(10, 15));
    }
  }
  
  void keyPressed() {
     drawBackground();
  }
  void drawBackground() {
    
    //draw night sky
    background(0, 0, random(0, 90));
    
    //draw moon
    fill(255);
    ellipse (random(500), random(75), 75, 75);
    
    //draw field
    fill(0, 75, 0);
    ellipse (250, 500, 700, 200);
    
    //draw blades of grass in foreground
    float x = 10;
    
    while (x <= width) {
      fill(0, random(25,125), 0);
      triangle (0,500, 10,500, 5,440);
      triangle (x,500, x+15,500, x+7,random(440, 450));
      
      x = x + 5;
    }
    }
