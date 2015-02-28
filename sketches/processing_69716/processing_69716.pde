
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

void setup(){
  setupAudio();
  size(400,400);
}
  
void draw(){
  background(255);
  smooth();
  
  //body
  fill(#FFFB7C);
  noStroke();
  ellipse(200, 150, 255, 255);
  rect(73, 155, 255, 200);
   
  //hair
  noFill();
  arc(200, 30, 20, 20, PI, TWO_PI);
   
   //arms
    fill(#FFFB7C);
    ellipse(73, 380, 30, 150);
    ellipse(328, 380, 30, 150);
   
   
  fill(#355495);
  rect(73, 280, 255, 125);
 
  fill(#FFFB7C);
  arc(200, 280, 255, 50, 0, PI);
  quad(73, 305, 123, 320, 123, 360, 73, 360);
  quad(278, 320, 328, 305, 328, 360, 278, 360);
  
  // Draw the mouth.
   
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0,100, 2,120);  // now we can use it for something!
  
  fill(255,200,200);
  ellipse(200, 240, 50,Y);
  
  // The rest of the code just draws the Eye:
  float ex = 200;
  float ey = 100;
  fill(255);
  ellipse(ex,ey, 100,100);
  fill(0);
  float dx = constrain((mouseX-ex)/20, -14,14);
  float dy = constrain((mouseY-ey)/20, -14,14);
  ellipse(ex+dx,ey+dy, 20,20);
}


