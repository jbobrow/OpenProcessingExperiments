
//Homework 4
//Tyler Porten (tporten) copyright 2012

//Press a key to type the letter of the key where the
//mouse is. Press the space bar to erase the letters.
//Press the mouse to write "bluh"

float x, y;


void setup(){
  size(500, 500);
  background(255);
 
  PFont font;
  font = loadFont("AmericanTypewriter-48.vlw");
  textFont(font, 48);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  frameRate(100);
  
  
}

void draw(){
 
 
}


void keyPressed(){
  fill(0);
 
  text(key, mouseX, mouseY);
  if (key == ' '){
  background(255);
  }
}

void mouseDragged(){
  fill(0);
 text("bluh", mouseX, mouseY); 
}

void mousePressed(){
  fill(0);
 text("bluh", mouseX, mouseY); 
}

//void mouseMoved(){
  // background(255);
 // stroke(200);
 // strokeWeight(2);
 // noFill();
// rect(mouseX, mouseY, 30, 48); 
   //background(255);
  //noStroke();
  //text("bluh", mouseX, mouseY);
  //fill(0);
//}



