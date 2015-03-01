
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 


Slider soundbar;
Button Mute, Stop,Sp,Sm;
void setup()
{
  size(1424, 200);
  minim = new Minim(this);
  song = minim.loadFile("test.mp3");
  song.loop();

  fft = new FFT( song.bufferSize(), song.sampleRate() );

  soundbar = new Slider("SOUND", 1100, 150, 300, 30, 0, 10);
  Mute = new Button("MUTE", 1100, 90, 50);
  Stop = new Button("STOP/\nSTART", 1160, 90, 50);
  Sp = new Button(">", 1220, 90, 50);
  Sm = new Button("<", 1280, 90, 50);
 
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
  float x = map(p, 0, songLength, 0, width-400);
  stroke(255);
  line(x, height/2 - 50, x, height/2 + 50);

  if (mouseX<width-400) {// display loop start and end 
    float lbx = map(loopBegin, 0, songLength, 0, width-400);
    float lex = map(loopEnd, 0, songLength, 0, width-400);
    stroke(0, 255, 0);
    line(lbx, 0, lbx, height);
    stroke(255, 0, 0);
    line(lex, 0, lex, height);
    stroke(255);
  }

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

  soundbar.display();
  Mute.display();
  Stop.display();
  Sp.display();
  Sm.display();
}


void mouseDragged() { 
  soundbar.slide();
}

void mousePressed()
{
  int ms = (int)map(mouseX, 0, width-400, 0, song.length());
  if ( mouseButton == RIGHT ) {
    loopEnd = ms;
    song.setLoopPoints(loopBegin, ms);
  } else {
    loopBegin = ms;
    song.setLoopPoints(ms, loopEnd);
  }
  
  Mute.press1();
  Stop.press2();
  Sp.press3();
  Sm.press4();
 
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
  }
}

void mouseReleased() { 
  Mute.release(); 
  Stop.release();
  Sp.release();
  Sm.release();
}
void mouseMoved() { 
  Mute.over(); 
  Stop.over();
  Sp.over();
  Sm.over();

}



////////////SLIDER/////////
class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height 
  float min, max;
  float pos; // current value 
  color baseCol;
  color highlightCol;

  Slider(String s, int xp, int yp, int sw, int sh, float mi, float ma) 
  { 
    name = s; // name
    x=xp; // x position
    y=yp; // y position
    w = sw; // slide width
    h = sh; // slide height
    min = mi; // min
    max = ma; // max
    pos = (min+max)/2; // default position
  }
  void slide() {
    if ((mouseX >=x ) && (mouseX<= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) ) { 
      pos = int(map(mouseX, x, x+w, min, max));
      {   
        if (mouseX>pmouseX)
        {
          song.setGain( song.getGain() + 1);
        } else {
          song.setGain( song.getGain() - 1);
        }
      }
    }
  }

  void display() {
    fill(0);
    stroke(255);
    rect(x, y, w, h);
    fill(255);
    rect(x, y, map(pos, min, max, 0, w), h);
    textSize(20);
    fill(100);
    text(name, x+130, y+h/1.5);
  }
}


////////////BUTTON/////////
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

  Button(String s, int xp, int yp, int sz) { 
    name = s;
    x=xp;
    y=yp;
    size = sz;
  }

  void over() {
    if ((mouseX >=x ) && (mouseX <= x+size) &&
      (mouseY >= y) && (mouseY <= y+size)) {
      over = true;
    } else {

      over = false;
    }
  }

  void press1() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
      mute = !mute;
    if (mute) song.mute();
    else song.unmute();
  
    }
  }
   void press2() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
      pause = !pause;
    if (pause) song.pause();
    else song.play();
  
    }
  }  
  void press3() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
      song.skip(500);
    }
  }  
  void press4() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
     song.skip(-500); 
    }
  }  
  
  void release() {
    pressed = false;
  }
  void display() { 
    if (pressed) {
      fill(0);
    } else if (over) { 
      fill(200);
    } else {
      fill(255);
    }

    rect(x, y, size, size); 
    textSize(15);
    fill(150);
    text(name, x+5, y+20);
  }
}

