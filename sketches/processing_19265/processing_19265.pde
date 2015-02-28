
/**
 * UNBSD  sw_test (.pde) (Processing) for Interactive Multimedia
 * DEMONSTRATION APPLET 2010 UNBSD (BSD Licensed)  /n
 * Click on the MIDDLE NOSE to turn the music on if it goes off.
 * Clicking on the nose turns the therumen on and off.
 * Click Dave's lapel for random keyboard.  Click lapel to change instruments.
 * Click the baseball cap to turn bouncing bunnies on and off.
 * Click the jay to turn on Jessica Rabbit.
 *
 * Code not optimized.  Draft design for development feedback.
 */

PImage arm1;
PImage arm2;
PImage sw_1;
PImage sw_2;
PImage sw_3;
PImage sw_4;
PImage sw_5;
PImage sw_stage;
PImage logo1;
PImage logo2;
PImage blik_bunny_ball_sm;
PImage jessica;
//PImage bgSpace;

PFont font1;
PFont font2;

float sw1X;
float sw1Y;
float sw2X;
float sw2Y;
float sw3X;
float sw3Y;
float sw4X;
float sw4Y;
float sw5X;
float sw5Y;


float arm1X;
float arm1Y;
float Aarm1Xinit;
float Aarm1Xmax;
float Aarm1X;
float arm2X;
float arm2Y;
float Aarm2Yinit;
float Aarm2Ymax;
float Aarm2Y;

float x = 100;
float y = 100;

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim SW_Song; 
AudioPlayer song;
//AudioPlayer SW_Song_wf;
BeatDetect beat;
BeatListener bl;

import arb.soundcipher.*;
SoundCipher sc = new SoundCipher(this);

//import guru.ttslib.*;
//TTS tts;

WaveformRenderer waveform;
int wfxpos;
int wfypos;
int wfR;

float kickSize, snareSize, hatSize;
 
String textlist[]={"scotch wiggley music player","Move and click your mouse","THE sounds OF scotch wiggley",
  "Use Glock to Cap the Bunny","_____ baseball cap contains suprises","what is in ______'s hand?",
  "cLick or touch the baseball Cap.","touch THE JAY",
  "Pick Franks's NOSE to TURN THERERIM ON and off","Dave's Left Lapel - random keyboard" 
  };
String textplaying[]={"50X Bonus Multiplier",
  "keep trying",
  "groovy playing",
  "Win Backstage Passes!",
  "Cheat codes cash only!"
  };
int textposx;
int textposy;
int Textrnd;
int TextStep;
String TextStr;
int SysMsg;
String SysMgs[]={"",
      "Oops! Out of Therumin Range!",
      "Therumin Level",
      "Follow the Clues in Scotch Wiggley Tunes",
      "Click _____'s Nose to Turn off Therumin",
      "Giving up? You're not getting in.",
      "Touch Frank's nose to start the therumin",
      "Interact with Scotch Wiggley!"
  };
int MsgTick;

int therumin;
int nomnon;
float propT;
float propG;
float propN;

//import ddf.minim.*;
import ddf.minim.signals.*;
Minim SignWave;
AudioOutput out;
SineWave sine;

int Stage;
boolean scoreboard;
boolean bbunny;
boolean Thermin;
boolean playtext;
boolean popping;
int bunX;
int bunY;

boolean bunball;
int numSquids = 4;
float spring = 0.05;
float gravity = 0.1;
float friction = -1.0;
//ArrayList Squids;
Squid[] Squids = new Squid[numSquids];

boolean jay;

boolean piano;

Integer counter;

//float angleY = 0.3316125;
//float armSize = 50;
//float armLength = 50; // same as armSize to start

