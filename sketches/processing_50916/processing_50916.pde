
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

SineWave[] notes;
int[] score;
Minim minim;
int playCount = 0;
AudioOutput out;


SineWave note0;
SineWave note1;
SineWave note2;
SineWave note3;
SineWave note4;
SineWave note5;
SineWave note6;
SineWave note7;
SineWave note8;
SineWave note9;
SineWave note10;


void setup() {
  size(800, 150);
  background(255);
  notes = new SineWave[12];
  score = new int[40];

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);

  fill(0);
  text("Click to advance", 60, 120);
  text("Press m for Mary Had a Little Lamb, or r for random score", 240, 120);


  notes[0] = new SineWave(293.665, 1, 44100);  //RE
  notes[1] = new SineWave(329.628, 1, 44100);  //MI
  notes[2] = new SineWave(349.228, 1, 44100);  //FA
  notes[3] = new SineWave(391.995, 1, 44100);  //SOL
  notes[4] = new SineWave(440, 1, 44100);      //LA
  notes[5] = new SineWave(493.833, 1, 44100);  //SI
  notes[6] = new SineWave(523.251, 1, 44100);  //DO
  notes[7] = new SineWave(587.330, 1, 44100);  //RE
  notes[8] = new SineWave(659.255, 1, 44100);  //MI
  notes[9] = new SineWave(698.456, 1, 44100);  //FA
  notes[10] = new SineWave(783.991, 1, 44100); //SOL
  notes[11] = new SineWave(0, 1, 44100); //silence

  for (int k = 0; k< score.length; k++) {
    score[k] = (int)random(0, 11);
  }
}


void draw() {



  for (int n = 1; n<=5; n++) {
    stroke(0);
    line(20, 20+n*10, 780, 20+10*n);
  }
}



void keyPressed() {
  if (key=='m') {
    populateMHALL();
  }
  if (key=='r') {
    for (int k = 0; k< score.length; k++) {
      score[k] = (int)random(0, 11);
    }
  }
}




void mouseReleased() {
  if (playCount < 40) {

    out.clearSignals();
    out.addSignal(notes[score[playCount]]);

    println(score[playCount]);

    if (score[playCount] == 11) {
      out.clearSignals();
      background(255);
      playCount =0;
      fill(0);
      text("Click to advance", 60, 120);
      text("Press m for Mary Had a Little Lamb, or r for random score", 240, 120);
    }
    else { 
      drawNote(45+18*playCount, 75-score[playCount]*5);
      playCount++;
    }
  }
  else {
    out.clearSignals();
    background(255);
    playCount =0;
    fill(0);
    text("Click to advance", 60, 120);
    text("Press m for Mary Had a Little Lamb, or r for random score", 240, 120);
  }
}



void populateMHALL() {


  score[0] = 8;
  score[1] = 7;
  score[2] = 6;
  score[3] = 7;
  score[4] = 8;
  score[5] = 8;
  score[6] = 8;
  score[7] = 7;
  score[8] = 7;
  score[9] = 7;
  score[10] = 8;
  score[11] = 10;
  score[12] = 10;
  score[13] = 8;
  score[14] = 7;
  score[15] = 6;
  score[16] = 7;
  score[17] = 8;
  score[18] = 8;
  score[19] = 8;
  score[20] = 8;
  score[21] = 7;
  score[22] = 7;
  score[23] = 8;
  score[24] = 7;
  score[25] = 6;
  for (int b = 26; b < score.length; b ++) {
    score[b] = 11;
  }
}








void drawNote(int x, int y) {
  fill(0);  
  ellipse(x, y, 10, 6);
  line(x+5, y, x+5, y-20);
}

void stop()
{
  //song.close();
  minim.stop();

  super.stop();
}


