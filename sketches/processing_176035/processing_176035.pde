
import ddf.minim.*;
import ddf.minim.analysis.*;

int nowPlaying = 0, songNum = 7;
boolean pause = false, mute=false;
PFont font = createFont("MalgunGothicRegular", 32);

Button btnNextSong;
PlayButton btnStart;
Slider sliderTime;

Minim minim;
AudioPlayer []song = new AudioPlayer[songNum];
AudioMetaData songInfo;
FFT fft;

void setup() {
  size(600, 200);
  minim = new Minim(this);
  for (int i=0; i<songNum; i++) {
    song[i] = minim.loadFile("Shinee ("+(i+1)+").mp3");
  }
  songInfo = song[nowPlaying].getMetaData();
  btnStart = new PlayButton("", 40, 90, 30, color(100), color(200), color(255, 0, 0));
  btnNextSong = new Button("", width - 70, 90, 30, color(100), color(200), color(255, 0, 0));
  sliderTime = new Slider(songInfo.title()+"-"+songInfo.author(), 100, 100, width - 200, 10, 0, song[nowPlaying].length(), color(200), color(255, 0, 0));
  fft = new FFT( song[nowPlaying].bufferSize(), song[nowPlaying].sampleRate() );
  song[nowPlaying].loop();
  textFont(font);
}
void draw() {
  background(255);
  btnStart.display();
  btnNextSong.display();
  sliderTime.display();
  if (!pause) {
    sliderTime.play();
  }
}
void mousePressed() {
  btnStart.press();
  btnNextSong.press();
  sliderTime.slide();
}
void mouseReleased() {
  btnStart.release();
  btnNextSong.release();
}
void mouseMoved() {
  btnStart.over();
  btnNextSong.over();
}
void mouseDragged() {
  sliderTime.slide();
}
class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height
  int min, max;
  int pos; // current value
  color baseCol;
  color highlightCol;
  int pos() {
    return pos;
  }
  Slider(String s, int xp, int yp, int sw, int sh, int mi, int ma, color bc, color hc) {
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
      pos = (int)map(mouseX, x, x+w, min, max);
      song[nowPlaying].cue(pos);
    }
  }
  void play() {
    pos = song[nowPlaying].position();
  }
  void display() {
    fill(baseCol);
    noStroke();
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);
    textSize(15);
    fill(0);
    text(name, x, y - h/2);
    text(formatTime(pos), x-10, y+h+20); 
    text(formatTime(max), x+w-10, y+h+20);
  }

  String formatTime(int milliseconds) {

    int minute = floor(milliseconds / 60000);
    int second = floor(milliseconds%60000 / 1000);
    if (second<10) {
      return minute + ":0"+second;
    } else {
      return minute + ":"+second;
    }
  }
}
class PlayButton {
  String name;
  int x, y;
  int size;
  color baseCol;
  color overCol;
  color pressCol;
  boolean over = false;
  boolean pressed = false;
  boolean checked = false;
  boolean isChecked() {
    return checked;
  }
  PlayButton(String s, int xp, int yp, int sz, color b, color o, color p) {
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
      checked = !checked;
      if (checked) {
        song[nowPlaying].pause();
      } else {
        song[nowPlaying].play();
      }
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
    textSize(60);
    text(name, x+size+10, y+size);
    if (checked) {
      //fill(255);
      beginShape();
      vertex(x, y);
      vertex(x+size, y+size/2);
      vertex(x, y+size);
      endShape(CLOSE);
    } else {
      rect(x+size/8, y, size/4, size);
      rect(x+size/8*5, y, size/4, size);
    }
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
      song[nowPlaying].pause();
      song[nowPlaying].rewind();
      if(nowPlaying<songNum-1)
        nowPlaying++;
      else
        nowPlaying = 0;
      song[nowPlaying].play();
      songInfo = song[nowPlaying].getMetaData();
      sliderTime = new Slider(songInfo.title()+"-"+songInfo.author(), 100, 100, width - 200, 10, 0, song[nowPlaying].length(), color(200), color(255, 0, 0));
  
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
    textSize(60);
    text(name, x+size+10, y+size);
  }
}

