
import processing.pdf.*;

PImage motif26;
PImage motif19;
PImage motif28;
PImage motif6;
PImage motif16;
PImage motif14;
PImage motif27;
float angle = 0.0;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  background(0);
  frameRate(30);
  motif26 = loadImage("motif26.png");
  motif19 = loadImage("motif19.png");
  motif28 = loadImage("motif28.png");
  motif6 = loadImage("motif6.png");
  motif16 = loadImage("motif16.png");
  motif14 = loadImage("motif14.png");
  motif27 = loadImage("motif27.png");
}

void draw(){
  if(!paused){
    aspect = random(-2.0, 2.0);
    image(motif28, random(width), random(height), motif28.width*aspect, motif28.height*aspect);
  }
  if (mousePressed) {
    if (keyPressed) {
      if (key == 'k') {
        rotate(angle);
        image(motif26, pmouseX-150, pmouseY-150, 200, 200);
        angle+=5;
      }
    }
    if (keyPressed) {
      if (key == 'j') {
        rotate(angle);
        image(motif27, pmouseX-50, pmouseY-150, 200, 200);
        angle+=.25;
      }
    }
    if (keyPressed) {
      if (key == 'd') {
        image(motif16, pmouseX-350, pmouseY-300, 400, 400);
      }
    }
    if (keyPressed) {
      if (key == '2') {
          aspect = random(-2.0, 2.0);
          image(motif14, random(width), random(height), motif14.width*aspect, motif14.height*aspect);
    
  }
}
  }
}
  


void keyPressed() {
  if (key == 'c') {
    background(0);
  }
  if(key == 'g') {
    background(0, 140, 60);
  }
  if(key == 'h') {
    fill(255, 30);
    rect(0, 0, 800, 800);
  }
  if(key == 'p') {
    background(243, 12, 175);
  }
  if(key == 'w') {
    background(255);
  }
  if(key == ' ') {
    if(paused) {paused = false;}
    else {paused = true; }
  }
  if(key == 's') {
    saveFrame("savedimages/circ-####.tiff");
  }
}



