
/*Title: Xmas (Winter) is coming

This code is based on a few samples on Fractals that can be found
in The Nature of Code by Daniel Shiffman
Available at http://natureofcode.com/book/chapter-8-fractals/

Starting from the concept of the Recursive Tree, this code allows
to generate multiple kinds of snowflakes.

Please, don't forget to save this project in your hard drive
so you can also save your designs as PNG files.

I hope you have fun! =)

Instructions:

MOUSE/TRACKPAD
position x : number of "branchs" (right = max, crystalize)
position y : size (bottom = max)
click+drag : draw

KEYS
Music: m = on /  p = pause, continue / q = quiet
1-7 : stroke color
del, backspace : erase (white background)
spacebar : erase (black background)
s/S : save
*/

import ddf.minim.*;

//Global Variables
color strokeColor = color(0, 5);
float theta;
int sw;
int mX;
int mY;
int v;
PImage RoXi, RoX;
Minim minim;
AudioPlayer HardRain;
boolean pause = false;
boolean quiet = false;                

//setup();
void setup() {
  //size(800, 800) [app 13" displays]
  size(900, 900); //[OpenProcessing.org]
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
  RoXi = loadImage("RoXi.png");
  RoX = loadImage("RoX.png");
  minim = new Minim(this);
  HardRain = minim.loadFile("HardRain.mp3");
  HardRain.loop();
}

//draw();
void draw() {
  //background(RoX);
  image(RoXi, 0, 0, width/2, height);
 
  // Recursive function: exit condition
  float mX = constrain(mouseX, 0, width);
  float mY = constrain(mouseY, -height/2, height);
    
if(mousePressed){
  image(RoX, 0, 0, width/2, height);
  frameRate(30);
  stroke(255);
  sw = 1;
  strokeWeight(sw);
  stroke (strokeColor);
  
  // Angle 0 to 90 degrees based on the mouse position
  float a = (mX/2 / (float) width) * 90f;
  
  // Convert it to radians
  theta = radians(a);
 
  // Snowflakes 
  translate(width/4,height/2);
  branch(mY/2.8);
  
  translate(width/2,0);
  branch(mY/2.8);
  
  translate(-width/4,-height*0.45);
  branch(mY/3.5);
  
  translate(width/2,0);
  branch(mY/3.5);
  
  translate(0,height*0.9);
  branch(mY/3.5);
  
  translate(-width/2,0);
  branch(mY/3.5);
  
  translate(-width/2,0);
  branch(mY/3.5);
  
  translate(0,-height*0.9);
  branch(mY/3.5);
 }
}

void branch(float h) {
  // Each branch will be 0.45 the size of the previous one
  h *= 0.45;
  
  // Recursive function: exit condition
  if (h > (mX / (float) width) * 8 + 8) {
    
    v = constrain(mouseX/(width), 0, width);
    
    strokeWeight(h*v);
    pushMatrix();
    rotate(0);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    strokeWeight(h*v);
    pushMatrix();
    rotate(PI/3);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    strokeWeight(h*v);   
    pushMatrix();
    rotate(2*PI/3);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    strokeWeight(h*v);
    pushMatrix();
    rotate(PI);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();    
    
    strokeWeight(h*v);
    strokeWeight(h/v);
    pushMatrix();
    rotate(-2*PI/3);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    strokeWeight(h*v);  
    strokeWeight(h/v);
    pushMatrix();
    rotate(-PI/3);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    //rotating
    //short
    
    strokeWeight((10000*mX / (float) width));
    
    pushMatrix();    // Save the current state of transformation
    rotate(2*theta);   // Rotate by theta
    line(0, 0, 0, h/2);  // Draw the branch
    translate(0, h/2); // Move to the end of the branch
    branch(h/4);       // Draw two new branches
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    strokeWeight((10000*mX / (float) width));
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h/2);
    translate(0, -h/2);
    branch(h/4);
    popMatrix();
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-2*theta);
    line(0, 0, 0, h/2);
    translate(0, h/2);
    branch(h/4);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h/2);
    translate(0, -h/2);
    branch(h/4);
    popMatrix();
    
    //long
    //strokeWeight((mX / (float) width) * 20);
    
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, h);
    translate(0, h);
    branch(h/2);
    popMatrix();
    
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h/2);
    popMatrix();
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, h);
    translate(0, h);
    branch(h/2);
    popMatrix();
    
     pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h/2);
    popMatrix();
  }
}

//keyPressed();
void keyPressed(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == ' ') background(0);
  if (key == ' ') strokeColor = color(0, 0, 60, 5);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  if (key == 'q' || key == 'Q') { // q = quiet
    quiet = true;
    HardRain.pause();
  }
  if (key == 'm' || key == 'M') { // m = music on
    quiet = false;
    HardRain.loop();
  }
  if (key == 'p' || key == 'P') { // p = pause/continue
    if (!quiet && !pause){
      HardRain.pause();
    }
    if (!quiet && pause){
      HardRain.loop();
    }
    pause = !pause;
  }
  
  switch(key){
    case '1':
      strokeColor = color(0, 0, 60, 5);
      break;   
    case '2':
      strokeColor = color(203, 62, 100, 5);
      break;
    case '3':
      strokeColor = color(230, 62, 91, 5);
      break;
    case '4':
      strokeColor = color(257, 57, 100, 5);
      break;
    case '5':
      strokeColor = color(285, 62, 91, 5);
      break;
    case '6':
      strokeColor = color(324, 58, 100, 5);
      break;
    case '7':
      strokeColor = color(2, 68, 100, 5);
      break;
    case '8':
      strokeColor = color(27, 85, 100, 5);
      break;
    case '9':
      strokeColor = color(60, 85, 100, 5);
      break;
    case '0':
      strokeColor = color(100, 0, 100, 5);
      break;
      
  }
 }

