
import processing.pdf.*;
 
boolean recording;
PGraphicsPDF pdf;
PImage bg;
PFont font;
int x=3; //stroke weight
int r=0; //red
int g=0; //green
int b=0; //blue
 
void setup() {
  size(750, 600);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "print-screen.pdf"); //sets pdf parameters
  bg = loadImage("canvas.gif"); //Selects background image
  image(bg,0,0); //Displays background image
  smooth();
  stroke(0);
}
 
void draw() {
  strokeWeight(x);
  stroke(r,g,b);
  if (mousePressed) { //drawing tool
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
 
void keyPressed() { //keyboard commands
  if (key == 'p') { // print
    if (recording) {
      endRecord();
      recording = false;
    } else {
      beginRecord(pdf);
      recording = true;
    }
  } 
  if (key == 'c') {
     image(bg,0,0); //Displays background image
  }
  if (key == '1'){
    x=(3);
  }
    if (key == '2'){
    x=5;
  }
    if (key == '3'){
    x=7;
  }
    if (key == '4'){
    x=10;
  }
      if (key == '5'){
    x=15;
  }
    if (key == 'r'){
    r=255;
    g=0;
    b=0;
  }
    if (key == 'g'){
    r=0;
    g=255;
    b=0;
  }
 if (key == 'b'){
    r=0;
    g=0;
    b=255;
  }
 if (key == 'y'){
    r=255;
    g=255;
    b=0;
  }
   if (key == 'k'){
    r=0;
    g=0;
    b=0;
  }
   if (key == 'e'){
    r=255;
    g=255;
    b=255;
  }  
  
  else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }  
}

