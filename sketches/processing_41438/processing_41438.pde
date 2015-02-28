
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer pop;

int xcount = 26;
int ycount = 14;
int count = xcount * ycount;

int soundb = 0;

float[] reactorx = new float[count];
float[] reactory = new float[count];
float[] reactorr = new float[count];

float[] breactorx = new float[count];
float[] breactory = new float[count];
float[] breactorr = new float[count];

float[] slvl = new float[count];
float[] sound = new float[count];
float[] infillr = new float[count];

  float xxi = 700 / (xcount+1);
  float yyi = 400 / (ycount+1);
  float radius = xxi * 0.5;
  float cnt = 0;
  float x = xxi;
  float y = yyi;
  float soundfile;

void setup(){
  smooth();
  size(700,400);
  background(255);
  int i = count;
  
  m = new Minim(this);

  pop = m.loadFile("DrumSounds/BassDrums1/bassdrum49.wav");

  while (i>0){
    i--;
    cnt++;
    reactorx[i] = x;
    reactory[i] = y;
    reactorr[i] = radius;
    breactorx[i] = x;
    breactory[i] = y;
    breactorr[i] = radius;
    if (cnt == xcount){
      cnt = 0;
      x = xxi; y = y + yyi;}
      else{
        x = x + xxi;}
    
    sound[i] = random(1,10);
    infillr[i] = 0;
  }

  ellipseMode(CENTER);
}

void randsound(){
  
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

