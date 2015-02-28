
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer pop;
AudioPlayer bpop;
int si = 0;

int maxball = 10;
int maxbeat = 10;

float[] ballx = new float[maxball];
float[] bally = new float[maxball];
float[] ballr = new float[maxball];
float[] balldy = new float[maxball];

int beatcount = 0;
float[] beatradius = new float[maxbeat];
float[] beatx = new float[maxbeat];
float[] beaty = new float[maxbeat];
int beati = 0;

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
  AudioPlayer sounds0;
  AudioPlayer sounds1;
  AudioPlayer sounds2;
  AudioPlayer sounds3;
  AudioPlayer sounds4;
  AudioPlayer sounds5;
  AudioPlayer sounds6;
  AudioPlayer sounds7;
  AudioPlayer sounds8;
  AudioPlayer sounds9;
  AudioPlayer sounds10;
  AudioPlayer sounds11;
  AudioPlayer sounds12;
  AudioPlayer sounds13;
  AudioPlayer sounds14;
  AudioPlayer sounds15;
  AudioPlayer sounds16;
  AudioPlayer sounds17;
  AudioPlayer sounds18;
  AudioPlayer sounds19;
  AudioPlayer sounds20;
  AudioPlayer sounds21;
  AudioPlayer sounds22;
  AudioPlayer sounds23;
  AudioPlayer sounds24;
  AudioPlayer sounds25;
  AudioPlayer sounds26;
  AudioPlayer sounds27;

void setup(){
  
  frameRate(20);
  
  smooth();
  size(700,400);
  background(255);
  int i = count;
  
  while(bi < 5){
    ballr[bi] = 10;balldy[bi] = 2;bi++;}
  
  int sndcnt = count;
  int sndxi = 0;
  
  while (sndcnt>0){
    sndcnt --;
    if (sndxi == xcount){
      sndxi = 0;}
    }
  
/*  while (si < 28){
    sounds[si] = m.loadFile(sound[sy[rr]]);
  si++;}*/
  
  int sycnt = 0;
  
  sound[0] = "DrumSounds/BassDrums1/bassdrum50.wav";
  sound[1] = "DrumSounds/BassDrums1/bassdrum45.wav";
  sound[2] = "DrumSounds/BassDrums1/bassdrum40.wav";
  sound[3] = "DrumSounds/BassDrums1/bassdrum35.wav";
  sound[4] = "DrumSounds/BassDrums1/bassdrum20.wav";
  sound[5] = "DrumSounds/BassDrums1/bassdrum15.wav";
  sound[6] = "DrumSounds/BassDrums1/bassdrum10.wav";
  sound[7] = "DrumSounds/BassDrums1/bassdrum5.wav";
  sound[8] = "DrumSounds/KickDrums1/kickdrum50.wav";
  sound[9] = "DrumSounds/KickDrums1/kickdrum45.wav";
  sound[10] = "DrumSounds/KickDrums1/kickdrum40.wav";
  sound[11] = "DrumSounds/KickDrums1/kickdrum35.wav";
  sound[12] = "DrumSounds/KickDrums1/kickdrum30.wav";
  sound[13] = "DrumSounds/KickDrums1/kickdrum25.wav";
  sound[14] = "DrumSounds/KickDrums1/kickdrum20.wav";
  sound[15] = "DrumSounds/KickDrums1/kickdrum15.wav";
  sound[16] = "DrumSounds/KickDrums1/kickdrum10.wav";
  sound[17] = "DrumSounds/KickDrums1/kickdrum5.wav";
  sound[18] = "DrumSounds/SnareDrums1/snaredrum50.wav";
  sound[19] = "DrumSounds/SnareDrums1/snaredrum45.wav";
  sound[20] = "DrumSounds/SnareDrums1/snaredrum40.wav";
  sound[21] = "DrumSounds/SnareDrums1/snaredrum35.wav";
  sound[22] = "DrumSounds/SnareDrums1/snaredrum30.wav";
  sound[23] = "DrumSounds/SnareDrums1/snaredrum25.wav";
  sound[24] = "DrumSounds/SnareDrums1/snaredrum20.wav";
  sound[25] = "DrumSounds/SnareDrums1/snaredrum15.wav";
  sound[26] = "DrumSounds/SnareDrums1/snaredrum10.wav";
  sound[27] = "DrumSounds/SnareDrums1/snaredrum5.wav";

  
  m = new Minim(this);
  
  sndcnt = 0;
  sounds0 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds1 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds2 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds3 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds4 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds5 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds6 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds7 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds8 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds9 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds10 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds11 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds12 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds13 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds14 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds15 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds16 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds17 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds18 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds19 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds20 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds21 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds22 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds23 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds24 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds25 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds26 = m.loadFile(sound[sndcnt]);
  sndcnt=sndcnt+1;
  if (sndcnt>xcount){sndcnt=0;}
  sounds27= m.loadFile(sound[sndcnt]);

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
  
  while (beati < maxbeat){
    beatx[beati] = 0;
    beaty[beati] = 0;
    beatradius[beati] = 0;
    beati++;}
    beatcount = 0;
    beati = 0;
}

