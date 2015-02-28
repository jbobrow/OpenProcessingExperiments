
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
HighPassSP highPass;
LowPassSP lowPass;
FFT fft;
Button[] buttons;

final int FFT_MIN_BAND = 22;
final int FFT_OCTAVE_DIVS = 3;
final float WAVE_BANDS = 128;

float hW, hS, hC;

void setup() {
  size(800, 350, P2D);
  background(0);
  smooth();
  
  minim = new Minim(this);
  song = minim.loadFile("song.mp3", 1024);
  lowPass = new LowPassSP(2000, song.sampleRate());
  highPass = new HighPassSP(2000, song.sampleRate());
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(FFT_MIN_BAND, FFT_OCTAVE_DIVS);
  
  // Imposta le dimensioni delle componenti e inizializza i pulsanti
  hC = 40;
  hW = (height - hC) / 2;
  hS = (height - hC) / 2;
  setupControls(0, (hS + hW), width, hC);
  
  song.play();
}

void setupControls(float x, float y, float w, float h) {
  // Inizializza i pulsanti

  fill(0, 32);
  noStroke();
  float gapX = 8;
  float gapY = 8;
  float buttonW = w/5;
  float buttonH = h - 2*gapY;
  float buttonY = y + h - gapY - buttonH;
  
  float playW = buttonH;
  float playX = w - playW * 3 - gapX * 3;
  float pauseX = playX + playW + gapX;
  float rewindX = pauseX + playW + gapX;
  
  float lowPassX = gapX;
  float highPassX = lowPassX + buttonW + gapX;
  float volumeX = highPassX + buttonW + gapX;
  
  Button lowPassB = new LowPassButton(lowPassX, buttonY, buttonW, buttonH, song);
  Button highPassB = new HighPassButton(highPassX, buttonY, buttonW, buttonH, song);

  Button playB = new PlayButton(playX, buttonY, playW, buttonH, song);
  Button pauseB = new PauseButton(pauseX, buttonY, playW, buttonH, song);
  Button rewindB = new RewindButton(rewindX, buttonY, playW, buttonH, song);
  buttons = new Button[] { 
    lowPassB, highPassB, playB, pauseB, rewindB
  };
}

void draw() {
  // Disegna le componenti
  drawWaveform(0, 0, width, hW);
  drawSpectrum(0, hW, width, hS);
  drawControls(0, (hS + hW), width, hC);
}

void drawWaveform(float x, float y, float w, float h) {
  // Disegna la forma d'onda
  
  colorMode(RGB, 255, 255, 255, 255);
  fill(0, 255);
  noStroke();
  rect(x, y, w, h);
  
  float[] mix = song.mix.toArray();
  float bandSize = w / WAVE_BANDS;
  float nSamplesBand = mix.length / WAVE_BANDS;
  colorMode(RGB, 1, 1, 1, h/2);
  for (int i = 0; i < WAVE_BANDS; i++)
  {
    float x1 = i * bandSize;
    float x3 = (i + 2) * bandSize;
    float x2 = (x1 + x3) / 2;
    float y1 = h/2;
    float y3 = h/2;
    float avgAmp = 0;
    for (int j = 0; j < nSamplesBand; j++) {
      avgAmp += mix[i+j] * 100;
    }
    avgAmp /= nSamplesBand;
    float y2 = h/2 - avgAmp;

    y1 = constrain(y1, 0, h);
    y2 = constrain(y2, 0, h);
    y3 = constrain(y3, 0, h);

    noStroke();    
    float amp = map(y2, 0, h, -h/2, h/2);
    fill(1,1,1, constrain(abs(amp), h/12, h/3));
    triangle(x1,y1,x2,y2,x3,y3);
    triangle(x1,y1,x2,y2-2*amp,x3,y3);
  }
}

void drawSpectrum(float x, float y, float w, float h) {
  // Disegna lo spettro
  
  PImage img = get(int(x), int(y), int(w), int(h));
  fill(0, 16);
  noStroke();
  rect(x, y, w, h);

  noStroke();
  fft.forward(song.mix);
  int n_bands = fft.avgSize();
  float bandSize = (float) w / n_bands; 
  colorMode(HSB, n_bands * 4/3, h, 1, 255);
  
  for (int i = 0; i < n_bands; i++) {
    float x0 = i * bandSize;
    float y0 = y + h;
    float x1 = (i+1) * bandSize;
    float y1 = y0;
    float x2 = (x0 + x1) / 2;
    float amp = fft.getAvg(i); // * 512 / song.bufferSize();
    float y2 = y0 - amp;
    y2 = constrain(y2, y, y0);
    fill(i, amp * 12, 1, 255);
    triangle(x0, y0, x1, y1, x2, y2);
  }

  colorMode(RGB, 255,255,255, 255);
  tint(255,255,255, 128);
  image(img, x, y);
  noTint();
}

void drawControls(float x, float y, float w, float h) {
  // Disegna i pulsanti
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].isMouseOver()) {
      buttons[i].pressed();
    }
  }
}

void mouseDragged() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].isMouseOver()) {
      buttons[i].pressed();
    }
    else {
      buttons[i].unpressed();
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].isMouseOver()) {
      buttons[i].released();
    }
    else {
      buttons[i].unpressed();
    }
  }
}

