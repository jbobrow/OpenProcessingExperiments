
// Audio Player 

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 

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
      pos = int(map(mouseX, x, x+w, min, max));
       {  
        if (mouseX>pmouseX)
        {
          song.setGain( song.getGain()+0.5);
        } else {
          song.setGain( song.getGain()-0.5);
        }
      }

    }
  }
  void display() {
    fill(baseCol);
    stroke(0);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);
    textSize(15);
    fill(0);
    text(name, x-30, y+h/2);
    text(nf(min, 0, 0), x-10, y+h+20);
    text(nf(max, 0, 0), x+w-10, y+h+20); 
    text(nf(pos, 0, 0), map(pos, min, max, x, x+w), y-5);
  }
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
    } else {
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
    } else if (over) { 
      fill(overCol);
    } else {
      fill(baseCol);
    }
    stroke(255);
    ellipse(x, y, size, size);
    textSize(15);
    text(name, x+size, y+size);
  }
}
Button b1, b2, b3;
Slider a1;
void setup()
{
  size(1024, 500);
  minim = new Minim(this);
  song = minim.loadFile("1.mp3");
  song.loop();

  fft = new FFT( song.bufferSize(), song.sampleRate() );

  b1 = new Button("B1", 600, 370, 50, color(50), color(100), color(240)); 
  b2 = new Button("B2", 750, 370, 50, color(50), color(100), color(240)); 
  b3 = new Button("B3", 900, 370, 50, color(50), color(100), color(240));
  a1 = new Slider("SOUND", 100, 360, 300, 30, 0, 255, color(200), color(0,255, 0)); 
 
}

void draw()
{
  background(a1.pos());
  background(#C61420);
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
  line(x, 40, x, 170);

  // display loop start and end 
  float lbx = map(loopBegin, 0, songLength, 0, width);
  float lex = map(loopEnd, 0, songLength, 0, width);
  stroke(0, 255, 0);
  line(lbx, 0, lbx, height);
  stroke(255, 0, 0);
  line(lex, 0, lex, height);
  stroke(#158E24);

  // display volume changes in left and right channels
  for (int i = 0; i < song.bufferSize () - 1; i++)
  { // left.get(i) and right.get(i) returns -1 ~ 1 volume value 
    // in left and right channel respectivey
    // you can also use mix.get(i) for combined sound
    line(i, 50  + song.left.get(i)*50, i+1, 50  + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  if (b1.isPressed())
    song.skip(-500);
  if (b2.isPressed())
    song.pause();
  else song.play();
  if (b3.isPressed())
    song.skip(500);
a1.display();
  b1.display();
  b2.display();
  b3.display();
}

void mousePressed() { 
  b1.press(); 
  b2.press(); 
  b3.press();
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
void mouseDragged() { 
  a1.slide();
 
}

