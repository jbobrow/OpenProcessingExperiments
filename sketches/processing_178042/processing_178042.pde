
/*
 Project 3 - Computational Arts
 
 I've created an art board that you can draw
 straight lines with your mouse.
 also you can clean the canvas 
 click and release to draw
 drag to change stroke color
 Press 'c' or 'backspace' to clean the canvas
*/

//Adding sound
import ddf.minim.*;


//Defining Color Palette with contrasted colours
color[] compound = {#1DCCC2, #449994, #FCCCFC, #FF4B87, #CC1DAF};
color[] palette = compound;

// to save mouse coordinates
int saveX;
int saveY;
int counter = 1;
int saveN = 1;
int textStart = 1;

// image frame.png 
PImage frame;

void setup(){ 
 size(1024, 650);
// background(palette[0]);
 background(255);
 smooth();
 frame = loadImage("frame.png");
 if (textStart == 1) {
    fill (0);
    textSize (32);
    text ("Project 3", width/2-300, height/2-100);
    text ("use mouse click to create your shapes", width/2-300, height/2);
    text ("press C to change color", width/2-300, height/2+50);
    text ("backspace to erase canvas", width/2-300, height/2+100);
  }
 
}

void draw(){
}
void mouseReleased() {
   if (textStart == 1) {
     background(255);
     stroke(0);
     // resets pressed state
     counter = 1;
     image(frame, 0, 0);
   }
  // first time mousePressed
  if (counter == 1) {
    saveX = mouseX;
    saveY = mouseY;
    delay (1);
    textStart = 2;
  } 
  counter += 1;
  print (counter);
  line (saveX,saveY,mouseX,mouseY);
  //painting triangles
  fill(0);
  triangle(mouseX,mouseY-5,mouseX+5,mouseY,mouseX-5,mouseY);
  saveX = mouseX;
  saveY = mouseY;

  
}

void keyPressed(){
 if (key == DELETE || key == BACKSPACE) {
   // clean
   background(255);
   stroke(0);
   // resets pressed state
   counter = 1;
 } 
 if (key == 'c' || key == 'C') {
   stroke (random(255),random(255),random(255));
 }
}


