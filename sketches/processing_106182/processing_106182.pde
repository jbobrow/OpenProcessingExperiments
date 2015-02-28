
import themidibus.*;
MidiBus myBus;
int nextKey=(int)random (8);

void setup() {
  size (450, 800);
  background(0);
  MidiBus.list();
  myBus = new MidiBus(this, -1, "Java Sound Synthesizer");
}




void draw() {
  int keystruck = -1;
  if (mousePressed) {
    keystruck = mouseX/(width/8);
  }



  for (int i = 0; i < 8; i++) {
    if (keystruck == i) {
      fill(225, 0, 0);
      if(nextKey==i) {
       nextKey=(int)random (8);
        
      }
      myBus.sendNoteOn(0, 100 - (i*10), 127); // Send a Midi noteOn
      delay(0);
      myBus.sendNoteOff(0, 25, 127); // Send a Midi nodeOff
    }
    else if (nextKey==i) {
      fill(0,255,0);
    }
    else {
      fill(0, 0, 255);
    }

    rect((width/8) * i + 10, 20, width/8-20, height/9*i + 100);
  }
}
