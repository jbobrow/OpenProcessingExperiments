
/* 
Project 2 - Danger: Thunder
*/

//Variables
float y = 0.0;
float x = 0.0;
float a = 5.0;

float r;
float g;
float b;
int WINDOWHEIGHT;
int WINDOWWIDTH;

import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.*;
Minim minim;
AudioOutput out;

ArrayList<SV> sv=new ArrayList<SV>(1);

//Setup
void setup() {
  //for sound
  minim = new Minim(this);
  r=0;
  g=0;
  b=0;
  out = minim.getLineOut(Minim.STEREO, 512);
  //for rest of program
  frameRate(40);
  WINDOWHEIGHT=600;
  WINDOWWIDTH=700;
  size(WINDOWWIDTH, WINDOWHEIGHT);
  background(0, 0, 0);
  smooth();
  fill(0);
}

//Sound
void draw() {
  fill(0, 20);
  rect(-5, -5, width+15, height+15);
  fill(y, y, y);
  {
    for (int i=0;i<sv.size();i++) {
      if ( sv.get(i) !=null) {
        sv.get(i).draw();

        if (sv.get(i).sound.amplitude() < .01) {
          if (random(100)>2) {
            if (random(100)<50) {
              sv.get(i).x=int(sv.get(i).x*.9);
            }
            else {
              sv.get(i).x=int(sv.get(i).x*1.1);
            }
            if (random(100)<50) {
              sv.get(i).y=int(sv.get(i).y*.9);
            }
            else {
              sv.get(i).y=int(sv.get(i).y*1.1);
            }

            sv.get(i).setStuff();
          }
          else {
            out.removeSignal(sv.get(i).sound);
            sv.remove(i);
          }
        }
      }
    }
  }
}

//Glowing Circles
void mouseMoved() {
  x+=50;
  noStroke();
  //glowing circle lights surround the mouse
  fill(#5F1515, random(0, 15));
  ellipse(mouseX, mouseY-15, x, x);
  //red circle
  fill(#937A7A, random(0, 15));
  ellipse(mouseX+35, mouseY+40, x, x);
  //gray circle
  fill(#CE5E5E, random(0, 15));
  ellipse(mouseX+70, mouseY-15, x, x);
  //pink circle
  if (x>150) {
    x=0;
  }
}

//Program for Lightning
void lightning() {

  int start=round(random(700)); 
  int end=600;
  int y = 0;
  int y2 = 40; 

  while ( y2 < 500) {

    end = (start-40) + round(random(80));
    stroke (255);
    line ( start, y, end, y2);
    y = y2;
    y2 += round(random(80));
    start = end; 

    end = (start-40) + round(random(80));
    stroke (255);
    strokeWeight(5);
    line (start, y, end, y2);
    y = y2;
    y2 += round(random(80));
    start = end;
  }
}

void mouseClicked() {
  lightning();
  lightning();
}

//Implements sound and flash
void mousePressed() {
  sv.add(new SV(WINDOWWIDTH, WINDOWHEIGHT));
  rect(0, 0, WINDOWWIDTH, WINDOWHEIGHT); //flash effect
  fill(255);
  frameRate(20);
  loop();
}

//clears all screen activity
void keyPressed() {
  if (key=='r') {
    out.clearSignals();
    out=null;
    sv=null;
    sv=new ArrayList<SV>(1);
    setup();
  }
}
//SineWave
class SV {
  SineWave sound;
  int WINDOWHEIGHT;
  int WINDOWWIDTH;
  int x;
  int y;
  float r;
  float g;
  float b;
  float da;
  public SV(int cw, int ch) {

    WINDOWHEIGHT=ch;
    WINDOWWIDTH=cw;
    x=mouseX;
    y=mouseY;

    sound = new SineWave(0, 1, out.sampleRate());

    r=random(256);
    g=random(256);
    b=random(256);
    setStuff();
    out.addSignal(sound);
  }    

  //sets colors and circles produced with sound when mouse is clicked
  void draw() {

    fill(r, g, b, 100);
    noStroke();
    sound.setAmp(sound.amplitude()*da);
    ellipse(random(x), random(y), 100*sound.amplitude(), 100*sound.amplitude());
  }
  //sets amplitude and frequency of sound
  void setStuff() {
    float freq;
    float amp;
    float pan;
    freq=map(y, 0, WINDOWHEIGHT, 5000, 800);
    pan=map(x, 0, WINDOWWIDTH, -10, 10);
    sound.setFreq(freq);
    sound.setPanNoGlide(pan); 

    amp=1;

    sound.noPortamento();

    da=random(.5, .8);
    sound.setAmp(amp);
  }
}

/* References 
simple sound toy by Mike Zellers, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID=11952
*/

