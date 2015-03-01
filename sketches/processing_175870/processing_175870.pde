
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 
 

class Button {
String name;
int x, y;
int size;
color baseCol;
color overCol;
color pressCol; boolean over = false; boolean pressed = false;
boolean isPressed() {
return pressed; }
Button(String s, int xp, int yp, int sz, color b, color o, color p) { name = s;
x=xp;
y=yp;
size = sz; baseCol = b; overCol = o; pressCol = p;
}

void over() {
  float dx = mouseX -x; 
  float dy= mouseY-y; 
  float d = sqrt(dx*dx+dy*dy);
if (d<=size/2) { 
over = true; } else {
over = false; }
}
void press() { if (over) {
pressed = true;
println(name + " button clicked"); }
}
void release() {
pressed = false; }
void display() { if (pressed) {
fill(pressCol); } else if (over) { fill(overCol);
} else {
fill(baseCol); }
stroke(255);
ellipse(x, y, size, size); 
textSize(15);
text(name,x+size,y+size);

 
 
} }
 
Button b1, b2, b3;
void setup() {
size(500, 300);

 minim = new Minim(this);
  song = minim.loadFile("Deep Purple-Hush.mp3");
  song.loop();
 
  fft = new FFT( song.bufferSize(), song.sampleRate() );

b1 = new Button("R", 100, 230, 50,color(100), color(100), color(0, 0, 0)); 
b2 = new Button("P",250, 230, 50,color(100), color(100), color(0, 0, 0)); 
b3 = new Button("F", 400, 230, 50, color(100), color(100), color(0, 0, 0));
}
void draw() {
background(255);

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

 float lbx = map(loopBegin, 0, songLength, 0, width);
  float lex = map(loopEnd, 0, songLength, 0, width);
  stroke(0);
  line(lbx, 0, lbx, height);
  stroke(255, 100, 100);
  line(lex, 0, lex, height);
  stroke(0);

// display volume changes in left and right channels
  for (int i = 0; i < song.bufferSize () - 1; i++)
  { // left.get(i) and right.get(i) returns -1 ~ 1 volume value 
    // in left and right channel respectivey
    // you can also use mix.get(i) for combined sound
    line(i, 50  + song.left.get(i)*50, i+1, 50  + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }




if (b1.isPressed())
song.skip(-1000);
if (b2.isPressed())
background(0, 0, 0); 
if (b2.isPressed())
 song.pause();
 else song.play();

if (b3. isPressed())  
song.skip(1000); // 
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
