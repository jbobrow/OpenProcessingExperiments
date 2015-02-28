
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
BeatDetect beatSound;
BeatDetect beatEnergy;

final int FFT_MIN_BAND = 60;
final int FFT_OCTAVE_DIVS = 3;
final int RANDOM_PARTICLES = 10;
final int FOUNTAIN_PARTICLES = 10;
final float[] VX_BOUNDS = {0, 0};
final float[] VY_BOUNDS = {4, 2};
boolean altColors = false;

void setup() {
  size(600, 600, P2D);
  background(0);
  smooth();

  minim = new Minim(this);
  song = minim.loadFile("song.mp3", 1024);

  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(FFT_MIN_BAND, FFT_OCTAVE_DIVS);

  beatSound = new BeatDetect();
  beatEnergy = new BeatDetect(song.bufferSize(), song.sampleRate());

  song.loop();
}

void draw() {
  // Effettua il beat detection
  beatSound.detect(song.mix);
  beatEnergy.detect(song.mix);

  // Calcola l'intensità sonora
  calcAmp();
  
  // Crea il motion blur
  colorMode(RGB, 255, 255, 255, 255);
  float alpha = map(mouseX, 0, width, 0, 255);
  fill(0, alpha);
  rect(0, height/6, width, 5*height/6);
  fill(0, 32);
  rect(0, 0, width, height/6);
  
  // Disegna le varie parti dell'animazione
  drawCentralTriangle();
  drawRotatingTriangles();
  drawRandomTriangles();
  //drawFountainTriangles();
  drawBeatTriangles();
}

void drawBeatTriangles() {
  // Disegna i triangoli alla rilevazione di beat
  
  float bMin = 0;
  float bMax = 100;
  float bInit = bMax/4;
  float b = bInit;
  float h = b;
  float hMax = bMax;

  b = constrain(b, bMin, bMax);
  h = b;

  float sat = map(mouseY, 0, height, 0, 1);

  int minBands = 3;
  int range = 3;
  int count = 0;
  for (int i = 0; i < 27; i += range+1) {
    int firstBand = i;
    int lastBand = constrain(i + range, 0, 26);
    colorMode(RGB,255,255,255,255);
      if (beatEnergy.isRange(firstBand, lastBand, minBands)) {
        fill(255, 140, 0, 50);
        b = bMax/2;
      } else {
        fill(255, 255, 255, 5);
      }
    if (altColors) {
      colorMode(HSB, 1, 1, 1, 1);
      fill(random(0,1), sat, 1, 0.20);
    }

    for (; b >= bMin; b -= 10) {
      h = b;
      float x1 = bMax/2 - b/2 + bMax*count;
      float x2 = bMax/2 + b/2 + bMax*count;
      float x3 = bMax/2 + bMax*count;
      float y1 = hMax/2 + h/2;
      float y2 = hMax/2 + h/2;
      float y3 = hMax/2 - h/2;

      noStroke();
      triangle(x1, y1, x2, y2, x3, y3);
    }
    b = bInit;
    count++;
  }
}

float avgAmp;
float maxAmp;
float meanSqAmp;

void calcAmp() {
  // Calcola l'intensità sonora
  
  avgAmp = 0;
  maxAmp = 0;
  float[] mix = song.mix.toArray();
  for (int i = 0; i < mix.length; i++) {
    float amp = abs(mix[i]);
    avgAmp += amp;
    meanSqAmp += pow(amp, 2);
    maxAmp = maxAmp > amp ? maxAmp : amp;
  }
  avgAmp /= mix.length;
  meanSqAmp = sqrt((float)1/mix.length * avgAmp);
}

boolean isFreqBeat() {
  // Rileva la presenza di beat
  
  int minBands = 3;
  int range = 6;
  for (int i = 0; i < 27; i += range+1) {
    int firstBand = i;
    int lastBand = constrain(i + range, 0, 26);
    if (beatEnergy.isRange(firstBand, lastBand, minBands)) {
      return true;
    }
  }
  return false;
}

ArrayList<RotatingTriangle> rotTs = new ArrayList();
float rtHue = 0;
float angleStart = PI/2;
float angle = angleStart;
float angleIncr = PI/128;