void setup() {
  size(540, 440,P3D);
  //smooth(); 
  strokeWeight(20.0);
  stroke(0, 100);
  fill(#FF920D);
  font1=createFont("SanSerif", 16,true);
  textFont(font1);
  font2=loadFont("BlackcurrantCameo-24.vlw");
  textAlign(RIGHT);
  
  textposx = (width-10);
  textposy = 20;
  Textrnd = 1;
  therumin = 0;
  nomnon = 0;
  TextStr = textlist[0];
  
    //tts = new TTS();
  
  // load images, preload width(x) and height(y) for each image
  // clunky to enter but fast execution is more important for beats
  // we've got to scale images rapidly to match the beats
  sw1X = 92; //  sw1X = sw1X.width
  sw1Y = 121; // sw1Y = sw1Y.height
  sw2X = 110; // use above format for sw[1-5][XY] to autocalc 
  sw2Y = 207; // but I already entered specific values
  sw3X = 98;
  sw3Y = 207;
  sw4X = 88;
  sw4Y = 128;
  sw5X = 136;
  sw5Y = 361;
  sw_1 = loadImage("sw_1.png");  
  sw_2 = loadImage("sw_2.png");
  sw_3 = loadImage("sw_3.png");
  sw_4 = loadImage("sw_4.png");
  sw_5 = loadImage("sw_5.png");  
  sw_stage = loadImage("sw_stage.png");
  arm1 = loadImage("sw_arm1.png");
  arm2 = loadImage("sw_arm2.png");
  blik_bunny_ball_sm = loadImage("blik_bunny_ball_sm.png");
  jessica = loadImage("jessica_rabbit_3b.png");
  
  logo1 = loadImage("bunny_scary.png");
  logo2 = loadImage("bunny_3_transwhite.png");
   
  arm1X = 300; // pivot origin, X translation for base of arm
  arm1Y = 85; // pivot origin
  Aarm1Xinit = -20; // degree rotation off initial origin
  Aarm1Xmax = 96; // maximum number of degree rotation
  arm2X = 4; // pivot orgin, X translation measured off of base arm (1X) translation
  arm2Y = 12;
  Aarm2Yinit = -15; // degree rotation off initial origin
  Aarm2Ymax = 40; // maximum number of degree rotation
  
  SW_Song = new Minim(this);
  
  song = SW_Song.loadFile("loop128_v1b.mp3", 2048);
  song.play();
  // a beat detection object that is FREQ_ENERGY mode that 
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds 
  // before allowing another beat to be reported. You can use this to dampen the 
  // algorithm if it is giving too many false-positives. The default value is 10, 
  // which is essentially no damping. If you try to set the sensitivity to a negative value, 
  // an error will be reported and it will be set to 10 instead. 
  beat.setSensitivity(300);  
  kickSize = snareSize = hatSize = 16;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  
  waveform = new WaveformRenderer();
  song.addListener(waveform);
  wfxpos = (width/2)-32;
  wfypos = 0;
  wfR = 0;
  
  for (int i = 0; i < numSquids; i++) {
    //for (int i = 0; i < Squids.length(); i++) {
    Squids[i] = new Squid(random(width), random(height), random(10,120), i, Squids);
    //Squid.add(new Squid(random(width), random(height), random(20, 40), i,Squids));
  }
  
  SignWave = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = SignWave.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out, here or elsewhere
  //out.addSignal(sine);
      
  Stage = 1;
  counter = 0;
  scoreboard = false;
  bbunny = true;
  Thermin = false;
  playtext = false;
  popping = false;
  
  jay = false;
  
  bunX = 237;
  bunY = 82;
}

void draw() {
  background(0);
  
  if (Stage == 1) {
    scoreboard = false;
    bbunny = true;
    Thermin = false;
    playtext = false;
    //bunX = 256;
    //bunY = 24;
    popping = false;
    SysMsg = 7;  
  }
  if (Stage == 2) {
    scoreboard = false;
    bbunny = true;
    Thermin = false;
    playtext = false;
    popping = false;
    //bunX = 256;
    //bunY = 24;
    song.loop();    
  }
  if (Stage == 3) {
    scoreboard = false;
    bbunny = false;
    Thermin = true;
    playtext = true;
    //bunX = 139;
    //bunY = 96;
    popping = true;
  }
  if (Stage == 4) {
    scoreboard = false;
    bbunny = true;
    Thermin = false;
    out.removeSignal(sine);
    playtext = false;
    //bunX = 256;
    //bunY = 24;
    popping = false;
    SW_Song.stop();
    //song.close();    
  }
  
  imageMode(CENTER);
  image(sw_stage,260,350);
  // the .2 and .1 values are image scaling values, i.e. .20 is 20% scale factor
  if ( beat.isSnare() && (popping)) {
    image(sw_1,84,116,sw1X + (.05*sw1X),sw1Y + (sw1Y*.05));} else {image(sw_1,84,116);
  };
  if ( beat.isKick() && (popping)) {
    image(sw_2,162,140,sw2X + (.05*sw2X),sw2Y + (sw2Y*.05));} else {image(sw_2,162,140);
  };
  image(sw_3,252,135);
  image(sw_4,348,70);
  
  if ( beat.isHat()  && (popping)) {
    image(sw_5,449,180,sw5X + (.05*sw5X),sw5Y + (sw5Y*.05));} else {image(sw_5,449,180);
  };

  imageMode(CENTER);
  
  if (!bbunny) { 
    tint(random(50,200),random(50,200),random(50,200),180);
    image(logo2,276,275, 200,160);
    noTint();
    waveform.draw();
    image(logo1,270,375,40,50);
  } else {
    if (!jay) {image(logo2,276,235, 40,80);};
    image(logo1,280,340,110,151);
    if (jay) {image(jessica,276,250, 120,120);};
  };
  imageMode(CORNERS);
  
  strokeWeight(.5);
  stroke(#ED9818);
  
  smooth();
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width+70);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width+70);
    line(x1, 417 + out.left.get(i)*50, x2, 417 + out.left.get(i+1)*50);
    line(x1, 430 + out.right.get(i)*50, x2, 430 + out.right.get(i+1)*50);
  };
  noSmooth();
  
  pushMatrix();
  translate(arm1X,arm1Y);
  rotateZ(radians(Aarm1X));
  image(arm1,0,0);
  pushMatrix();
  rotateX(radians(Aarm2Y));
  image(arm2,4,15);
  popMatrix();
  popMatrix();

  
  if (mouseX == 0 ) { Aarm1X = 46.2;} else {
    Aarm1X = ((mouseX * (Aarm1Xmax - Aarm1Xinit)) / width) + Aarm1Xinit;
  };
  
   if (mouseY == 0 ) { Aarm2Y = 8.2;} else {
    Aarm2Y = ((mouseY * (Aarm2Ymax - Aarm2Yinit)) / height) + Aarm2Yinit;
  };
  
   imageMode(CORNER);  
   if (bunball){
    for (int i = 0; i < numSquids; i++) {
    //for (int i = 0; Squids.size(); i++) {
    Squids[i].collide();
    Squids[i].move();
    Squids[i].display();
    };  
  };
  
  textAlign(LEFT);

  textMode(SCREEN);
  rectMode(CORNER);
  textFont(font2);

    textFont(font2);
    textposx = TextStep;   
    text(TextStr,int(width)-textposx,428);
    TextStep = TextStep +1;
    if (TextStep > (width+120)) {
      TextStep = 1;
      if (!playtext) {
        TextStr = textlist[int(random(textlist.length))];
      } else {
        TextStr = textplaying[int(random(textplaying.length))];
      };
    };
    textFont(font1);

   if (nomnon <= MsgTick) {
    for (int i =0; i<=200; i++) {
     text(SysMgs[SysMsg],6,10,300,24);
     };};
    rectMode(CORNER);

   float g = therumin - nomnon;
   if (g <=0) {g=1;};
   float tot = therumin + nomnon + g;
   float propT = (therumin/tot)*75;
   float propG = (g/tot)*75;
   float propN = (nomnon/tot)*75;
   
   //Diagnositics -- enable these when modifying elements
   //println("propT:"+str(propT)+" propG:"+str(propG)+" propN:"+str(propN)+" tot:"+str(tot));
   //println("degrees " + degrees(angleX) + "radians " + radians(angleX));
   //println("Stage: " + str(Stage));
   
   fill(#28c525);
   rect(6,402,propT,8);
   fill(#e5d70d);
   rect(6+propT,402,propG,8);
   fill(#cf271b);
   rect(6+(propT + propG),402,propN,8);
   fill(#FF920D);
   
   if (Stage != 3) {
     int w = 75/3;
     fill(#28c525);
     rect(6,402,w,8);
     fill(#e5d70d);
     rect(6+(w*1),402,w,8);
     fill(#cf271b);
     rect(6+(w*2),402,w,8);
     fill(#FF920D);
   };

   nomnon = nomnon + 1;
}


void mouseMoved()
{
    // with portamento on the frequency will change smoothly
    float freq = map(mouseY, 0, height/2, 1500, 60);
    sine.setFreq(freq);
    // pan always changes smoothly to avoid crackles getting into the signal
    // note that we could call setPan on out, instead of on sine
    // this would sound the same, but the waveforms in out would not reflect the panning
    float pan = map(mouseX, 0, width/2, -1, 1);
    sine.setPan(pan);
    
    if (Stage == 1) {
      //Stage = 2;
      //SysMsg=7;
      //text(SysMgs[SysMsg],6,10,300,24);
     ///};
    
      if (mouseX >= width-1 || mouseX <= 1 || mouseY >=height-1 || mouseY <= 1) {
        SysMsg=7;
        MsgTick=MsgTick = nomnon + 60;
        text(SysMgs[SysMsg],6,10,300,24);
        //
        MsgTick = nomnon + 60;
      };
    };
    
    therumin = therumin + 1;
}

void mousePressed()
{
  //diagnostic
  println("mouseX: " + str(mouseX) + " mouseY: " + str(mouseY) + " Stage: " + str(Stage));
  if (mouseX >= (bunX - 5) && mouseX <= (bunX + 5) && mouseY >= (bunY -5) && mouseY <= (bunY +5)) {
//    && ( (mouseY <= bunY + (bunY+5) ) || (mouseY <= bunY-(bunY+5) ) ) ) {
      if (Stage == 4) {
        Stage = 2;

      } else 
      if (Stage == 3) {
        SysMsg=5;MsgTick = nomnon + 100;Stage = 4;playtext=false;TextStr = textlist[0];

      } else 
      if (Stage == 2) {    
      Stage = 3;
      out.addSignal(sine);SysMsg=2; MsgTick = nomnon + 100;playtext=true;TextStr = textplaying[int(random(textplaying.length))];
 
      } else 
      if (Stage == 3) {    
         SysMsg=4;MsgTick = nomnon + 100;

      }} else 
      if (Stage == 1) {
        Stage = 2;
        SysMsg=4;MsgTick = nomnon + 100;
      } else if (Stage != 2) {SysMsg=2;}
     
     if (mouseX >= 50 && mouseX <= 64 && mouseY >= 74 && mouseY <= 88){
     if (bunball) {bunball = false;} else if (!bunball) {bunball = true;};
   };
   
     if (mouseX >= 487 && mouseX <= 497 && mouseY >= 210 && mouseY <= 218){
     if (jay) {jay = false;} else if (!jay) {jay = true;};
   };
       
     if (mouseX >= 127 && mouseX <= 147 && mouseY >= 104 && mouseY <= 144){
     if (piano) {piano = false;} else if (!piano) {piano = true; sc.instrument(random(127));};
   };
  //text(SysMgs[SysMsg],6,10,300,24);
  //tts.speak(TextStr);
}; 

void keyPressed()
{
  //if (key == 't') {out.addSignal(sine);} else {out.removeSignal(sine);};
  if (key == '1') {Stage = 1;};
  if (key == '2') {Stage = 2;};
  if (key == '3') {Stage = 3;};
  //if (key == 'b') {bunball = true;};
  //if (key == 'B') {bunball = false;};
  if (piano) {sc.playNote(key - 40, 100, 0.5);};
}

void stop()
{
  song.close();
  //minim.close();
  super.stop();
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

class WaveformRenderer implements AudioListener
{
  private float[] left;
  private float[] right;
  
  WaveformRenderer()
  {
    left = null; 
    right = null;
  }
  
  synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }
  
  synchronized void draw()
  {

    smooth();
    pushMatrix();
    translate(wfxpos,wfypos);
    rotate(radians(wfR));
    stroke(random(1,254),random(1,254),random(1,254));
    noFill();
//    // we've got a stereo signal if right or left are not null
//    if ( left != null && right != null )
//    {
//
//      noFill();
//      //color3 = int(random(fColors.length));
//      //stroke(int(random(0,255)));
//      strokeWeight(.75);
//      beginShape();
//      for ( int i = 0; i < 60; i++ )
//      {
//        vertex(i, 90 + left[i]*50);
//      }
//      endShape();
//      rotateZ(radians(-7));
//      rotateY(radians(+6));
//      beginShape();
//      for ( int i = 0; i < 60; i++ )
//      {
//        vertex(i, 95 + right[i]*50);
//      }
//      endShape();
//            
//      beginShape();
//      for ( int i = 0; i < 60; i++ )
//      {
//        vertex(i+168, 90+164 + left[i]*50);
//      }
//      endShape();
//      rotateZ(radians(-3));
//      rotateY(radians(+5));
//      beginShape();
//      for ( int i = 0; i < 60; i++ )
//      {
//        vertex(i+157, 95 + 161 + right[i]*50);
//      }
//      endShape();
//    }
//    else if ( left != null )
//    {
      strokeWeight(.75);
      //noFill();
      beginShape();
      for ( int i = 0; i < 60; i++ )
      {
        vertex(i, 218 + left[i]*50);
      }
      endShape();
      
      beginShape();
      for ( int i = 0; i < 60; i++ )
      {
        vertex(i, 222 + (left[i]*50));
      }
      endShape();
//    }
    popMatrix();
    noStroke();
  }
}

class Squid {
  float x, y;
  float SqScale;
  float vx = 0;
  float vy = 0;
  int id;
  Squid[] others;
 
  Squid(float xin, float yin, float din, int idin, Squid[] oin) {
    x = xin;
    y = yin;
    SqScale = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numSquids; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].SqScale/2 + SqScale/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + SqScale/2 > (width-80)) {
      x = (width-80) - SqScale/2;
      vx *= friction; 
    }
    else if (x - SqScale/2 < 0) {
      x = SqScale/2;
      vx *= friction;
    }
    if (y + SqScale/2 > (height-40)) {
      y = (height-40) - SqScale/2;
      vy *= friction; 
    } 
    else if (y - SqScale/2 < 0) {
      y = SqScale/2;
      vy *= friction;
    }
    if (mousePressed) {
      //gravity = -1.2;
    if ((mouseX >= (x - 60 )) && (mouseX <= (x + 60 )) && (mouseY >= (y - 60 )) && (mouseY <= (y + 60 ))  ) 
    {
      println(str(id) + " got it!  x: " + str(x) + " y: " + str(y));
      x = 0; y= 0;
      //Squids.remove(id);
    }
  }//println("x: " + str(x) + " y: " + str(y) + "mouseX: " + str(mouseX) + " mouseY " + str(mouseY));
  //println("mouseX: " + str(mouseX) + " mouseY " + str(mouseY));
  }
  
  void display() {
    //fill(255, 204);
    image(blik_bunny_ball_sm,x, y, SqScale, SqScale);
  }
}

