


import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
int numberOfSong =16; // ****
AudioPlayer [] song = new AudioPlayer[numberOfSong]; // the number of song
FFT fft;

Button []b = new Button[numberOfSong];


boolean pause = false, mute=false;

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
    if ((mouseX >=x ) && (mouseX <= x+size) && (mouseY >= y) && (mouseY <= y+size)) {
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
    rect(x, y, size, size);
    
  }
}

PFont f;

void setup() {
  size(600, 600);
  f = createFont("Arial",16,true); 
  
 

  minim = new Minim(this);
  for (int i=0; i<numberOfSong; i++) {
    song[i] = minim.loadFile("0"+(i+1)+".mp3"); // set song 04.mp3 ~ 06.mp3  // ****
  }

  fft = new FFT( song[0].bufferSize(), song[0].sampleRate() );

  for (int i=0; i<numberOfSong; i++) {
    b[i] = new Button(""+(i+50), 200 +(50*floor(i/4)), 200+100*(i%4), 50, color(100), color(100), color(0, 0, 0));  
  }
}

void draw() {
  
 
  
  background(0);

rect(100,100,400,50);
fill(0);
rect(170,200,250,350);


  textFont(f);       
  fill(255);

 

  textAlign(CENTER);
  text("Daft Punk Launch Player.",width/2,120); 
 
  
  for (int i=0; i<numberOfSong; i++) {
    println(song[i].position()+"  "+song[i].length());
    if (song[i].position() >= song[i].length()-20){
      song[i].pause();
      song[i].rewind();
      println(i);
    }
  }

  for (int i=0; i<numberOfSong; i++) {
    if (b[i].isPressed()){
      fft = new FFT( song[i].bufferSize(), song[i].sampleRate() );
      song[i].play();
    }
      
  }

  for (int i=0; i<numberOfSong; i++) {
    b[i].display();
  }
}



void mousePressed() {
   for (int i=0; i<numberOfSong; i++) {
    b[i].press();
  }
}
void mouseReleased() {
  for (int i=0; i<numberOfSong; i++) {
    b[i].release();
  }
}
void mouseMoved() {
  for (int i=0; i<numberOfSong; i++) {
    b[i].over();
  }
}