void drawRotatingTriangles() {
  // Disegna i triangoli in rotazione
  
  colorMode(HSB);
  rtHue %= 1;
  rtHue += 0.005;
  color c = color(rtHue, 1, 1);
  
  rotTs.add(new RotatingTriangle(0, c, angle)); 
  rotTs.add(new RotatingTriangle(avgAmp, c, angle));
  rotTs.add(new RotatingTriangle(avgAmp, c, angle + PI/2));
  rotTs.add(new RotatingTriangle(avgAmp, c, angle + PI));
  rotTs.add(new RotatingTriangle(avgAmp, c, angle + 3*PI/2));
  angle += angleIncr;
  
  for (int i = 0; i < rotTs.size(); i++) {
    RotatingTriangle t = rotTs.get(i);
    if (t.hasExpired(angle)) {
      rotTs.remove(t);
    } else {
      t.display();
      t.update();
    }
  }
}

float noiseGen = 0;
float avgColor;

void drawCentralTriangle() {
  // Disegna il triangolo centrale
  
  float bMin = 0;
  float bMax = 150;
  float b = bMin;
  float h = b;

  b = avgAmp * bMax * 3;
  b = constrain(b, bMin, bMax);
  h = b;

  colorMode(HSB, 1, 1, 1, 1);
  float hue = map(b, bMin, bMax, 0.15, -0.05);
  hue = constrain(hue, 0.00, 0.15);
  avgColor = hue;
  float sat = map(mouseY, 0, height, 0, 1);
  if (altColors) {
    noiseGen += 0.1;
    fill(noise(noiseGen), sat, 1, 0.25);
  } else {
    fill(hue, sat, 1, 0.25);
  }
    
  for (; b >= bMin; b -= 10) {
    h = b;
    float x1 = width/2 - b/2;
    float x2 = width/2 + b/2;
    float x3 = width/2;
    float y1 = height/2 + h/2;
    float y2 = height/2 + h/2;
    float y3 = height/2 - h/2;

    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
  }
}

ArrayList<ArrayList<Particle>> particleArrays = new ArrayList();

void drawRandomTriangles() {
  // Disegna i triangoli in sottofondo
  
  colorMode(RGB,255,255,255,255);
  fill(255, 64);
  stroke(255, 0);
  
  if (isFreqBeat()) {
    ArrayList<Particle> particles = new ArrayList();
    randomParticles(particles);
    particleArrays.add(particles);
  }
  
  for (int i = 0; i < particleArrays.size(); i++) {
    ArrayList<Particle> particles = particleArrays.get(i);
    for (int j = 0; j < particles.size(); j++) {
      Particle p = particles.get(j);
      if (p.isOutOfBounds()) {
        particles.remove(p);
      } else {
        p.display();
        p.update();
      }
    }
    if (particles.size() == 0) {
      particleArrays.remove(particles);
    }
  }
}

void drawFountainTriangles() {
  // Disegna i triangoli nella parte destra dell'animazione)
  
  colorMode(RGB,255,255,255,255);
  fill(255, 64);
  stroke(255, 0);
  
  if (isFreqBeat()) {
    ArrayList<Particle> particles = new ArrayList();
    fountainParticles(particles);
    particleArrays.add(particles);
  }
  
  for (int i = 0; i < particleArrays.size(); i++) {
    ArrayList<Particle> particles = particleArrays.get(i);
    for (int j = 0; j < particles.size(); j++) {
      Particle p = particles.get(j);
      if (p.isOutOfBounds()) {
        particles.remove(p);
      } else {
        p.display();
        p.update();
      }
    }
    if (particles.size() == 0) {
      particleArrays.remove(particles);
    }
  }
}

void randomParticles(ArrayList<Particle> particelle) {
  // Genera le particelle con posizione e velocità casuale
  
  for (int i = 0; i < RANDOM_PARTICLES; i++) {
    float x = random(0, width);
    float y = random(height/6 + 10, height/6 + 10);
    float vx = random(VX_BOUNDS[0], VX_BOUNDS[1]);
    float vy = random(VY_BOUNDS[0], VY_BOUNDS[1]);
    particelle.add(new Particle(x, y, vx, vy));
  }
}

void fountainParticles(ArrayList<Particle> particelle) {
  // Genera un insieme di particelle aventi la stessa posizione iniziale
  // ma anche velocità casuale e accelerazione di gravità
  
  float x = random(width * 2/3, width);
  float y = random(0, height);
  float gravity = 0.4;
  
  for (int i = 0; i < FOUNTAIN_PARTICLES; i++) {
    float vx = random(VX_BOUNDS[0], VX_BOUNDS[1]);
    float vy = random(-VY_BOUNDS[0], -VY_BOUNDS[1]);
    particelle.add(new Particle(x, y, vx, vy, gravity));
  }
}

void mouseClicked() {
  // Usa i colori alternativi  
  altColors = !altColors;
}


