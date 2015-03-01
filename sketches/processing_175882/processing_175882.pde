
// Audio Player 

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 
String name;
int x, y;
int size;
color baseCol;
color overCol;
color pressCol; 
boolean over = false; 
boolean pressed = false;
boolean isPressed() {
  return pressed;
}

class Button {
  String name;
  int x, y;
  int size;
  color baseCol;
  color overCol;
  color pressCol; 
  boolean over = false; 
  boolean pressed = false;
  boolean isPressed() {
    return pressed;
  }
  Button(String s, int xp, int yp, int sz, color b, color o, color p) { 
    name = s;
    x=xp;
    y=yp;
    size = sz; 
    baseCol = b; 
    overCol = o; 
    pressCol = p;
  }
  void over() {
    if ((mouseX >=x ) && (mouseX <= x+size) &&
      (mouseY >= y) && (mouseY <= y+size)) {
      over = true;
    } 
    else {
      over = false;
    }
  }
  void press() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
    }
  }
  void release() {
    pressed = false;
  }
  void display() { 
    if (pressed) {
      fill(pressCol);
    } 
    else if (over) { 
      fill(overCol);
    } 
    else {
      fill(baseCol);
    }
    stroke(255);
    rect(x, y, size, size); 
    textSize(20);
    text(name, x+size+10, y+size);
  }
}

Button b1, b2, b3;
void setup()
{
  size(1024, 400);
  b1 = new Button("", 100, 150, 30, color(100), color(200), color(255, 0, 0)); 
  b2 = new Button("", 150, 200, 30, color(#00BF4A), color(#00BF4A), color(100)); 
  b3 = new Button("", 200, 250, 30, color(100), color(200), color(255, 0, 0));
  minim = new Minim(this);
  song = minim.loadFile("1.mp3");
  song.loop();

  fft = new FFT( song.bufferSize(), song.sampleRate() );
}

void draw()
{

  background(#FAFFB9);
  if (b1.isPressed())
  song.skip(-100);
  if (b2.isPressed())
    song.pause();
   else song.play(); 
 if (b3.isPressed())
 song.skip(100);
  b1.display(); 
  b2.display(); 
  b3.display();


// display song play information
int p = song.position(); 
int songLength = song.length();
  textSize(20);
text("Loop Count: " + song.loopCount(), 5, 20);
text("Looping: " + song.isLooping(), 5, 40);
text("Playing: " + song.isPlaying(), 5, 60);
text("Position: " + p + " msec", 5, 80);
text("Length: " + songLength + " msec", 5, 100);
text("Gain: " + song.getGain(), 5, 120);
text("Pan: " + song.getPan(), 5, 140);

// display current position
float x = map(p, 0, songLength, 0, width);
stroke(0);
line(x, 40, x, 400);

// display loop start and end 
float lbx = map(loopBegin, 0, songLength, 0, width);
float lex = map(loopEnd, 0, songLength, 0, width);
stroke(0, 255, 0);
line(lbx, 0, lbx, height);
stroke(255, 0, 0);
line(lex, 0, lex, height);
stroke(#3CA544);

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
}

void mousePressed()
{
  int ms = (int)map(mouseX, 0, width, 0, song.length());
  if ( mouseButton == RIGHT ) {
    loopEnd = ms;
    song.setLoopPoints(loopBegin, ms);
  } 
  else {
    loopBegin = ms;
    song.setLoopPoints(ms, loopEnd);
  }
   b1.press(); 
  b2.press(); 
  b3.press();
}

void keyPressed()
{
  switch(key) {
  case 'f': // fast-forware
    song.skip(500); // fast-forward 500 milliseconds
    break;
  case 'r': // rewind
    song.skip(-500); // rewind 500 milliseconds
    break;

  case ' ':
    pause = !pause;
    if (pause) song.pause();
    else song.play();
    break;
  case 'm':
    mute = !mute;
    if (mute) song.mute();
    else song.unmute();
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
void mouseReleased() { 
  b1.release(); 
  b2.release(); 
  b3.release();
}
void mouseMoved() { 
  b1.over(); 
  b2.over(); 
  b3.over();
}

