
// Audio Player
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 
////////////////
class Button
{
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
    } else {
      over = false;
    }
  }
  void press() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
      pause = !pause;
      if (pause) song.pause();
      else song.play();
    }
  }
  void release() {
    pressed = false;
  }
  void display() { 
    if (pressed) {
      fill(pressCol);
    } else if (over) { 
      fill(overCol);
    } else {
      fill(baseCol);
    }
    stroke(255);
    rect(x, y, size, size); 
    textSize(20);
    text(name, x+size+10, y+size);
  }
}
/////////////////
class CheckBox { 
  String name;
  int x, y;
  int size;
  color baseCol;
  boolean checked = false;
  boolean isChecked() {
    return checked;
  }
  CheckBox(String s, int xp, int yp, int sz, color b) { 
    name = s;
    x=xp;
    y=yp;
    size = sz;
    baseCol = b;
  }
  void press() 
  {
    if ((mouseX >=x ) && (mouseX <= x+size) &&
      (mouseY >= y) && (mouseY <= y+size)) 
    { 
      checked = !checked;     

      if (checked) 
      {
        println(name + " checked");
      } else println(name + " unchecked");
      mute =! mute;
    }
  }
  void display() {
    fill(baseCol);
    stroke(225);
    rect(x, y, size, size); 
    textSize(20);
    text(name, x+size+10, y+size); 

    if (checked) 
    {
      line(x, y, x+size, y+size);
      line(x+size, y, x, y+size);   
      if (mute) song.mute();
    }
    else song.unmute();
  }
}
/////////////////
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
    baseCol = bc; 
    // base color 
    highlightCol = hc; 
    // highlight color 
    pos = (min+max)/2;
    // default position
  }
  void slide() {
    if ((mouseX >=x ) && (mouseX <= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) )
    { 
      pos = map(mouseX, x, x+w, min, max);
    }
  }
  void display() 
  {
    fill(baseCol);
    stroke(0);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);
    textSize(15);
    fill(255);
    text(name, x-30, y+h/2);
    text(nf(min, 0, 0), x-10, y+h+20);
    text(nf(max, 0, 0), x+w-10, y+h+20); 
    text(nf(pos, 0, 0), map(pos, min, max, x, x+w), y-5);
    song.setGain(b1.pos() + 1);
    song.setPan(b2.pos() -0.1 );
  }
}
Button a1;
CheckBox a2;
Slider b1;
Slider b2;
//////////////
void setup()
{
  size(1024, 1024, P3D);
  minim = new Minim(this);
  song = minim.loadFile("test.mp3");
  song.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  a1 = new Button("ON/OFF", 700, 600, 50, color(100), color(200), color(255, 0, 0));
  a2 = new CheckBox("MUTE/UNMUTE", 700, 700, 50, color(100)); 
  b1 = new Slider("VOL", 700, 800, 300, 30, -10, 10, color(200), color(255, 255, 255)); 
  b2 = new Slider("POS", 700, 900, 300, 30, -10, 10, color(200), color(255, 255, 255));
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
    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  // Get frequency domain data using Fast-Fourier-Transform Analysis
  fft.forward( song.mix ); 
  for (int i = 0; i < fft.specSize (); i++) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( i, height, i, height - fft.getBand(i)*10 );
  }
  a1.display();
  a2.display();
  b1.display(); 
  b2.display();
}

void mouseDragged() 
{ 
  b1.slide();
  b2.slide();
}
void mousePressed() { 
  a1.press();
  a2.press();
}
void mouseReleased() { 
  a1.release();
}
void mouseMoved() { 
  a1.over();
}
