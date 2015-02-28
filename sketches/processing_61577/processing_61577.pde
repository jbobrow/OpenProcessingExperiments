
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput input;
FFT fft;

final int GROUPS=32;
final int ELEMSIZE=30;

float inRMin = 0.06;
float inRMax = 0.4;
float inLMin = 0.06;
float inLMax = 0.4;
float rFactor = 1, gFactor=1, bFactor = 1;
float r, g, b;
float maxSpec = 0;
float h = 0;    
float specStep; 
float specScale;
float waveStep;

float[] group;

boolean rects = false, curves = false, spect = false, dots=true, groups= true;

void setup () {
  //size(GROUPS*ELEMSIZE, 20*ELEMSIZE);
  size(960,600);
  specStep = width / GROUPS;
  noStroke ();
  background(0, 0, 0);
  smooth();

  // Initialize audioinput
  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 256);
  // Initalize fft
  fft = new FFT (input.bufferSize (), input.sampleRate ());
}

void draw () {
  noStroke();

  //quick'n'dirty fading effect
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);


  specScale = (float) width / (fft.specSize () - 1);
  waveStep = width/(input.bufferSize()-40);
  // Frequency groups, possible values 2, 4, 8, 16, 32, 64, 128
  group = getGroup (GROUPS*2);

  //calculate color
  r = abs(map(input.left.get(1), inRMin, inRMax, 0, 255));
  g = abs(map(input.right.get(1), inLMin, inLMax, 0, 255));
  b = abs(map(input.mix.get(1), inRMin, inLMax, 255, 0));
  //println("R = "+r);
  //println("G = "+g);
  fill(r*rFactor, g*gFactor, random(255)*bFactor, 100);

  if (groups) {
    // Groups drawn as circles
    if (dots) {
      for (int i=0; i < GROUPS; i++) {
        h = height - map (group[i], 0, maxSpec/((i+1)*1.5), 0, height);
        ellipse(i * specStep +specStep/2, h, specStep+10, specStep+10);
      }
    }

    // Groups drawn as rectangles
    if (rects) {
      for (int i=0; i < GROUPS; i++) {
        h = height - map (group[i], 0, maxSpec/((i+1)*1.5), 0, height);
        rect(i * specStep, h, specStep, specStep);
      }
    }
  }
  // Spectrum
  if (spect) {
    int j = 0;
    for (int i = 0; i < fft.specSize (); i++) {
      h = map (fft.getBand (i), 0, maxSpec, 2, height/2);
      if (j%2==0)
        rect (i * specScale, height/2 - h, specScale, h);
      else
        rect (i * specScale, height/2 + h, specScale, h);
      j++;
    }
  }

  // Signal
  if (curves) {
    for (int i = 0; i < input.bufferSize()-1; i++) {
      strokeWeight(3);
      stroke(r*rFactor, g*gFactor, random(255)*bFactor, 100);
      line(i*waveStep, 200 + input.left.get(i)*300, (i+1)*waveStep, 200 + input.left.get(i+1)*300);
      line(i*waveStep, 600 + input.right.get(i)*300, (i+1)*waveStep, 600 + input.right.get(i+1)*300);
    }
  }
}

/** 
 * Returns average of a group of freqencies in the 
 * spectrum.
 */
float[] getGroup (int theGroupNum) {
  fft.forward (input.mix);
  fft.window(FFT.HAMMING);
  float[] group  = new float[theGroupNum];
  // fft has one value more: 256 -> 257
  int specLimit  = fft.specSize () - 1;

  int groupSize = specLimit / theGroupNum;
  for (int i=0; i < group.length; i++) {
    group[i] = 0;
  }

  for (int i=0; i < specLimit; i++) {
    if (fft.getBand (i) > maxSpec) {
      maxSpec = fft.getBand (i);
    }
    int index = (int) Math.floor (i / groupSize);
    group[index] += fft.getBand (i);
  }

  // calc average
  for (int i=0; i < group.length; i++) {
    group[i] /= groupSize;
  }
  return group;
}

float ln (float x) {
  return (log(x) / log(2.71828183));
}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key=='u' || key=='U') {
    rects = !rects;
    dots = !dots;
  }
  if (key=='i' || key=='I')groups=!groups;
  if (key=='o' || key=='O')curves=!curves;
  if (key=='p' || key=='P')spect=!spect;
  if (key=='e' || key=='E')rFactor+=0.02;
  if (key=='d' || key=='D')rFactor-=0.02;
  if (key=='r' || key=='R')gFactor+=0.02;
  if (key=='f' || key=='F')gFactor-=0.02;
  if (key=='t' || key=='T')bFactor+=0.02;
  if (key=='g' || key=='G')bFactor-=0.02;
  if (key=='w' || key=='W')background(0);
  if (key=='1') {
    rFactor=1;
    gFactor=1;
    bFactor=1;
  }
  if (key=='2') {
    rFactor=2;
    gFactor=0;
    bFactor=2;
  }
  if (key=='3') {
    rFactor=2;
    gFactor=0;
    bFactor=2;
  }
  if (key=='4') {
    rFactor=2;
    gFactor=2;
    bFactor=0;
  }
  if (key=='5') {
    rFactor=0;
    gFactor=2;
    bFactor=2;
  }
  if (key=='6') {
    rFactor=3;
    gFactor=0;
    bFactor=0;
  }
  if (key=='7') {
    rFactor=0;
    gFactor=3;
    bFactor=0;
  }
  if (key=='8') {
    rFactor=0;
    gFactor=0;
    bFactor=3;
  }
  if (key=='9') {
    rFactor=random(3);
    gFactor=random(3);
    bFactor=random(3);
  }
  println("R:"+rFactor+"G:"+gFactor+"B:"+bFactor);
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


