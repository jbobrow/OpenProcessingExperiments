

import oscP5.*;
import netP5.*;
import rwmidi.*;

OscP5 oscP5;
MidiInput entrada;
MidiOutput saida;

int notaManEsqx=0;
int notaManEsqy=0;
int notaManDerx=0;
int notaManDery=0;
int [] ton= new int [4];


void setup() {
  oscP5 = new OscP5(this, "255.255.255.255", 7110); //obxeto Osc //Ip por defecto: "127.0.0.1"
  entrada = RWMidi.getInputDevices()[0].createInput(this);
  saida = RWMidi.getOutputDevices()[0].createOutput();
}
void noteOnReceived(Note note) {
  println("ton/pitch " + note.getPitch());
} 

void draw() {
  saida.sendNoteOn(0, ton[0], 127);
  saida.sendNoteOn(1, ton[1], 1);
  saida.sendNoteOn(2, ton[2], 1);
  saida.sendNoteOn(3, ton[3], 1);
  delay(200);
  saida.sendNoteOff(0, ton[0], 90);
  saida.sendNoteOff(1, ton[1], 127);
  saida.sendNoteOff(2, ton[2], 127);
  saida.sendNoteOff(3, ton[3], 127);

  ton[0]=notaManEsqx;
  ton[1]=notaManEsqy;
  ton[2]=notaManDerx;
  ton[3]=notaManDery;
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/joint")) {
    String bodyPart = msg.get(0).stringValue();
    if (bodyPart.equals("l_hand")) {
      float manEsqx = msg.get(2).floatValue();
      notaManEsqx=int(map(manEsqx, 0, 1, 0, 127)); //mapeado para o valor x de l_hand
      float manEsqy = msg.get(3).floatValue();
      notaManEsqy=int(map(manEsqy, 0, 1, 0, 127));
    }
    if (bodyPart.equals("r_hand")) {
      float manDerx = msg.get(2).floatValue();
      notaManDerx=int(map(manDerx, 0, 1, 0, 127)); 
      float manDery = msg.get(3).floatValue();
      notaManDery=int(map(manDery, 0, 1, 0, 127));
    }
  }
}



