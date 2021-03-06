
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false;
void setup()
{
  size(1024, 600, P3D);
  minim = new Minim(this);
  song = minim.loadFile("test.mp3");
  song.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );

  b1 = new Slider("Gain", 100, 250, 30, 250, -10, 10, color(200), color(255));
  b2 = new Slider("Pan", 200, 250, 30, 250, -10, 10, color(200), color(255));
  b3 = new Slider("Amp", 300, 250, 30, 250, -10, 10, color(200), color(255));
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
  line(x, 200/2 - 50, x, 200/2 + 50);
  // display loop start and end 
  float lbx = map(loopBegin, 0, songLength, 0, width);
  float lex = map(loopEnd, 0, songLength, 0, width);
  stroke(0, 255, 0);
  line(lbx, 0, lbx, 200);
  stroke(255, 0, 0);
  line(lex, 0, lex, 200);
  stroke(255);
  // display volume changes in left and right channels
  for (int i = 0; i < song.bufferSize () - 1; i++)
  { // left.get(i) and right.get(i) returns -1 ~ 1 volume value 
    // in left and right channel respectivey
    // you can also use mix.get(i) for combined sound
    line(i, 50 + song.left.get(i)*25*b3.pos(), i+1, 50 + song.left.get(i+1)*25*b3.pos());
    line(i, 150 + song.right.get(i)*25*b3.pos(), i+1, 150 + song.right.get(i+1)*25*b3.pos());
  }
  // Get frequency domain data using Fast-Fourier-Transform Analysis
  fft.forward( song.mix ); 
  for (int i = 0; i < fft.specSize (); i++) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( i, 200, i, 200 - fft.getBand(i)*10 );
  }

  b1.display();
  b2.display();
  b3.display();
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

Slider b1, b2, b3;


void mouseDragged() {
  b1.slide();
  song.setGain( -b1.pos() );
  b2.slide();
  song.setPan( b2.pos()/10 );
  b3.slide();
  
}
void mousePressed()
{
  
}


class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height
  float min, max;
  float pos; // current value
  color baseCol;
  color highlightCol;
  float pos() {
    return pos;
  }
  Slider(String s, int xp, int yp, int sw, int sh, float mi, float ma, color bc, color hc) {
    name = s; // name
    x=xp; // x position
    y=yp; // y position
    w = sw; // slide width
    h = sh; // slide height
    min = mi; // min
    max = ma; // max
    baseCol = bc; // base color
    highlightCol = hc; // highlight color
    pos = (min+max)/2; // default position
  }
  void slide() {
    if ((mouseX >=x ) && (mouseX <= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) ) {
      pos = map(mouseY, y, y+h, min, max);
    }
  }
  void display() {
    fill(baseCol);
    stroke(0);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, w, map(pos, min, max, 0, h));
    textSize(15);
    fill(255);
    text(name, x+5, y+h+40);
    //text(nf(min, 0, 0), x-10, y+h+20);
    //text(nf(max, 0, 0), x-10, y-10);
    //text(nf(-pos, 0, 0), x-40, map(pos, min, max, y, y+h));
  }
}

