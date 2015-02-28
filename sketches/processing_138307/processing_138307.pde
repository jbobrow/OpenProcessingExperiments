

//
// Play with shapes and colors on a flat plane with 3D rendering.
// How easy to trick our eyes, a lesson to learn: do not thrust your visual organs
// but enjoy the pleasure they sense.....
//
// 25 Feb 2014 
// This source code is based on
// http://abandonedart.org/?p=205
// I shoud give credit to 
// http://www.zenbullets.com
//
// As its original code
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give  a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
//
// This program creates a 3D panel and draws some shapes on it.
// buy clicking on the b, p and r keys from the keyboard
// you could change the type of shape it draws
// b for box (3D)
// r for rectangle (2D)
// p for sphere (3D)

// To start drawing, you must click on the canvas initially
// you can change the drawing color by pressing 1, 2, 3.
// When you want to clear the canvas and re - draw, click on DEL or BACKSPACE
// this will also update margin value and casue different number of shapes to be drawn.
// s or S keys save the canvas as an image into your disk..




//================================= global vars

boolean bx = true;
boolean sp = false;
boolean rt = false;
boolean mc = false;
float boxSize = 20;
float margin = 105;

color strokeColor = color(0, 92, 90);

//================================= init

void setup() {
  size(800, 600, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(25);
  noStroke();
}


void clearBackground() {
  background(0);
}

//================================= frame loop


void draw() {
  clearBackground();
  //first click on the canvas
  if (!mc)
  {
    text("click anywhere!", 10, 30);
    return;
  }

  // Center and spin grid
  translate(width/2, height/2, 0);
  rotateY(mouseX * 0.001);
  rotateX(mouseY * 0.001);
  stroke(strokeColor);
  // Build grid using multiple translations 
  for (float i =- height+margin; i <= height-margin; i += margin) {
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += margin) {
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += margin) {
        pushMatrix();

        translate(k, j, i);
        fill(15, 35);
        if (bx)
          box(boxSize, boxSize, boxSize);
        if (sp)
          sphere(boxSize);
        if (rt)
          rect(boxSize, boxSize, 50, 50);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}

void mousePressed() {
  mc = true;
}

void keyPressed() {
  if (key == DELETE || key == BACKSPACE) {
    margin = random(100, 200);
    mc = false;
    background(360);
  }
  if (key == 's' || key == 'S') saveFrame("screenshot.png"); 

  switch(key) {
  case '1':
    strokeColor = color(200, 20);
    break;
  case '2':
    strokeColor = color(92, 100, 64, 40);
    break;
  case '3':
    strokeColor = color(352, 100, 71, 50);
    break;    
  case 'b':
    updateShape();
    bx = true;
    break;
  case 'p':
    updateShape();
    sp = true;
    break; 
  case 'r':
    updateShape();
    rt = true;
    break;
  }
}

void  updateShape() {
  bx = false;
  sp = false;
  rt = false;
}
