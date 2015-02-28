
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.BeatDetect;

Minim minim;
AudioPlayer song;
static BeatDetect beat;

PFont font;
float animationHeight;
boolean randomPressed, detectedBeat;

static float centerRadius;
int handlesNum, kickVar, snareVar, hatVar;
Handle [] handles;
Waves kickWaves[], hatWaves[], snareWaves[];
static color kickColor, hatColor, snareColor;

void setup() {

  size(400, 600,P3D); 
  colorMode(HSB, 255);
  textMode(SCREEN);
  
  minim = new Minim(this);

  song = minim.loadFile("da_funk.mp3", 1024); 
  song.loop();

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);

  font = loadFont("Serif-14.vlw");
  textFont(font);

  animationHeight = 400;
  randomPressed = detectedBeat = false;

  centerRadius = 30;
  handlesNum = 5;
  kickVar = hatVar = snareVar = -1;

  kickWaves = new Waves[100];
  hatWaves = new Waves[100];
  snareWaves = new Waves[100];

  handles = new Handle[handlesNum];
  int handleSize = 10;
  int fontSize = 11;
  for (int i=0; i<handlesNum; i++) {
    handles[i] = new Handle( width/8, (int) (animationHeight+handleSize*2+fontSize)+i*37, 4*width/8, handleSize, handles, i);
  }
}

void draw() {
  
  beat.detect(song.mix);
  
  fill(0, 35);
  rect(0, 0, width, height);

  float startArc, endArc;

  //
  // KICK CASE
  //

  if ( beat.isKick() ) { 

    if ( !detectedBeat)
      detectedBeat = true; 

    fill( kickColor );
    stroke( kickColor );

    startArc = 0;
    endArc = (2*PI)/3;

    beginShape();
    vertex(width/2, animationHeight/2);
    for (float i = startArc; i < endArc; i=i+0.05) {
      float x = cos(i)*centerRadius;
      float y = sin(i)*centerRadius;
      vertex(width/2+x, animationHeight/2-y);
    }
    endShape(CLOSE);

    if ( kickVar < 99) {
      kickVar++;
      kickWaves[kickVar] = new Waves(startArc, endArc, centerRadius, kickColor, animationHeight);
    }
    else {
      kickVar++;
      kickWaves[ (kickVar % 100) ] = new Waves(startArc, endArc, centerRadius, kickColor, animationHeight);
    }
  }

  // display of others kick waves

  if (kickVar<100 & kickVar>=0) {
    for (int j=kickVar;j>0;j--) {
      kickWaves[j].update();
    }
  }
  if ( kickVar>=100) {
    for (int j = 0; j<100;j++) {
      kickWaves[j].update();
    }
  }

  //
  // HAT CASE
  //

  if ( beat.isHat() ) {

    if ( !detectedBeat)
      detectedBeat = true;

    fill( hatColor );
    stroke( hatColor );

    startArc = (2*PI)/3;
    endArc = (4*PI)/3;

    beginShape();
    vertex(width/2, animationHeight/2);
    for (float i = startArc; i < endArc; i=i+0.05) {
      float x = cos(i)*centerRadius;
      float y = sin(i)*centerRadius;
      vertex(width/2+x, animationHeight/2-y);
    }
    endShape(CLOSE);

    if ( hatVar < 99) {
      hatVar++;
      hatWaves[hatVar] = new Waves(startArc, endArc, centerRadius, hatColor, animationHeight);
    }
    else {
      hatVar++;
      hatWaves[ (hatVar % 100) ] = new Waves(startArc, endArc, centerRadius, hatColor, animationHeight);
    }
  }  

  // display of others hat waves

  if (hatVar<100 & hatVar>=0) {
    for (int j=hatVar;j>0;j--) {
      hatWaves[j].update();
    }
  }
  if ( hatVar>=100) {
    for (int j = 0; j<100;j++) {
      hatWaves[j].update();
    }
  }

  //
  // SNARE CASE
  //

  if ( beat.isSnare() ) {

    if ( !detectedBeat)
      detectedBeat = true;

    fill( snareColor );
    stroke( snareColor );

    startArc = (4*PI)/3;
    endArc = 2*PI;

    beginShape();
    vertex(width/2, animationHeight/2);
    for (float i = startArc; i < endArc; i=i+0.05) {
      float x = cos(i)*centerRadius;
      float y = sin(i)*centerRadius;
      vertex(width/2+x, animationHeight/2-y);
    }
    endShape(CLOSE);  

    if ( snareVar < 99) {
      snareVar++;
      snareWaves[snareVar] = new Waves(startArc, endArc, centerRadius, snareColor, animationHeight);
    }
    else {
      snareVar++;
      snareWaves[ (snareVar % 100) ] = new Waves(startArc, endArc, centerRadius, snareColor, animationHeight);
    }
  }

  // display of others snare waves

  if (snareVar<100 & snareVar>=0) {
    for (int j=snareVar;j>0;j--) {
      snareWaves[j].update();
    }
  }
  if ( snareVar>=100) {
    for (int j = 0; j<100;j++) {
      snareWaves[j].update();
    }
  }

  noStroke();

  // white edge

  // black strip over the waves

  fill(0);
  rect(0, 0, width, 4);
  rect(0, 0, 4, animationHeight);
  rect(0, animationHeight-4, width, 4);
  rect(width-4, 0, 4, animationHeight);  

  // edge of animation

  noFill();
  stroke(255);
  rect(2, 2, width-4, animationHeight-4);
  rect(4, 4, width-8, animationHeight-8);

  // edge of commands controls  

  rect(2, animationHeight+2, width-4, height-animationHeight-4);
  rect(4, animationHeight+4, width-8, height-animationHeight-8);

  //
  // COMMANDS OF CONTROL
  //

  for (int i=0; i<handlesNum; i++) {
    handles[i].update();
    handles[i].display();
  }

  noStroke();

  // random colors on 'w' key pressed

  if ( randomPressed & detectedBeat) {
    kickColor = color( random(0, 255), 255, 255 );
    hatColor = color( random(0, 255), 255, 255 );
    snareColor = color( random(0, 255), 255, 255 );
    centerRadius = random(5, 80);

    for (int i=0; i<handlesNum; i++) {
      handles[i].onKeyPressed();
      handles[i].display();
    }
  } 

  detectedBeat = false;
}

void mouseReleased() {
  for (int i=0; i<handlesNum; i++) {
    handles[i].releaseEvent();
  }
}

void keyPressed() {

  // 'a' key pressed

  if (key == 'a' || key == 'A') {
    kickColor = color( 96, 255, 255 );
    hatColor = color( 181, 255, 255 );
    snareColor = color( 11, 255, 255 );
    centerRadius = 50;
  }

  // 's' key pressed

  if (key == 's' || key == 'S') {
    kickColor = color( 30, 255, 255 );
    hatColor = color( 115, 255, 255 );
    snareColor = color( 145, 255, 255 );
    centerRadius = 50;
  }

  // 'd' key pressed

  if (key == 'd' || key == 'D') {
    kickColor = color( 150, 255, 255 );
    hatColor = color( 235, 255, 255 );
    snareColor = color( 65, 255, 255 );
    centerRadius = 50;
  }  

  // 'w' key pressed

  if (key == 'w' || key == 'W') {
    if ( randomPressed )
      randomPressed = false;
    else
      randomPressed = true;
  }

  if (key != 'w' || key != 'W') {
    for (int i=0; i<handlesNum; i++) {
      handles[i].onKeyPressed();
      handles[i].display();
    }
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}


