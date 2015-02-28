
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer pop;

int xcount = 20;
int ycount = 10;
int count = xcount * ycount;

int soundb = 0;

float[] reactorx = new float[count];
float[] reactory = new float[count];
float[] reactorr = new float[count];

float[] breactorx = new float[count];
float[] breactory = new float[count];
float[] breactorr = new float[count];

int[] sy = new int[count];

float[] slvl = new float[count];
String[] sound = new String[14];

float[] infillr = new float[count];

  float xxi = 700 / (xcount+1);
  float yyi = 400 / (ycount+1);
  float radius = yyi * 0.5;
  float cnt = 0;
  float x = xxi;
  float y = yyi;
  float soundfile;

void setup(){
  smooth();
  size(700,400);
  background(255);
  int i = count;
  int sycnt = 0;
  
  sound[0] = "DrumSounds/BassDrums1/bassdrum49.wav";
  sound[1] = "DrumSounds/BassDrums1/bassdrum45.wav";
  sound[2] = "DrumSounds/BassDrums1/bassdrum43.wav";
  sound[3] = "DrumSounds/BassDrums1/bassdrum40.wav";
  sound[4] = "DrumSounds/BassDrums1/bassdrum38.wav";
  sound[5] = "DrumSounds/BassDrums1/bassdrum36.wav";
  sound[6] = "DrumSounds/BassDrums1/bassdrum32.wav";
  sound[7] = "DrumSounds/BassDrums1/bassdrum28.wav";
  sound[8] = "DrumSounds/BassDrums1/bassdrum22.wav";
  sound[9] = "DrumSounds/BassDrums1/bassdrum21.wav";
  sound[10] = "DrumSounds/BassDrums1/bassdrum18.wav";
  sound[11] = "DrumSounds/BassDrums1/bassdrum12.wav";
  sound[12] = "DrumSounds/BassDrums1/bassdrum6.wav";
  sound[13] = "DrumSounds/BassDrums1/bassdrum1.wav";
  
  m = new Minim(this);

  while (i>0){
    i--;
    cnt++;
    reactorx[i] = x;
    reactory[i] = y;
    reactorr[i] = radius;
    breactorx[i] = x;
    breactory[i] = y;
    breactorr[i] = radius;
    sy[i] = sycnt;
    if (cnt == xcount){
      cnt = 0;sycnt = sycnt + 1;
      x = xxi; y = y + yyi;}
      else{
        x = x + xxi;}
    
//    sound[i] = random(1,10);
    infillr[i] = 0;
  }

  ellipseMode(CENTER);
}


void draw(){
  noStroke();
  fill(255,20);
  rect(0,0,700,400);
  int r = 0;
  int rr = 0;
  float x3;
  float y3;
  while (r < count){
    if (dist(mouseX,mouseY,reactorx[r],reactory[r])<50 & mouseX>5 & mouseX<695 & mouseY>5 & mouseY<395){
      x3 = reactorx[r] - mouseX;
      y3 = reactory[r] - mouseY;
      reactorx[r] = reactorx[r]+(0.1*x3);
      reactory[r] = reactory[r]+(0.1*y3);
      if (infillr[r]<=240){
        infillr[r] = infillr[r] + 15;}
    }
    while (rr < count){
      
      if (rr != r){
      if (dist(reactorx[r],reactory[r],reactorx[rr],reactory[rr])<reactorr[r]){
        if (reactorr[rr] == radius){
          pop = m.loadFile(sound[sy[rr]]);
        pop.loop(0);}
        if (reactorr[r]<radius*2){
        reactorr[r] = reactorr[r]+2;}
        if (reactorr[rr]<radius*2){
        reactorr[rr] = reactorr[rr]+2;}
        x3 = reactorx[rr] - reactorx[r];
        y3 = reactory[rr] - reactory[r];
        reactorx[rr] = reactorx[rr] + (x3*0.1);
        reactory[rr] = reactory[rr] + (y3*0.1);
        if (infillr[rr]<=205){
          infillr[rr] = infillr[rr] + 15;}
        
        reactorx[r] = reactorx[r] - (x3*0.1);
        reactory[r] = reactory[r] - (y3*0.1);
        if (infillr[r]<=205){
          infillr[r] = infillr[r] + 50;}
      }}
      rr = rr + 1;
    }
    if (breactorx[r] != reactorx[r]){
      reactorx[r] = reactorx[r]+((breactorx[r]-reactorx[r])*0.02);
    }
    if (breactory[r] != reactory[r]){
      reactory[r] = reactory[r]+((breactory[r]-reactory[r])*0.02);
    }
    
    
    fill(0+infillr[r],127,255-infillr[r],80);
    ellipse(reactorx[r],reactory[r],reactorr[r],reactorr[r]);
    if (reactorr[r]>radius){reactorr[r] = reactorr[r] - 1;}
    if (infillr[r] >= 5){
      infillr[r] = infillr[r]-5;}
    r = r + 1;
    rr = 0;}
    if (soundb > 0){soundb = soundb - 1;}
}

