
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
float pupL=7;
float pupR=7;
float leftEyeX;
float rightEyeX;
float leftEyeY;
float rightEyeY;



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
  if (dist(mouseX,mouseY,30,80)<30){
    for(int i= 0; i< 15; i++) {
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(leftEyeposX-=2, leftEyeposY-=1,pupL*=1.0003,pupR*=1.0003);
      ellipse(rightEyeposX-=2, rightEyeposY-=1,pupL*=1.0003,pupR*=1.0003);
    }
  }
}
void keyPressed(){
  if (key=='a'){
    for(int i= 0; i< 15; i++) {
      fill(random(0,255),random(0,255),random(0,255));
      leftEyeX= map(mouseX,0,width,0,230);
      rightEyeX= map(mouseX,0,width,0,230);
      leftEyeY= map(mouseY,0,height,0,230);
      rightEyeY= map(mouseY,0,height,0,230);
      ellipse(leftEyeX-=2, leftEyeY-=1,pupL*=1.0003,pupR*=1.0003);
      ellipse(rightEyeX-=2, rightEyeY-=1,pupL*=1.0003,pupR*=1.0003);
    }      
   }
  if (key=='b'){
        pupL=7;
        pupR=7; 
  }

}
/// Image origin unknown, taken from
  
   

