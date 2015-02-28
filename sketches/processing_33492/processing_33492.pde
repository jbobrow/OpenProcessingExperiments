
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float leftEyeposX;
float rightEyeposX;
float leftEyeposY;
float rightEyeposY;
PImage img;
int rad=70;
int pupL=7;
int pupR=7;

void setup() {
  size(264,264);
  img = loadImage("kenny.jpg");
  noStroke();
  smooth();
  frameRate(20);
}


void draw() {
  background(img);
  noStroke();
  fill(255);
  ellipse(142,133,30,30);
  ellipse(187,147,30,30);
  leftEyeposX = map(mouseX,0, width, 132, 152);
  rightEyeposX = map(mouseX, 0, width, 177,197);
  leftEyeposY = map(mouseY, 0, height, 123, 143);
  rightEyeposY = map(mouseY, 0, height, 137, 157);  
  fill(0);
  ellipse(leftEyeposX, leftEyeposY,pupL,pupR);
  ellipse(rightEyeposX, rightEyeposY,pupL,pupR);
}
void mouseMoved() {
  if (dist(mouseX,mouseY,0,108)<100){
    println("tghidt a newpra=se");
    for(int i= 0; i< 5; i++) {
      fill(random(0,255),random(0,255),random(0,255));
      pupR++;
      pupL++;
  ellipse(leftEyeposX, leftEyeposY,pupL,pupR);
  ellipse(rightEyeposX, rightEyeposY,pupL,pupR);
    }
  }
}
void keyPressed(){
  if (key=='a'){
    pupR=7;
    pupL=7;
  }
}

