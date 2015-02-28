
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//variables:
 int a = 250;
 int b = 0;
 int c = 250;
 int d = 250;
 int e = 1;
 int f = 60;
 int xpos1 = 0;
 int ypos1 = 0;
 int ypos2 = 500;
 int movee = 1;
 int move = 1;
 float backr = 255;
 float backg = 255;
 float backb = 255;
 Minim minim;
 AudioSample beep;

void setup () {
  
 size (500,500);
 smooth();
 frameRate (1000000);
 strokeWeight (15);
 minim = new Minim(this);
 beep = minim.loadSample("Gun_Shot-Marvin-1140816320.mp3", 2048);
 
}

void draw () {
  //This sets up the background and line color + starting position onscreen 
   background (backr,55,233);
 stroke (random (255), random (255), random (255));
 line (a,b,c,d);
 a = a + e;
 //Background change + direction of line + sound 
 if (a > 499) {e = -1; backr=random (255); backg=random (255); backb=random (255);beep.trigger();}
 if (a < 1) {e = +1; backr=random (255); backg=random (255);backb=random (255);beep.trigger();}

ellipse (xpos1, ypos2, random (100), random (100));
xpos1 = xpos1 + movee;
ypos1 = ypos2 - movee;
if (xpos1 == 0) {movee = 1;}
if (ypos2 == 475) {movee = -1;}


}


