
/* projeto sound_escapes
 *
 * Criacao de panoramas visuais a partir de paisagens sonoras.
 * Atraves de análise de bandas do espectro FFT
 * o sinal e' dividido em 30 bandas e convertido para valores
 * de volume por banda de frequencia.  
 * Sao usados 4 grupos: 
 * o horizonte de chao em 3 bandas ate aos 170 Hz
 * formas retangulares no rodape em 3 bandas dos 170 aos 400 Hz
 * a elipse central em bandas de 860 aos 1024Hz
 * os circulos que formam o ceu com valores nas freq 3500, 4000 e 5000 Hz
 * 
 *  jjbacelar_at_gmail.com
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer gravacao;
//FFT fft;
FFT fftLin;
//FFT fftLog;

//int widthsize = 800;
//int heightsize = int (widthsize / 1.618); // define proporção aurea

String audionome = "do.castelo.mourao.1998.mp3";
// pastor.luz.1998.mp3
// conversa.mercearia.luz.1998.mp3
// barrancos.missa.1998.mp3

void setup() {
  size(800, 495);
  background(0);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100); // modo, máx hue, max sat, max bright
  rectMode(CENTER);
  ellipseMode(CENTER);
  minim = new Minim(this);

  gravacao = minim.loadFile(audionome, 2048);
  //gravacao.loop();
  gravacao.play();

  fftLin = new FFT(gravacao.bufferSize(), gravacao.sampleRate());
  fftLin.linAverages(30); // divide o spectrum em (n) partes
}



void draw() {

  noStroke();
  fill(0, 1.5);
  rect(width/2, height, width, 100); // rodape

  float centerFrequency = 0;
  fftLin.forward(gravacao.mix);

  // println(fftLin.specSize());
  //println(fft.specSize());


  // FORMAS DO FUNDO - CENARIO CHAO - LOW FREQ  0-170Hz

  for (int i = 0; i < fftLin.specSize()/6; i+=4) { // primeiro sexto do espectro
    float hue= map(fftLin.getBand(i), 0, 10, 100, 255); // obtem valor amplit das bandas
    float s = map(fftLin.getBand(i+1), 0, 15, 0, 100);
    float y = heightsize + map(fftLin.getBand(i+2), 0, 10, -heightsize/2, heightsize/2);
    float x = widthsize + map(fftLin.getBand(i+3), 0, 10, -widthsize/2, widthsize/2);
    // println("i=" +i+ " i+2=" +(i+2)+ " i+3=" +(i+3));

    noStroke();
    fill(hue, 80, 100, 20);
    rect(random(widthsize), y, s, s);
  }

  // FORMAS RODAPE - MED FREQS 170-400Hz

  for (int i = fftLin.specSize()/6; i < 2*fftLin.specSize()/6; i+=4) { // segundo sexto
    float hue= map(fftLin.getBand(i), 0, 0.5, 0, 50);
    float s = map(fftLin.getBand(i+1), 0, 0.5, 0, 50);
    // float y = heightsize/2 + map(fftLin.getBand(i+2), 0, 0.5, heightsize/2, heightsize/2);
    float x = widthsize/2 + map(fftLin.getBand(i+2), 0, 0.2, -widthsize/2, widthsize/2);
    // println("x=" +x+ " | i= " +i);

    noFill();
    stroke(hue, 100, 100, 50);
    rect(x, heightsize-20, s, s);
  }

  // CIRCULO DE AGUDOS - HIGH FREQS 1 860-1024Hz

  for (int i = 5*fftLin.specSize()/6; i < fftLin.specSize(); i++) {
    float hue= map(fftLin.getBand(i), 0, 0.4, 200, 360);
    float s = map(fftLin.getBand(i+1), 0, 0.4, 0, 100);
    float r = map(fftLin.getBand(i+2), 0, 0.5, 0, 100);
    float t = map(fftLin.getBand(i+3), 0, 0.5, -widthsize/4, widthsize/4);
    float x = widthsize/2 +t*cos(r)*random(0.5);
    float y = heightsize/2 +t*sin(r);
    // println("x=" +x+ " | i= " +i);

    stroke(hue, hue, s, 10);
    strokeWeight(1);
    ellipse(x, y, s, s);
  }

  //  // FORMAS DE CEU - HIGH FREQS 2 - 3500-5000Hz

  for (int i = 0; i < 20; i++) {
    float hue= map(fftLin.getFreq(4000), 0, 0.5, 0, 360);
    float s = map(fftLin.getFreq(3500), 0, 0.5, 0, 20);
    // println(fftLin.getFreq(3500));
    float yfreq = map(fftLin.getFreq(5000), 0, 0.5, height/2, 0);
    float x = random(0, widthsize);
    float y = random(0, heightsize/2);

    // println("hue="+hue+ " s="+s+ " x="+x+ " y="+y);

    stroke(hue, 100, 50, 50);
    strokeWeight(1);
    ellipse(x, y-yfreq, s, s);

    // textFont(10,16);
    // fill(255, 100); 
    text(audionome, 10, height-10);
    
  }

  if ( gravacao.isPlaying() ) {
    } 
  else {
    saveFrame(audionome+"_####.png") ;
    println("frame saved");
    super.stop();
    println("stoped");
  }
}


//void keypressed() {
//
//  if (key=='s' ) {
//    saveFrame() ;
//    println("frame saved");
//  }
//}


void stop()
{
  gravacao.close();
  minim.stop();
  super.stop();
}



