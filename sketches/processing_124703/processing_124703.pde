
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer sou;


int r1 = 213;
int r2 = r1+20;
int r3 = r1+40;
int r4 = r1+60;
int r5 = r1+80;
int r6 = r1+100;
int r7 = r1+120;
int r8 = r1+140;
int r9 = r1+160;
int r10 = r1+180;
int r11 = r1+200;
 
int c1 = 155;
int c2 = c1+20;
int c3 = c1+40;
int c4 = c1+60;
int c5 = c1+80;
int c6 = c1+100;
int c7 = c1+120;
 
 
void setup() {
  size(640, 480);
  smooth();
 
 minim = new Minim(this);
 sou = minim.loadFile("05.Art-school-hood.mp3");
 sou.loop();
   
}
 
float square(float x) {
  return x*x;
}
 
void drawDot(float x, float y, boolean isBlue) {
  float d = map(sqrt(square(x-mouseX) + square(y-mouseY)), 120, 0, 10, 50);
  if (d<10) d = 10;
  if(isBlue && (d < 20)) {
    ellipse(x, y, 20, 20);
  }
   
  else {
    ellipse(x, y, d, d);
  }
}
 
 
 
void draw() {
  background(255);
  noStroke();
   
  float D = dist(mouseX, mouseY, r1, c1);
  float followY = map(mouseY, 135, 295, 135, 295);
   
 
  float dS = 10;
  float dB = 20;
   
   
  
  fill(199, 199, 199);
  drawDot(r1, c1, false);
  drawDot(r1, c2, false);
  drawDot(r1, c3, false);
  drawDot(r1, c4, false);
  drawDot(r1, c5, false);
  drawDot(r1, c6, false);
  drawDot(r1, c7, false);
   
 
  drawDot(r2, c1, false);
  drawDot(r2, c3, false);
  drawDot(r2, c4, false);
  drawDot(r2, c5, false);
  drawDot(r2, c6, false);
  drawDot(r2, c7, false);
 
  
  drawDot(r3, c1, false);
  drawDot(r3, c2, false);
  drawDot(r3, c3, false);
  drawDot(r3, c4, false);
  drawDot(r3, c5, false);
  drawDot(r3, c6, false);
  drawDot(r3, c7, false);
   
 
  drawDot(r4, c1, false);
  drawDot(r4, c2, false);
  drawDot(r4, c3, false);
  drawDot(r4, c4, false);
  drawDot(r4, c5, false);
  drawDot(r4, c6, false);
  drawDot(r4, c7, false);
   
  
  drawDot(r5, c1, false);
  drawDot(r5, c2, false);
  drawDot(r5, c3, false);
  drawDot(r5, c4, false);
  drawDot(r5, c5, false);
  drawDot(r5, c6, false);
  drawDot(r5, c7, false);
   
 
  drawDot(r6, c1, false);
  drawDot(r6, c2, false);
  drawDot(r6, c3, false);
  drawDot(r6, c4, false);
  drawDot(r6, c5, false);
  drawDot(r6, c6, false);
  drawDot(r6, c7, false);
   
  
  drawDot(r7, c1, false);
  drawDot(r7, c7, false);
   
  
  drawDot(r8, c1, false);
  drawDot(r8, c3, false);
  drawDot(r8, c4, false);
  drawDot(r8, c5, false);
  drawDot(r8, c7, false);
   

  drawDot(r9, c1, false);
  drawDot(r9, c3, false);
  drawDot(r9, c4, false);
  drawDot(r9, c5, false);
  drawDot(r9, c7, false);
   
 
  drawDot(r10, c1, false);
  drawDot(r10, c3, false);
  drawDot(r10, c4, false);
  drawDot(r10, c5, false);
  drawDot(r10, c7, false);
   
  
  drawDot(r11, c1, false);
  drawDot(r11, c2, false);
  drawDot(r11, c3, false);
  drawDot(r11, c4, false);
  drawDot(r11, c5, false);
  drawDot(r11, c6, false);
  drawDot(r11, c7, false);
   
   
  fill(255, 204, 204);
  drawDot(r2, c2, true);
 
  
  drawDot(r3, c3, true);
   
 
  drawDot(r4, c4, true);
  drawDot(r4, c5, true);
  drawDot(r4, c6, true);
   
  
  drawDot(r5, c3, true);
 
  
  drawDot(r6, c2, true);
   
  
  drawDot(r7, c2, true);
  drawDot(r7, c3, true);
  drawDot(r7, c4, true);
  drawDot(r7, c5, true);
  drawDot(r7, c6, true);
   
  
  drawDot(r8, c2, true);
  drawDot(r8, c6, true);
   
  
  drawDot(r9, c2, true);
  drawDot(r9, c6, true);
   
   
  drawDot(r10, c2, true); 
  drawDot(r10, c6, true);
  
  
   
   
   
 
   
}


