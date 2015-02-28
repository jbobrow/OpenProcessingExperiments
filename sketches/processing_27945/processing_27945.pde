
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

 Minim m;
 AudioPlayer mySong;

int[] xP = new int[50];
int[] yP = new int[50];
int a = 10;

void setup(){
  
  size(500, 500);
  background (255);
  smooth();
  
  m= new Minim (this);
 mySong = m.loadFile ("triangleHit.wav");
  
}

void draw() {
  background (255);
  
for (int i = 0; i < xP.length-1; i++){
  xP[i] = xP[i+1];
  yP[i] = yP[i+1];
}

xP[xP.length-1] = mouseX;
yP[yP.length-1] = mouseY;

for (int i = 0; i < xP.length; i++) {
  
  noStroke();
  fill(225-i*1, 172-i*5, 77, 255-i*5);
  stroke(255-i*1, 122-i*5, 77, 255-i*5);
  rectMode(CENTER);
  rect(xP[i], yP[i], i, i);
}

if (mousePressed) {
  mySong.rewind();
  mySong.play();
 

 rect(mouseX, mouseY, 75, 75);
 }
 
 strokeWeight(2);
 noFill();
 
 
 stroke(255, 122, 77, 110);
 rectMode(CENTER);
 rect(mouseX, mouseY, 75, 75);
 
 stroke(196, 0, 49, 122);
 ellipse(mouseX-38, mouseY-12, 10, 10);
 ellipse(mouseX-38, mouseY+12, 10, 10);
 
 ellipse(mouseX-12, mouseY-38, 10, 10);
 ellipse(mouseX+12, mouseY-38, 10, 10);
 
 ellipse(mouseX-13, mouseY+37, 10, 10);
 ellipse(mouseX+13, mouseY+37, 10, 10);
 
 ellipse(mouseX+37, mouseY-13, 10, 10);
 ellipse(mouseX+37, mouseY+13, 10, 10);
 
 quad(mouseX-50, mouseY, mouseX, mouseY-50, mouseX+50, mouseY,
mouseX, mouseY+50);
 
 if (mousePressed)
 {

 background(255);
 }
 
 if (mousePressed == true)
 {
 stroke(196, 0, 49, 122);
 //rect(mouseX-30, mouseY-30, 25, 25);
 rect(mouseX, mouseY-30, 25, 25);
 rect(mouseX-30, mouseY+30, 25, 25);
 rect(mouseX+30, mouseY+30, 25, 25);
 
 

 }
}
  

 




