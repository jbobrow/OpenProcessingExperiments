
// Week 4- Assignment# 3; 
// An Interactive Sketch based on Mouse/keyboard Input

/*
MOUSE INPUT:
MOUSE Pressed  - x,y coordinate recorded as start point
MOUSE Released - x, y coordinate recorded as end point
drag: draw -  cretes basic shape(rectangle or ellipse), once drag is finished.
The above basic shape would be filled with radom color.

After releasing the mouse, it would create 
1. rectangle, if it is odd drag event.
  eg: if user drags(clicks n releases) mouse 1st, 3rd, 5th... times
2. ellipse, if it is even drag event.
  eg: if user drags(clicks n releases) mouse 2nd, 4th, 6th... times

KEYS INPUT:
del,backspace:   erase
s/S:             creta a footer having shape count and save in file 'screeencapture.png'
1,2,3:           change the strokeweight to 5,10,15 for next shape.
*/

//Import 'Minim' library files
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//global variables
Minim minim;
AudioSample cat;

// stroke style
color strokeColor = color(0,10);
int strkwght = 5;

// location coordinate
float startX, startY;
float endX, endY;
boolean actionfinished = false;

// color pallete of 10 colors
color[] palette={#77FF00,#E89F0C,#FF0000,#3E0CE8,#0DFFF2,#FFFBDD,#B1E879,#6DFF9D,#58E0E8,#6D93FF};

// drag/shape count
int dragKount = 0;

//setup()
void setup(){
  size(800,600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
  
  minim = new Minim(this); 
  cat = minim.loadSample("cat_meow.wav");  
}

//draw()
void draw(){ 
  if(actionfinished){
    //style
    strokeWeight(strkwght);
    stroke(strokeColor);
    
    int clrIndx = (int)random(0,10);
    fill(palette[clrIndx]);    
    if(dragKount % 2 == 0){
      // Set ellipseMode to CORNERS      
      ellipseMode(CORNERS);
      ellipse(startX, startY, endX, endY);
    }else{
      float wid = endX-startX;
      float hei = endY-startY;      
      rect(startX, startY, wid, hei);
    }
    actionfinished = false;
  }
}

// create footer
void createFooter(){
  // draw rectangle to show footer text
  fill(#A689BF);
  rect(0,560,800,40);
  
  // font color black.
  fill(#000000);
  textSize(20);
  textAlign(CENTER);
}

void mousePressed() {
  println("mouse is pressed."); 
  // record start point coordinate
  startX = mouseX;
  startY = mouseY;

  // create footer
  createFooter(); 

  // text in footer  
  text("Drawing " + (dragKount % 2 == 0 ? "rectangle" : "ellipse") + ".", width/2, height-10); 
}

void mouseReleased() {
  //record end point coordinate  
  endX = mouseX;
  endY = mouseY;
  println("mouse is released.");
  
  // drag finished flag
  actionfinished = true;
  
  // drag/shape count
  dragKount++;
}

void keyPressed(){
  if(key=='s' || key=='S'){
    
    // create footer
    createFooter(); 
  
    // text in footer
    text("User has created " + dragKount + " basic shape(s).", width/2, height-10); 
  
    // save in file 'screeencapture.png'
    saveFrame("screeencapture.png");
  }
  
    if (key == 'p') {
      cat.trigger();
  }  
}

void keyReleased(){
  if(key==DELETE || key==BACKSPACE){
    // reset the shape count
    dragKount = 0;
    
    // clean the screen
    background(360);
  }
  
  cat.trigger();
  
  // Change the strokeweight based on user presses 1,2,3
  switch(key){
    case '1':
      strkwght=5;
      break;
    case '2':
      strkwght=10;    
      break;
    case '3':
      strkwght=15;    
      break;
  }
}

