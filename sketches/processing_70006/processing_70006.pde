
// Dan Sztanga
// dsztanga@gmail.com
// (C) 2012 Dan Sztanga. All rights reserved.
// HW_4 User Input_2

//  Controls_
//
//  Mouse_ moves arc
//  Left Mouse Button_ changes color and size of arc
//  Space_ changes background color
//
//  Experiment with dragging the mouse around

float x, y ,wd, ht, theta, angdelta;
color col, col2;

void setup(){
  smooth();
  size(1000, 500);
  col2 = color(random(255));
  background(col2);
  noCursor();
  x = 0;
  y = height*.5;
  wd = random(50, 200);
  ht = wd;
  col = color(random(225), random(50, 200));
  mouseX = width/2;
  mouseY = height/2;
  angdelta = 1;
}

void draw(){
  background(col2);
  fill(0);
  text(theta, 10, 20);
  x = mouseX;
  y = mouseY;
  spin(x, y, wd, ht, theta, col);
  theta = theta+angdelta;
  //Resets Theta, Changes Color, Changes Size
  if (theta > 360){
    theta = 0;
    col = color(random(225), random(50, 200));
    wd = random(50, 200);
    ht = wd;
  }
}

// Trying to get arc to stay in one spot
// while mouse drag changes it's size?

//void mousePressed(){
//  x = pmouseX;
//  y = pmouseY;
//}

// Changes Speed and Size of Arc
void mouseDragged(){
  wd = mouseX;
  ht = wd;
  angdelta = mouseX%mouseY;
}

// Resets Size of Arc and Resets Arc Position to Mouse Cursor
void mouseReleased(){
  x = mouseX;
  y = mouseY;
  wd = random(50, 200);
  ht = wd;
  angdelta = 1;
}

void keyPressed(){
  if (key == ' '){
    col2 = color(random(255));
  }
}

// Spin Function
void spin(float tx, float ty, float twd, float tht, float tang, color tcol){
  fill(tcol);
  noStroke();
  arc(tx, ty, twd, tht, radians(0), radians(tang));
}


