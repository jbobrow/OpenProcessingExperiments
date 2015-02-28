
/**
 * part of the example files of the generativedesign library.
 * shows how to use the Tablet class.
 */

import generativedesign.*;

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SquareWave square;
SawWave saw;
LowPassSP lowpass;

Tablet tablet;
Serial seriais;
//Cronometro cronometros;

String[] data;

int posX, posY, displayX, displayY, cor, oldCor, contador;

float amp;

boolean lowpassOn;

PGraphics drw;
PGraphics srl;


void setup() {

  displayX = 640; //screen.width;
  displayY = 480; //screen.height;
  size(displayX, displayY);
  drw = createGraphics(displayX, displayY, P2D);
  srl = createGraphics(displayX, displayY, P2D);

  tablet = new Tablet(this);

  data = loadStrings("data/contador.txt");
  contador = (int(data[0]));
  seriais = new Serial();
  //  cronometros = new Cronometro();

  minim = new Minim(this);
  out = minim.getLineOut( Minim.STEREO, 512 );
  square = new SquareWave( 440, 0, 44100 );
  saw = new SawWave( 600, 0, 44100 );
  lowpass = new LowPassSP(200, 44100);
  lowpassOn = false;
  out.addSignal(square);
  out.addSignal(saw);

  posX = displayX/2;
  posY = displayY/2;


  drw.beginDraw();
  drw.colorMode(HSB, 360, 100, 100);
  drw.background(0);
  cor = (int) random(0, 360);
  drw.stroke(cor, 100, 100);
  drw.endDraw();

  //stroke(255);
}


void draw() {

  image(drw.get(0, 0, displayX, displayY), 0, 0);
  posY = mouseY;
  posX = mouseX;

  if (mousePressed) {
    if (key == 'd' || key == 'D' || key == 'k' || key == 'K') {
      square.setAmp(0);
      saw.setAmp(0);
    }
    else if (key != 'e') {
      amp = 30 * tablet.getPressure()/6;
      square.setAmp(amp);
      saw.setAmp(amp);
    }
    else if (key == 'e' || key == 'E') {
      amp = amp;
      square.setAmp(amp);
      saw.setAmp(amp);
    }
    drw.beginDraw();
    drw.strokeWeight(30 * tablet.getPressure());
    drw.line(pmouseX, pmouseY, mouseX, mouseY);
    drw.endDraw();
    square.setFreq( posX ); // C3
    saw.setFreq( posY ); // C2
  }
  float pan = map( width/2*tablet.getTiltX(), 0, width/2, -1, 1 );
  square.setPan(pan);
  saw.setPan(-pan);
  if (lowpassOn == true) {
    lowpass.setFreq(200*tablet.getAltitude());
  } 
  print("TiltX: " + nfs(tablet.getTiltX(), 1, 3) + "   " + "TiltY: "
    + nfs(tablet.getTiltY(), 1, 3) + "   ");

  float[] res = new float[2];
  println("Azimuth: " + nfs(tablet.getAzimuth(), 1, 3) + "   " 
    + "Altitude: " + nfs(tablet.getAltitude(), 1, 3) + "  amp: " + amp
    + "  Key: " + key);
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    cor = (int) random(0, 360);
    drw.stroke(cor, 100, 100);
  } 
  else if (key == 'k' || key == 'K') {
    oldCor = cor;
    drw.stroke(0, 100, 0);
    //amp = 0;
    square.setAmp(0);
    saw.setAmp(0);
  }
  else if (key == 'b' || key == 'B') {
    drw.background(0);
  }
  else if (key == 'w' || key == 'W') {
    lowpassOn = !lowpassOn;
    if (lowpassOn == false) {
      out.removeEffect(lowpass);
    } 
    else if (lowpassOn == true) {
      out.addEffect(lowpass);
    }
  } 
  else if (key == 'e' || key == 'E') {
    amp = amp;
    square.setAmp(amp);
    saw.setAmp(amp);
  }
  else if (key == 'd' || key == 'D') {
    //amp = 0;
    square.setAmp(0);
    saw.setAmp(0);
  }
  else if (key == 's' || key == 'S') {
    seriais.desenha();
    background(0);
    drw.background(0);
  }
  //print();
}
void keyReleased() {
  if (key == 'e' || key == 'E') {
    amp = 30 * tablet.getPressure()/6;
    square.setAmp(amp);
    saw.setAmp(amp);
    key = '/';
  }
  else if (key == 'd' || key == 'D') {
    //amp = amp;
    square.setAmp(amp);
    saw.setAmp(amp);
    //if (keyPressed == true) {
    key = 'e';
    //}
  }
  else if (key == 'k' || key == 'K') {
    drw.stroke(cor, 100, 100);
    square.setAmp(amp);
    saw.setAmp(amp);
    key = '/';
  }
  else {
    key = '/';
  }
}

//void mousePressed() {
//  if (key == 'd' || key == 'D') {
//    square.setAmp(0);
//    saw.setAmp(0);
//  }
//  else if (key != 'e') {
//    amp = 30 * tablet.getPressure()/6;
//    square.setAmp(amp);
//    saw.setAmp(amp);
//  }
//  else if (key == 'e' || key == 'E') {
//    amp = amp;
//    square.setAmp(amp);
//    saw.setAmp(amp);
//  }
//}

void mouseReleased() {
  if (keyPressed == false) {
    amp = 0;
    square.setAmp(amp);
    saw.setAmp(amp);
  }
  else if (key == 'e' || key == 'E') {
    amp = amp;
    square.setAmp(amp);
    saw.setAmp(amp);
  }
  key = '/';
}
void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

class Serial { // Nome da Classe
  PFont fontSerie;
  int textH;

  Serial() { // Construtor
    fontSerie = loadFont("data/OCRAStd-28.vlw");
  }

  void desenha() { // Funcionamento
    textFont(fontSerie, height/20);
    fill(255);

    textH = height-13;

    textAlign(LEFT);
    text ("Serial#" + contador, 20, textH);
    textAlign(CENTER);
    text ("MúsicaVisual", width/2, textH);

    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.

    textAlign(RIGHT);
    text (d + "/" + m + "/" + y, width - 20, textH);

    contador++;
    data[0] = str(contador);
    saveStrings ("data/contador.txt", data);

    myDelay(3000);

    save("artes/MusicaVisual_" + contador + ".tif");
    //println("saving to pdf – finishing");
    //endRecord();
    //println("saving to pdf – done");
  }

  void myDelay(int ms)
  {
    try
    {    
      Thread.sleep(ms);
    }
    catch(Exception e) {
    }
  }
}



