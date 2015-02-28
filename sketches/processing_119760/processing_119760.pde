
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
Piano[] piano;


void setup() {
  size(600, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  piano = new Piano[13];
  piano[0]= new Piano("C3", 'q');
  piano[1]= new Piano("C#3", '2');
  piano[2]= new Piano("D3", 'w');
  piano[3]= new Piano("D#3", '3');
  piano[4]= new Piano("E3", 'e');
  piano[5]= new Piano("F3", 'r');
  piano[6]= new Piano("F#3", '5');
  piano[7]= new Piano("G3", 't');
  piano[8]= new Piano("G#3", '6');
  piano[9]= new Piano("A3", 'y');
  piano[10]= new Piano("A#3", '7');
  piano[11]= new Piano("B3", 'u');
  piano[12]= new Piano("C4", 'i');
  println("White keys: Q to I");
  println("Black keys: 2 to 7");
  println("enjoy!");
}

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < out.bufferSize() - 1; i++)
  {//draw wave forms
    line(i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50);
    line(i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50);
  }
  for (int i = 0; i<piano.length;i++) { 
    piano[i].update();
  }
}

void stop() {  
  out.close();
  minim.stop();
  super.stop();
}

////

class Piano {
  String pitch;
  int locked = 0;
  char keybind;
  Piano(String a, char b) {
    pitch = a;    
    keybind = b;
  }
  void play() {
    if (locked < 1) {
      out.playNote( 0.0, 1.0, pitch);
      locked = 10;
    }
  }
  void update() {
    locked -=1;
    if (keyPressed) {
      if (key == keybind) {
        play();
      }
    }
  }
}



