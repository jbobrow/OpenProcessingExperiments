
float dreh =-30;
PShape sh;
float radius=0;
PImage bg;

import processing.pdf.*;

void setup (){
size (600, 600);
bg = loadImage("bg.png");
  background(bg);
}

void draw(){

sh = loadShape("pinsel_quer.svg");
if (mousePressed){
  radius = radius + dreh;
  translate(mouseX, mouseY);
  rotate (radians(radius));
  shape (sh,0,0,80,40); 
}
}

void keyPressed() {
    if (key == 'b') {
    beginRecord(PDF, "exercise###.pdf");
    }
  if (key == 'e') {
    endRecord();
  }
}

