
import ddf.minim.*;

 
Minim minim;
AudioPlayer while_waiting;

int r = 40;
int r2 = 50;
int r3 = 50;
int r4 = 50;
int r5 = 50;
int alphavalue =50;

void setup() {
  size(640, 360);
  background(0);
  colorMode(HSB, 360, 100, 100,255);
  noStroke();
  ellipseMode(RADIUS);
  rectMode(RADIUS);
  frameRate(2.8); 
  minim = new Minim(this);
  while_waiting=minim.loadFile("hw1.mp3");
  while_waiting.loop();
}

void draw() {
   float x = random (40, 600);
   float y = random (40, 300);
   float h = random (360);
   
  
     for  (int i=0; i<=r; i++) {
     fill(h, 90, 90, alphavalue);
     ellipse(x, y, r-i, r-i);
     h = (h+1.5) % 360;
     }
     
     

   fill(0,0,0,25);
   rect(0,0,width,height);
}

void mousePressed() {
   alphavalue=0;
  }
 
void mouseReleased() {
   alphavalue=50;
  } 



