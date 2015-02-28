
//Part of this code is based on:
//http://openprocessing.org/visuals/?visualID=74906  by Shahrouz Varshabi
//licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//License: 
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/




import oscP5.*;
import netP5.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

OscP5 oscP5;
Minim minim;
AudioInput son;
FFT fft;

float [] cor = new float [10];
float [] kinectx= new float [5];
float [] kinecty= new float [5];
int cantP = 1000;
float mX;
float mY;


particula sistManEsq[] = new particula[cantP];
particula sistManDer[] = new particula[cantP];
particula sistCodoEsq[] = new particula[cantP];
particula sistCodoDer[]= new particula[cantP];
particula sistCaderEsq[]= new particula[cantP];




void setup() {
  size(displayWidth, displayHeight, OPENGL);
  background(0);
  colorMode(RGB, 100);
  oscP5 = new OscP5(this, "255.255.255.255", 7110); //obxeto Osc. Ip por defecto: "127.0.0.1"

  minim=new Minim(this); //inicializando Minim
  son=minim.getLineIn(); //rexistra a entrada de son con minim
  //analisis fft da entrada de son
  fft=new FFT(son.bufferSize(), son.sampleRate());
  fft.logAverages(22, 3); 
  inicializaObxetos ();
  smooth();
}

void draw() {

  fill(0, 20); // semi-transparente branco
  rect(0, 0, width, height);
  fft.forward(son.mix);
  cores ();
  buclesSistemas();
}

void stop()
{
  //pecha as clases de minim.
  son.close();
  minim.stop();
  
  super.stop();
}
void buclesSistemas() {
  for (int i = 0; i < cantP; i++) {
    sistManEsq[i].renderizado(kinectx[0], kinecty[0], cor[4], 25, cor[8]);
  }
  for (int i = 0; i < cantP; i++) {
    sistManDer[i].renderizado(kinectx[1], kinecty[1], cor[3], 25, cor[8]);
  }
  for (int i = 0; i < cantP; i++) {
    sistCodoEsq[i].renderizado(kinectx[2], kinecty[2], cor[3], 227, 125);
  }
  for (int i = 0; i < cantP; i++) {
    sistCodoDer[i].renderizado(kinectx[3], kinecty[3], cor[3], 239, 73);
  }
  for (int i = 0; i < cantP; i++) {
    sistCaderEsq[i].renderizado(kinectx[4], kinectx[4], cor[3], cor[4], 0);
  }
}




class particula {
  float X;
  float Y;
  float Xvel;
  float Yvel;
  float pX;
  float pY;
  float w;
  float cor1;
  float cor2;
  float cor3;
  float posx;
  float posy;
  particula() {
    X=0;
    Y=0;
    w = random(1 / 5, 5);
  }
  void renderizado(float tempPosx, float tempPosy, float tempC1, float tempC2, float tempC3) {
    posx=tempPosx;
    posy=tempPosy;
    cor1=tempC1;
    cor2=tempC2;
    cor3=tempC3;

    Xvel /= 1.05;
    Yvel /= 1.05;

    Xvel += 0.01 * (mX - X) * w;
    Yvel += 0.01 * (mY - Y) * w;
    X += Xvel;
    Y += Yvel;
    strokeWeight(1);
    fill(255, 255, 255);
    stroke(cor1, cor2, cor3);
    line(X, Y, pX, pY);
    pX = X;
    pY = Y;

    mX += 0.3 * (posx - mX);
    mY += 0.3 * (posy - mY);
  }
}


void cores () {
  cor[0] = map(fft.getAvg(0), 0, 69, 0, 255);
  cor[1] = map(fft.getAvg(1), 0, 106, 0, 225);
  cor[2] = map(fft.getAvg(2), 0, 119, 0, 255);
  cor[3] = map(fft.getAvg(3), 0, 66, 0, 255);
  cor[4] = map(fft.getAvg(4), 0, 29, 0, 255);
  cor[5] = map(fft.getAvg(5), 0, 16, 0, 255);
  cor[6] = map(fft.getAvg(6), 0, 15, 0, 255);
  cor[7] = map(fft.getAvg(7), 0, 7, 0, 255);
  cor[8] = map(fft.getAvg(8), 0, 3, 0, 255);
  cor[9] = map(fft.getAvg(9), 0, 0, 0, 255);
}

void inicializaObxetos () {

  for (int i = 0; i < cantP; i++) {
    sistManEsq[i] = new particula();
  }
  for (int i = 0; i < cantP; i++) {
    sistManDer[i] = new particula();
  }
  for (int i = 0; i < cantP; i++) {
    sistCodoEsq[i] = new particula();
  }
  for (int i = 0; i < cantP; i++) {
    sistCodoDer[i] = new particula();
  }
  for (int i = 0; i < cantP; i++) {
    sistCaderEsq[i] = new particula();
  }
}


//funcion que inicializa a comunicacion OSC e a recepciÃ�Â³n das posiciÃ�Â³ns X e Y das articulaciÃ�Â³ns
void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/joint")) {
    String bodyPart = msg.get(0).stringValue();
    if (bodyPart.equals("l_hand")) {
      float manEsqx = msg.get(2).floatValue();
      kinectx[0]=int(map(manEsqx, 0, 1, 0, width)); //reescala os valores osc (0,1) 
      float manEsqy = msg.get(3).floatValue();
      kinecty[0]=int(map(manEsqy, 0, 1, 0, height));
    }
    if (bodyPart.equals("r_hand")) {
      float manDerx = msg.get(2).floatValue();
      kinectx[1]=int(map(manDerx, 0, 1, 0, width)); 
      float manDery = msg.get(3).floatValue();
      kinecty[1]=int(map(manDery, 0, 1, 0, height));
    }
    if (bodyPart.equals("l_elbow")) {
      float codoEsqx = msg.get(2).floatValue();
      kinectx[2]=int(map(codoEsqx, 0, 1, 0, width));
      float codoEsqy = msg.get(3).floatValue();
      kinecty[2]=int(map(codoEsqy, 0, 1, 0, height));
    }
    if (bodyPart.equals("r_elbow")) {
      float codoDerx = msg.get(2).floatValue();
      kinectx[3]=int(map(codoDerx, 0, 1, 0, width)); 
      float codoDery = msg.get(3).floatValue();
      kinecty[3]=int(map(codoDery, 0, 1, 0, height));
    }
    if (bodyPart.equals("l_hip")) {
      float caderDerx = msg.get(2).floatValue();
      kinectx[4]=int(map(caderDerx, 0, 1, 0, width));
      float caderDery = msg.get(3).floatValue();
      kinecty[4]=int(map(caderDery, 0, 1, 0, height));
    }
  }
}



