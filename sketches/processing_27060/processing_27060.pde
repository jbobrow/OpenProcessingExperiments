
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

 Minim m;
 AudioPlayer mySong;

float[] rectangle = new float[3];
int a = 10;

void setup(){
 size (500,500);
 background (255);
 smooth();

 m= new Minim (this);
 mySong = m.loadFile ("triangleHit.wav");
}

void draw() {
 if (mousePressed) {
  mySong.rewind();
  mySong.play();

  background(255);
 rect(a, mouseY, 75, 75);
 }
 a = mouseX;
 strokeWeight(2);
 noFill();

 stroke(255, 122, 77, 110);
 rectMode(CENTER);

 quad(mouseX-50, mouseY, mouseX, mouseY-50, mouseX+50, mouseY,
mouseX, mouseY+50);

 if (mousePressed == true)
 {
 stroke(196, 0, 49, 122);
 ellipse(mouseX-38, mouseY-12, 10, 10);
 ellipse(mouseX-38, mouseY+12, 10, 10);

 ellipse(mouseX-12, mouseY-38, 10, 10);
 ellipse(mouseX+12, mouseY-38, 10, 10);

 ellipse(mouseX-13, mouseY+37, 10, 10);
 ellipse(mouseX+13, mouseY+37, 10, 10);

 ellipse(mouseX+37, mouseY-13, 10, 10);
 ellipse(mouseX+37, mouseY+13, 10, 10);
 }



if (mousePressed == true)
 {

 }

}

