
import themidibus.*;

int channel = 0;
int pitch = 64;
int velocity = 127;

MidiBus myBus;
int t0 = -1;

void setup()
{
  MidiBus.list();
  myBus = new MidiBus(this, -1, 1);

}

void draw() {
  if (t0 == -1)
  {
    myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
    t0 = millis();
  }
  else if (millis() > t0 + 2000)
  {
    myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
    background(#F00000);
  }
}

