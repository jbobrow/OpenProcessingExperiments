
//created by Sophie, Maxime, Antoine M.

/*
1. ***
2. *
3. *
4. ***
5. ***
6. ****
7. **
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



FFT fft;

Minim minim; //classe son
AudioPlayer song; //variable qui peut recevoir un son = musique
//AudioSample sample, une boucle 
//AudioSnippet son d'impact
//AudioInput input = micro de l'ordi
// songs = mp3, sons courts en aiff ou wav

void setup() {
  size(500, 500);
  minim = new Minim(this);
  song = minim.loadFile("oizo.mp3"); //charger le mÃ©dia
  fft = new FFT(song.bufferSize(), song.sampleRate());
  //song.play();
}

void draw() {
  /*  if (key == 'p') {
   song.play();
   } else if (key == 'm') {
   song.pause();
   }
   */
  background(0);
  fft.forward(song.mix);

   for(int i = 0; i < fft.specSize(); i++)
   {
    float t = fft.getBand(i)*10;
    noFill();
    stroke(250, 10);
    strokeWeight(abs(t/10));
    arc(width/2, height/2, abs(t), abs(t), 0, TWO_PI); 
   }
  for (int i = 0; i < song.left.size()-1; i++)
  {
    float t = song.left.get(i)*1000;
    noFill();
    stroke(255,0,0, 10);
    //strokeWeight(abs(t/10));
    arc(width/2, height/2, abs(t), abs(t), PI+HALF_PI, TWO_PI);   
    //line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  for (int j = 0; j < song.right.size()-1; j++)
  {
    float t = song.right.get(j)*950;
    noFill();
    stroke(255, 0,0,10);
    //strokeWeight(abs(t/10));
    arc(width/2, height/2, abs(t), abs(t), HALF_PI, PI+HALF_PI);   
    //line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  
}

void keyPressed() {
  if (key == 'p') {
    song.play();
  } else if (key == 'm') {
    song.pause();
  }
}


void stop() {
  minim.stop(); //stop le son
  super.stop(); //super stop le son
}

void mousePressed(){
  fill(random(200),random(200),random(200));
}