int bii = 0;

void mouseClicked(){

/*  bii++;
  if (bii >= maxball){
    bii = 0;}
  
  ballx[bii] = mouseX;
  bally[bii] = mouseY;
  balldy[bii] = 1;*/
if (mouseButton == LEFT){
  beatcount++;}
if (mouseButton == RIGHT){
  beatcount--;}

  if (beatcount>=maxbeat){beatcount=0;}
  beatradius[beatcount] = 0;
}

int reset = 200;

void soundcheck(int rr){
  
    if (sy[rr] == 1){sounds0.loop(0);}else
    if (sy[rr] == 2){sounds1.loop(0);}else
    if (sy[rr] == 3){sounds2.loop(0);}else
    if (sy[rr] == 4){sounds3.loop(0);}else
    if (sy[rr] == 5){sounds4.loop(0);}else
    if (sy[rr] == 6){sounds5.loop(0);}else
    if (sy[rr] == 7){sounds6.loop(0);}else
    if (sy[rr] == 8){sounds7.loop(0);}else
    if (sy[rr] == 9){sounds8.loop(0);}else
    if (sy[rr] == 10){sounds9.loop(0);}else
    if (sy[rr] == 11){sounds10.loop(0);}else
    if (sy[rr] == 12){sounds11.loop(0);}else
    if (sy[rr] == 13){sounds12.loop(0);}else
    if (sy[rr] == 14){sounds13.loop(0);}else
    if (sy[rr] == 15){sounds14.loop(0);}else
    if (sy[rr] == 16){sounds15.loop(0);}else
    if (sy[rr] == 17){sounds16.loop(0);}else
    if (sy[rr] == 18){sounds17.loop(0);}else
    if (sy[rr] == 19){sounds18.loop(0);}else
    if (sy[rr] == 20){sounds19.loop(0);}else
    if (sy[rr] == 21){sounds20.loop(0);}else
    if (sy[rr] == 22){sounds21.loop(0);}else
    if (sy[rr] == 23){sounds22.loop(0);}else
    if (sy[rr] == 24){sounds23.loop(0);}else
    if (sy[rr] == 25){sounds24.loop(0);}else
    if (sy[rr] == 26){sounds25.loop(0);}else
    if (sy[rr] == 27){sounds26.loop(0);}else
    if (sy[rr] == 28){sounds27.loop(0);}
}

int r = 0;
int rr = 0;

