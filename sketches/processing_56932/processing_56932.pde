
class Ball {

  float x, y;
  float s;
  MidiBus myBus; // The MidiBus

  int channel;
  int note;
  int velocity = 127;
  color c;

  Ball(MidiBus mb, int n, int ch) {
    x = mouseX;
    y = mouseY;
    myBus = mb;
    note = n;
    channel = ch;
    s = 1;
    c = color(random(255), random(255), random(255));

  }

  void update() {
    if (s ==1) {
      myBus.sendNoteOn(channel, note, velocity); // Send a Midi noteOn
      myBus.sendControllerChange(channel, 0, 90); // Send a controllerChange
    }
    s++;
    if (s == 70) {
      myBus.sendNoteOff(channel, note, velocity); // Send a Midi nodeOff
      myBus.sendControllerChange(channel, 0, 90); // Send a controllerChange
      
      removeBall(this);
    }
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, s, s);
  }
}


