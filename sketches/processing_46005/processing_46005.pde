

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer audio;

float SMOOTHING = 0.1;
float vol = 0, pos = 0;
int index = 0;
Lns[] lns = new Lns[50];

void setup() {    
  size(600, 500);
  smooth();

  minim = new Minim(this);  
  audio = minim.loadFile("1.mp3");
  audio.loop();
}

void draw() {
  background(255);
  vol = lerp(vol, audio.mix.level()*100, SMOOTHING);
  pos = (audio.position()/(float)audio.length());
  stroke(0);

  if (pos <= 0.1843 || (pos >=0.48 && pos <= 0.69)) {
    drawNet();
    if (frameCount % 10 == 0) {
      if (vol > 7) {
        Lns newLines = new Lns ();
        if (vol > 19) { 
          vol =18;
        }
        newLines.setupLines(70, 200-vol*10, 200-vol*7, vol*vol*vol/200);

        lns [index] = newLines;
        index++;
        if (index == lns.length-1)
          index = 0;
      }
    }
  }

  if ((pos > 0.1843 && pos <=0.48) || pos >= 0.69) {
    drawNet();
    Lns newLines = new Lns ();
    newLines.setupLines(2*vol, 2*vol, 3*vol, 100);

    lns [index] = newLines;
    index++;
    if (index == lns.length-1)
      index = 0;
      stroke(255);
      strokeWeight(2);
      float a = random(width);
      line(a, 0, a, height);
  }
  println("vol = " + vol + "   pos = " + pos);
}

void mouseClicked() {
  audio.cue((int)((mouseX/(float)width) * audio.length()));
}