void draw(){
    
  noStroke();
  fill(255,20);
  rect(0,0,700,400);
  r = 0;
  rr = 0;
  float x3;
  float y3;
  bi = 0;
  beati = 0;
  
/*while (bi<maxball){
//  ballx[bi] = ballx[bi] - balldy[bi];
  bally[bi] = bally[bi] + balldy[bi];
  if (balldy[bi] < -0.1){
    balldy[bi] = balldy[bi]*0.9;}
    else{
      if (balldy[bi] < 0.1){balldy[bi] = 0.1;}
      else {balldy[bi] = balldy[bi] * 1.1;}}
  if (bally[bi]>=(400-(ballr[bi]/2))){balldy[bi] = balldy[bi]*-0.9;}
  bi++;
}*/
  
  while (r < count){
    if (dist(700-mouseX,400-mouseY,reactorx[r],reactory[r])<50 & mouseX>5 & mouseX<695 & mouseY>5 & mouseY<395){
      x3 = reactorx[r] - (700-mouseX);
      y3 = reactory[r] - (400-mouseY);
      reactorx[r] = reactorx[r]+(0.1*x3);
      reactory[r] = reactory[r]+(0.1*y3);
      if (infillr[r]<=240){
        infillr[r] = infillr[r] + 15;}
    }//else {if(mouseX>5 & mouseX<695 & mouseY>5 & mouseY<395){}
    /*else{*/ /*if(dist(350,200,reactorx[r],reactory[r])<radius*3){
      x3 = reactorx[r] - 350;
      y3 = reactory[r] - 200;
      reactorx[r] = reactorx[r]+(0.2*x3);
      reactory[r] = reactory[r]+(0.2*y3);
      if (infillr[r]<=240){
        infillr[r] = infillr[r] + 15;}
    }//}}*/
    beati = 0;
    while (beati < maxbeat){
      if (dist(beatx[beati],beaty[beati],reactorx[r],reactory[r])<((beatradius[beati]/2)+(reactorr[r]/2))){
//        soundcheck(r);
        x3 = reactorx[r] - beatx[beati];
        y3 = reactory[r] - beaty[beati];
          reactorx[r] = reactorx[r]+(0.2*x3);
          reactory[r] = reactory[r]+(0.2*y3);
        if (infillr[r]<=240){
          infillr[r] = infillr[r] + 15;}
      }

      beati++;}
      
    while (rr < count){
      
      if (rr != r){
      if (dist(reactorx[r],reactory[r],reactorx[rr],reactory[rr])<reactorr[r]){
        if (reactorr[rr] == radius){
          soundcheck(rr);
          /*if (sy[rr] == 1){sounds0.loop();}
          if (sy == 2){sounds1.loop();}
          if (sy == 3){sounds2.loop();}
          if (sy == 4){sounds3.loop();}
          if (sy == 5){sounds4.loop();}
          if (sy == 6){sounds5.loop();}
          if (sy == 7){sounds6.loop();}
          if (sy == 8){sounds7.loop();}
          if (sy == 9){sounds8.loop();}
          if (sy == 10){sounds9.loop();}
          if (sy == 11){sounds10.loop();}
          if (sy == 12){sounds11.loop();}
          if (sy == 13){sounds12.loop();}
          if (sy == 14){sounds13.loop();}
          if (sy == 15){sounds14.loop();}
          if (sy == 16){sounds15.loop();}
          if (sy == 17){sounds16.loop();}
          if (sy == 18){sounds17.loop();}
          if (sy == 19){sounds18.loop();}
          if (sy == 20){sounds19.loop();}
          if (sy == 21){sounds20.loop();}
          if (sy == 22){sounds21.loop();}
          if (sy == 23){sounds22.loop();}
          if (sy == 24){sounds23.loop();}
          if (sy == 25){sounds24.loop();}
          if (sy == 26){sounds25.loop();}
          if (sy == 27){sounds26.loop();}
          if (sy == 28){sounds27.loop();}*/}
        if (reactorr[r]<radius*2){
        reactorr[r] = reactorr[r]+2;}
        if (reactorr[rr]<radius*1.5){
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
      /*while (bi < maxball){
      if (dist(reactorx[rr],reactory[rr],ballx[bi],bally[bi])<(reactorr[rr]/2)+(ballr[bi]/2)){
        if (ballr[bi] <= 10){
            //bpop = m.loadFile("DrumSounds/KettleDrums/kettledrum9.wav");bpop.loop(0);
            soundcheck(rr);}
        if (ballr[bi] < 20){ballr[bi] = ballr[bi] + 10;}
        x3 = ballx[bi] - reactorx[rr];
        y3 = bally[bi] - reactory[rr];
        ballx[bi] = ballx[bi] + (x3*0.1);
        bally[bi] = bally[bi] + (y3*0.1);
        reactorx[rr] = reactorx[rr] - (x3*0.1);
        reactory[rr] = reactory[rr] - (y3*0.1);
        balldy[bi] = balldy[bi] * -1;
      }
      bi++;}*/

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
/*    while (bi<maxball){
      if (ballr[bi]>10){ballr[bi] = ballr[bi] - 5;}
      ellipse(ballx[bi],bally[bi],ballr[bi],ballr[bi]);
      bi++;}*/
    if (soundb > 0){soundb = soundb - 1;}

    x3 = 1.5;
    x3 = x3 * random(0.8,1.2);
    fill(255,127,0,30);
//    ellipse(350,200,radius*x3,radius*x3);
    
  if (mousePressed && (mouseButton == RIGHT)) {
//    beati = 0;
//    beatcount = 0;
//  while (beati < maxbeat){
  if (beatcount>0){
    beatx[beatcount-1] = 0;
    beaty[beatcount-1] = 0;
    beatradius[beatcount] = 0;
    }
  else {
    beatx[9] = 0;
    beaty[9] = 0;
    beatradius[9] = 0;}}

 else if (mousePressed && (mouseButton == LEFT)){
      if (beatcount<maxbeat){
      beatx[beatcount] = mouseX;
      beaty[beatcount] = mouseY;
      if (beatradius[beatcount] == 0){beatradius[beatcount] = 2;}
      if (beatradius[beatcount]<300){
          beatradius[beatcount] = beatradius[beatcount] * 1.05 + 1;}}

    }
    
    noFill();
    stroke(255,127,0);
    beati = 0;
/*    while(beati<maxbeat){
      ellipse(beatx[beati],beaty[beati],beatradius[beati],beatradius[beati]);
      beati++;}*/
}


