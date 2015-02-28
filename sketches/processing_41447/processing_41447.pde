
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer pop;
AudioPlayer bpop;



float[] ballx = new float[5];
float[] bally = new float[5];
float[] ballr = new float[5];
float[] balldy = new float[5];


int xcount = 13;
int ycount = 7;
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
String[] sound = new String[30];

float[] infillr = new float[count];

  float xxi = 700 / (xcount+1);
  float yyi = 400 / (ycount+1);
  float radius = yyi * 0.5;
  int cnt = 0;
  float x = xxi;
  float y = yyi;
  float soundfile;
  
  int bi = 0;

void setup(){
  smooth();
  size(700,400);
  background(255);
  int i = count;
  
  while(bi < 5){
    ballr[bi] = 10;balldy[bi] = 2;bi++;}
  
  int sycnt = 0;
  
  sound[0] = "DrumSounds/BassDrums1/bassdrum50.wav";
  sound[1] = "DrumSounds/BassDrums1/bassdrum40.wav";
  sound[2] = "DrumSounds/BassDrums1/bassdrum30.wav";
  sound[3] = "DrumSounds/BassDrums1/bassdrum20.wav";
  sound[4] = "DrumSounds/BassDrums1/bassdrum10.wav";
  sound[5] = "DrumSounds/KickDrums1/kickdrum10.wav";
  sound[6] = "DrumSounds/KickDrums1/kickdrum20.wav";
  sound[7] = "DrumSounds/KickDrums1/kickdrum30.wav";
  sound[8] = "DrumSounds/KickDrums1/kickdrum40.wav";
  sound[9] = "DrumSounds/KickDrums1/kickdrum50.wav";
  sound[10] = "DrumSounds/SnareDrums1/snaredrum40.wav";
  sound[11] = "DrumSounds/SnareDrums1/snaredrum30.wav";
  sound[12] = "DrumSounds/SnareDrums1/snaredrum20.wav";
  sound[13] = "DrumSounds/SnareDrums1/snaredrum10.wav";
  sound[14] = "DrumSounds/BassDrums1/bassdrum50.wav";
  sound[15] = "DrumSounds/BassDrums1/bassdrum40.wav";
  sound[16] = "DrumSounds/BassDrums1/bassdrum30.wav";
  sound[17] = "DrumSounds/BassDrums1/bassdrum20.wav";
  sound[18] = "DrumSounds/BassDrums1/bassdrum10.wav";
  sound[19] = "DrumSounds/KickDrums1/kickdrum10.wav";
  sound[20] = "DrumSounds/KickDrums1/kickdrum20.wav";
  sound[21] = "DrumSounds/KickDrums1/kickdrum30.wav";
  sound[22] = "DrumSounds/KickDrums1/kickdrum40.wav";
  sound[23] = "DrumSounds/KickDrums1/kickdrum50.wav";
  sound[24] = "DrumSounds/SnareDrums1/snaredrum40.wav";
  sound[25] = "DrumSounds/SnareDrums1/snaredrum30.wav";
  sound[26] = "DrumSounds/SnareDrums1/snaredrum20.wav";
  sound[27] = "DrumSounds/SnareDrums1/snaredrum10.wav";
  
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
    sy[i] = cnt;
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

int bii = 0;

void mouseClicked(){
  bii++;
  if (bii >= 5){
    bii = 0;}
  
  ballx[bii] = mouseX;
  bally[bii] = mouseY;
  balldy[bii] = 1;
}

void draw(){
  noStroke();
  fill(255,20);
  rect(0,0,700,400);
  int r = 0;
  int rr = 0;
  float x3;
  float y3;
  bi = 0;
  
while (bi<5){
//  ballx[bi] = ballx[bi] - balldy[bi];
  bally[bi] = bally[bi] + balldy[bi];
  if (balldy[bi] < -0.1){
    balldy[bi] = balldy[bi]*0.9;}
    else{
      if (balldy[bi] < 0.1){balldy[bi] = 0.1;}
      else {balldy[bi] = balldy[bi] * 1.1;}}

  bi++;
}
  
  while (r < count){
    if (dist(mouseX,mouseY,reactorx[r],reactory[r])<50 & mouseX>5 & mouseX<695 & mouseY>5 & mouseY<395){
      x3 = reactorx[r] - mouseX;
      y3 = reactory[r] - mouseY;
      reactorx[r] = reactorx[r]+(0.1*x3);
      reactory[r] = reactory[r]+(0.1*y3);
      if (infillr[r]<=240){
        infillr[r] = infillr[r] + 15;}
    }//else {if(mouseX>5 & mouseX<695 & mouseY>5 & mouseY<395){}
    /*else{*/ if(dist(350,200,reactorx[r],reactory[r])<80){
      x3 = reactorx[r] - 350;
      y3 = reactory[r] - 200;
      reactorx[r] = reactorx[r]+(0.2*x3);
      reactory[r] = reactory[r]+(0.2*y3);
      if (infillr[r]<=240){
        infillr[r] = infillr[r] + 15;}
    }//}}
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
      bi = 0;
      while (bi < 5){
      if (dist(reactorx[rr],reactory[rr],ballx[bi],bally[bi])<(reactorr[rr]/2)+(ballr[bi]/2)){
        if (ballr[bi] <= 10){
            //bpop = m.loadFile("DrumSounds/KettleDrums/kettledrum9.wav");bpop.loop(0);
            pop = m.loadFile(sound[sy[rr]]);pop.loop(0);}
        if (ballr[bi] < 20){ballr[bi] = ballr[bi] + 10;}
        x3 = ballx[bi] - reactorx[rr];
        y3 = bally[bi] - reactory[rr];
        ballx[bi] = ballx[bi] + (x3*0.1);
        bally[bi] = bally[bi] + (y3*0.1);
        reactorx[rr] = reactorx[rr] - (x3*0.1);
        reactory[rr] = reactory[rr] - (y3*0.1);
        balldy[bi] = balldy[bi] * -1;
      }
      bi++;}
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
    bi = 0;
    while (bi<5){
      if (ballr[bi]>10){ballr[bi] = ballr[bi] - 5;}
      ellipse(ballx[bi],bally[bi],ballr[bi],ballr[bi]);
      bi++;}
    if (soundb > 0){soundb = soundb - 1;}
}


