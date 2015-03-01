
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

    rect(x, y, size, size);
  }
}



Button b1, b2, b3;

void setup() {

  size(600, 600);



  minim = new Minim(this);

  song = minim.loadFile("carol.mp3");

  song.loop();



  fft = new FFT( song.bufferSize(), song.sampleRate() );



  b1 = new Button("B1", 100, 400, 50, color(255, 0, 0), color(255, 255, 0), color(0, 0, 0)); 

  b2 = new Button("B2", 280, 400, 50, color(234, 28, 101), color(252, 112, 164), color(0, 0, 0)); 

  b3 = new Button("B3", 450, 400, 50, color(255, 132, 8), color(240, 178, 245), color(0, 0, 0));
}

void draw() {

  background(252, 246, 224);
  fill(0, 255, 0);
  triangle(300, 0, 150, 150, 450, 150);
  fill(0, 255, 0);
  triangle(300, 100, 50, 300, 550, 300);
  fill(0, 255, 0);
  triangle(300, 200, 10, 450, 590, 450);
  fill(147, 79, 34);
  rect(225, 450, 150, 150);


  if (b1.isPressed())

    song.skip(-1000);

  if (b2.isPressed())

    song.pause();

  else song.play();

  if (b3.isPressed())  

    song.skip(1000); 

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

