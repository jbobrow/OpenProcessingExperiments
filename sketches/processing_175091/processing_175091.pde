
class Checkbox {
  String name;
  int x, y;
  int size;
  color baseCol;
  boolean checked = false;
  boolean isChecked() {
    return checked;
  }

  Checkbox (String s, int xp, int yp, int sz, color b) {
    name=s;
    x=xp;
    y=yp;
    size=sz;
    baseCol=b;
  }

  void press() {
    if ((mouseX >=x) && (mouseY<= x+size) &&(mouseY>=y) && (mouseY<= y+size)) {
      checked = !checked; 
      if (checked) println(name+"checked"); 
      else println(name+"unchecked");
    }
  }

  void display() {
    fill(baseCol);
    stroke(0);
    rect(x, y, size, size); 
    textSize(10);
    text(name, x+size+10, y+size); 
    if (checked) {
      line(x, y, x+size, y+size);
      line(x+size, y, x, y+size);
    }
  }
}


// Audio Player 

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;


Checkbox pause, mute; 

void setup()
{
  size(1024, 200);
  minim = new Minim(this);
  song = minim.loadFile("test.mp3");
  song.loop();

  fft = new FFT( song.bufferSize(), song.sampleRate() );

  pause = new Checkbox ("Pause", width-100, 20, 20, color(255)); 
  mute = new Checkbox ("mute", width-100, 40, 20, color(255));
}



void draw()
{
  background(0);
  fill(255);  

  // display song play information
  int p = song.position(); 
  int songLength = song.length(); 
  text("Loop Count: " + song.loopCount(), 5, 20);
  text("Looping: " + song.isLooping(), 5, 40);
  text("Playing: " + song.isPlaying(), 5, 60);
  text("Position: " + p + " msec", 5, 80);
  text("Length: " + songLength + " msec", 5, 100);
  text("Gain: " + song.getGain(), 5, 120);
  text("Pan: " + song.getPan(), 5, 140);

  // display current position
  float x = map(p, 0, songLength, 0, width);
  stroke(255);
  line(x, height/2 - 50, x, height/2 + 50);

  // display loop start and end 
  float lbx = map(loopBegin, 0, songLength, 0, width);
  float lex = map(loopEnd, 0, songLength, 0, width);
  stroke(0, 255, 0);
  line(lbx, 0, lbx, height);
  stroke(255, 0, 0);
  line(lex, 0, lex, height);
  stroke(255);

  // display volume changes in left and right channels
  for (int i = 0; i < song.bufferSize () - 1; i++)
  { // left.get(i) and right.get(i) returns -1 ~ 1 volume value 
    // in left and right channel respectivey
    // you can also use mix.get(i) for combined sound
    line(i, 50  + song.left.get(i)*50, i+1, 50  + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }

  // Get frequency domain data using Fast-Fourier-Transform Analysis
  fft.forward( song.mix ); 
  for (int i = 0; i < fft.specSize (); i++) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( i, height, i, height - fft.getBand(i)*10 );
  }

  if (pause.isChecked()) {
    song.pause();
  } else song.play();



  if (mute.isChecked()) {
    song.mute();
  } else song.unmute();

  pause.display();
  mute.display();
}

void mousePressed()
{
  pause.press();
  mute.press();
}


void keypressed(){
  
  switch(key) {
  case 'f': // fast-forware
    song.skip(500); // fast-forward 500 milliseconds
    break;
  case 'r': // rewind
    song.skip(-500); // rewind 500 milliseconds
    break;
  }

  switch (keyCode) {
  case LEFT: // stereo Panning
    song.setPan( song.getPan()-0.1 );
    break;
  case RIGHT: // stereo Panning
    song.setPan( song.getPan()+0.1 );
    break;    
  case UP: // volume up
    song.setGain( song.getGain() + 1);
    break;
  case DOWN: // volume down
    song.setGain( song.getGain() - 1);
    break;
  }
}

