
import TUIO.*;
TuioProcessing tuioClient;

import ddf.minim.*;
Minim minim;
AudioInput in;
AudioSample s_neurona;
AudioSample s_neurotransmisor;

boolean anticollapse=true;
int alt=0;

int coreX, coreY;
int coreX2, coreY2;

ArrayList<Cerebro> cerebro= new ArrayList<Cerebro>();
ArrayList<Cerebro_> cerebro_= new ArrayList<Cerebro_>();

void setup() {
  size(1024, 768);
  smooth();
  background(0);
  tuioClient = new TuioProcessing(this);
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 64);
  s_neurona = minim.loadSample( "BD.mp3", 128);
  s_neurotransmisor = minim.loadSample( "SD.mp3", 128);
}

void newCerebro() {
  Cerebro neurona = new Cerebro();
  neurona.newNeurona(coreX, coreY);
  cerebro.add(neurona);
}

void novoCerebro() {
  Cerebro_ astrocito = new Cerebro_();
  astrocito.novoNeurona(coreX2, coreY2);
  cerebro_.add(astrocito);
}

void draw() {
  smooth();

  for (int i=0; i<cerebro.size();i++) {
    cerebro.get(i).draw();
  }

  for (int x=0; x<cerebro_.size();x++) {
    cerebro_.get(x).draw();
  }

  Reaccion();
   noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  if (anticollapse) {
    noStroke();
    fill(0, 20);
    rect(0, 0, width, height);
    anticollapse=false;
  }
}

/*void mousePressed() {
 coreX=mouseX;
 coreY=mouseY;
 newCerebro();
 noStroke();
 fill(0, 20);
 rect(0, 0, width, height);
 }*/

/*void keyPressed() {
 if (key == 's' || key == 'S') {
 save(alt+"acoplamiento.tiff");
 alt++;
 }
 if (key == 'n' || key == 'N') {
 coreX2=int(random(0, width));
 coreY2=int(random(0, height));
 novoCerebro();
 }
 if (key == 'l' || key == 'L') {
 noStroke();
 fill(0);
 rect(0, 0, width, height);
 }
 }*/

void Reaccion() {
  for (int i = 0; i < in.bufferSize()-1; i++) {
    float Val_in = in.left.get(i)*50 + 50;
    if (Val_in>70&&Val_in<70.4) {
      println(Val_in);
      coreX2=int(random(0, width));
      coreY2=int(random(0, height));
      noStroke();
      fill(0, 20);
      rect(0, 0, width, height);
      novoCerebro();
    }
  }
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}


void addTuioCursor(TuioCursor tcur) {
  anticollapse=true;
  coreX=tcur.getScreenX(width);
  coreY=tcur.getScreenY(height);
  newCerebro();
}


