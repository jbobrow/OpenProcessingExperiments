
//Music Memory and Drum Machine
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import javax.sound.sampled.*;


Button record, stop, play, loop, bcrash, bhihat, bride, bstom, bbass, bmtom, bsnare, bftom, bmenu, bfreestyle, bmemory, beasy, bmedium, bhard;
RadioButtons r1, r2;
Maxim maxim;
Minim minim;

AudioPlayer crash, hihat, ride, stom, bass, mtom, snare, ftom, buzz;
AudioInput in;

AudioRecorder recorder;
AudioPlayer rec; //player for recording

boolean ccrash=false, chihat=false, cride=false, cstom=false, cbass=false, cmtom=false, csnare=false, cftom=false, freestyle = false, menu=true, memory=false, easy=false, medium=false, hard=false;
int margin = 20;
PImage texture, bg;
int wTime, lTime, time, counter, score;

void setup()
{
  size(600, 600);
  frameRate(60);
  maxim = new Maxim(this);
  minim = new Minim(this);
  crash=maxim.loadFile("lcrash.wav");//crash cymbal
  crash.setLooping(false);
  hihat=maxim.loadFile("hihat.wav");//hihat
  hihat.setLooping(false);
  ride=maxim.loadFile("ride.wav");//ride cymbal
  ride.setLooping(false);
  stom=maxim.loadFile("stom.wav");//small tom
  stom.setLooping(false);
  bass=maxim.loadFile("bass.wav");//bass drum
  bass.setLooping(false);
  mtom=maxim.loadFile("mtom.wav");//medium tom
  mtom.setLooping(false);
  snare=maxim.loadFile("snare.wav");//snare
  snare.setLooping(false);
  ftom=maxim.loadFile("ftom.wav");//floor tom
  ftom.setLooping(false);
  rec = maxim.loadFile("myrecording.wav");//my recording
  rec.setLooping(false);
  texture = loadImage("binding_dark.png");
  bg = loadImage("bg.JPG");



  in = minim.getLineIn(minim.STEREO, 1024, 44100, 16); //get audioinput 


  recorder = minim.createRecorder(in, "data/"+"myrecording.wav", true);//audio recorder




  record = new Button("Record", 100, height-200, 75, 50);
  loop = new Button("Loop", 200, height-200, 75, 50);
  play = new Button("Play", 300, height-200, 75, 50);
  stop = new Button("Stop", 400, height-200, 75, 50);

  String [] radioNames1 = {
    "Crash", "Hihat", "Ride", "Small Tom"
  };
  r1 = new RadioButtons(radioNames1, 4, margin, height/4, width/5, 30, HORIZONTAL);
  String [] radioNames2 = {
    "Bass", "Middle Tom", "Snare", "Floor Tom"
  };

  r2 = new RadioButtons(radioNames2, 4, margin, height/2+margin, width/4-margin, 30, HORIZONTAL);
  bcrash = new Button("Crash", margin, margin, width/5, height/5);
  bcrash.setImage(texture);

  bhihat = new Button("Hihat", width/4+margin, margin, width/5, height/5);
  bhihat.setImage(texture);
  bride = new Button("Ride", width/2+margin, margin, width/5, height/5);
  bride.setImage(texture);
  bstom = new Button("Small Tom", width/4*3+margin, margin, width/5, height/5);
  bstom.setImage(texture);
  bbass = new Button("Bass", margin, height/4+margin*2, width/5, height/5);
  bbass.setImage(texture);
  bmtom = new Button("Medium Tom", width/4+margin, height/4+margin*2, width/5, height/5);
  bmtom.setImage(texture);
  bsnare = new Button("Snare", width/2+margin, height/4+margin*2, width/5, height/5);
  bsnare.setImage(texture);
  bftom = new Button("Floor Tom", width/4*3+margin, height/4+margin*2, width/5, height/5);
  bftom.setImage(texture);
  record.setActiveColor(color(255, 0, 0));//set button color
  r1.setInactiveColor(color(58, 245, 250));
  r2.setInactiveColor(color(58, 245, 250));
  bfreestyle = new Button("Freestyle", width/5, height/5*2, width/4, height/4);
  bmemory = new Button("Memory", width/5*3, height/5*2, width/4, height/4);
  bmenu = new Button("Menu", margin, height-100, 50, 36);
  beasy = new Button("Easy", 400, height-100, 50, 36);
  bmedium = new Button("Medium", 450+margin, height-100, 50, 36);
  bhard =  new Button("Hard", 500+margin*2, height-100, 50, 36);
}

void draw()
{
  background(bg);
  //menu screen
  if (menu) {

    background(bg);
    text("Drum Memory", width/5*2, height/5 );

    bfreestyle.display();
    bmemory.display();
  }




  //freestyle screen
  if (freestyle==true) {
    background(bg);

    record.display();
    loop.display();
    stop.display();
    play.display();
    bcrash.display();
    bhihat.display();
    bride.display();
    bstom.display();
    bbass.display();
    bmtom.display();
    bsnare.display();
    bftom.display();
    r1.display();
    r2.display();
    bmenu.display();
  }
  //music memory screen
  if (memory==true) {
    score=0;//reset score to zero
    background(bg);
    beasy.display();
    bmedium.display();
    bhard.display();
    bcrash.display();
    bhihat.display();
    bride.display();
    bstom.display();
    bbass.display();
    bmtom.display();
    bsnare.display();
    bftom.display();
    wTime=500;
    while (counter<8 && millis ()-lTime>=wTime) {//loop to run through all buttons and sounds
      ccrash=false;
      chihat=false;
      cride=false;
      cstom=false;
      cbass=false;
      cmtom=false;
      csnare=false;
      cftom=false;


      if (counter==0 ) {
        bcrash.setInactiveColor(color(255, 0, 0));
        crash.cue(0);
        crash.play();

        lTime=millis();
      }
      if (counter==1 ) {
        bhihat.setInactiveColor(color(255, 0, 0));
        hihat.cue(0);
        hihat.play();

        lTime=millis();
      }
      if (counter==2 ) {
        bride.setInactiveColor(color(255, 0, 0));
        ride.cue(0);
        ride.play();
        lTime=millis();
      }
      if (counter==3 ) {
        bstom.setInactiveColor(color(255, 0, 0));
        stom.cue(0);
        stom.play();
        lTime=millis();
      }
      if (counter==4) {
        bbass.setInactiveColor(color(255, 0, 0));
        bass.cue(0);
        bass.play();
        lTime=millis();
      }
      if (counter==5 ) {
        bmtom.setInactiveColor(color(255, 0, 0));
        mtom.cue(0);
        mtom.play();
        lTime=millis();
      }
      if (counter==6 ) {
        bsnare.setInactiveColor(color(255, 0, 0));
        snare.cue(0);
        snare.play();
        lTime=millis();
      }
      if (counter==7) {
        bftom.setInactiveColor(color(255, 0, 0));
        ftom.cue(0);
        ftom.play();
        lTime=millis();
      }


      counter++;
      lTime=millis();
    }
  }


  if (easy) {//music memory on easy setting
    bcrash.display();
    bhihat.display();
    bride.display();
    bstom.display();
    bbass.display();
    bmtom.display();
    bsnare.display();
    bftom.display();
    bmenu.display();

    text("Score: "+ str(score), margin, margin );


    wTime=1500;
    while (counter<20 && millis ()-lTime>=wTime) {
      ccrash=false;
      chihat=false;
      cride=false;
      cstom=false;
      cbass=false;
      cmtom=false;
      csnare=false;
      cftom=false;
      int r= int(random(8));

      if (r==0 ) {
        bcrash.setInactiveColor(color(255, 0, 0));
        crash.cue(0);
        crash.play();

        time=millis();

        if (millis()-time<wTime) {
          ccrash=true;
        }

        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==1 ) {
        bhihat.setInactiveColor(color(255, 0, 0));
        hihat.cue(0);
        hihat.play();

        time=millis();
        if (millis()-time<wTime) {
          chihat=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        //bhihat.setInactiveColor(color(0,0,0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==2 ) {
        bride.setInactiveColor(color(255, 0, 0));
        ride.cue(0);
        ride.play();
        time=millis();
        if (millis()-time<wTime) {
          cride=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        //bride.setInactiveColor(color(0,0,0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==3 ) {
        bstom.setInactiveColor(color(255, 0, 0));
        stom.cue(0);
        stom.play();
        time=millis();
        if (millis()-time<wTime) {
          cstom = true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        //bstom.setInactiveColor(color(0,0,0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==4) {
        bbass.setInactiveColor(color(255, 0, 0));
        bass.cue(0);
        bass.play();
        time=millis();
        if (millis()-time<wTime) {
          cbass=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));

        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==5 ) {
        bmtom.setInactiveColor(color(255, 0, 0));
        mtom.cue(0);
        mtom.play();
        time=millis();
        if (millis()-time<wTime) {
          cmtom=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));

        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==6 ) {
        bsnare.setInactiveColor(color(255, 0, 0));
        snare.cue(0);
        snare.play();
        time=millis();
        if (millis()-time<wTime) {
          csnare=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));

        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==7) {
        bftom.setInactiveColor(color(255, 0, 0));
        ftom.cue(0);
        ftom.play();
        time=millis();
        if (millis()-time<wTime) {
          cftom=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
      }

      System.out.println(counter+ " " + r);
      counter++;
      lTime=millis();
    }
  }
  if (medium) {//music memory on medium setting
    bcrash.display();
    bhihat.display();
    bride.display();
    bstom.display();
    bbass.display();
    bmtom.display();
    bsnare.display();
    bftom.display();

    bmenu.display();


    text("Score: "+ str(score), margin, margin );


    wTime=1000;
    while (counter<20 && millis ()-lTime>=wTime) {
      ccrash=false;
      chihat=false;
      cride=false;
      cstom=false;
      cbass=false;
      cmtom=false;
      csnare=false;
      cftom=false;
      int r= int(random(8));

      if (r==0 ) {
        bcrash.setInactiveColor(color(255, 0, 0));
        crash.cue(0);
        crash.play();

        time=millis();

        if (millis()-time<wTime) {
          ccrash=true;
        }

        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==1 ) {
        bhihat.setInactiveColor(color(255, 0, 0));
        hihat.cue(0);
        hihat.play();

        time=millis();
        if (millis()-time<wTime) {
          chihat=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));

        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==2 ) {
        bride.setInactiveColor(color(255, 0, 0));
        ride.cue(0);
        ride.play();
        time=millis();
        if (millis()-time<wTime) {
          cride=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));

        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==3 ) {
        bstom.setInactiveColor(color(255, 0, 0));
        stom.cue(0);
        stom.play();
        time=millis();
        if (millis()-time<wTime) {
          cstom = true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));

        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==4) {
        bbass.setInactiveColor(color(255, 0, 0));
        bass.cue(0);
        bass.play();
        time=millis();
        if (millis()-time<wTime) {
          cbass=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));

        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==5 ) {
        bmtom.setInactiveColor(color(255, 0, 0));
        mtom.cue(0);
        mtom.play();
        time=millis();
        if (millis()-time<wTime) {
          cmtom=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));

        bsnare.setInactiveColor(color(0, 0, 0));
        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==6 ) {
        bsnare.setInactiveColor(color(255, 0, 0));
        snare.cue(0);
        snare.play();
        time=millis();
        if (millis()-time<wTime) {
          csnare=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));

        bftom.setInactiveColor(color(0, 0, 0));
      }
      if (r==7) {
        bftom.setInactiveColor(color(255, 0, 0));
        ftom.cue(0);
        ftom.play();
        time=millis();
        if (millis()-time<wTime) {
          cftom=true;
        }
        bcrash.setInactiveColor(color(0, 0, 0));
        bhihat.setInactiveColor(color(0, 0, 0));
        bride.setInactiveColor(color(0, 0, 0));
        bstom.setInactiveColor(color(0, 0, 0));
        bbass.setInactiveColor(color(0, 0, 0));
        bmtom.setInactiveColor(color(0, 0, 0));
        bsnare.setInactiveColor(color(0, 0, 0));
      }


      counter++;
      lTime=millis();
    }
  }
  if (hard) {//music memory on hard setting
    bcrash.display();
    bhihat.display();
    bride.display();
    bstom.display();
    bbass.display();
    bmtom.display();
    bsnare.display();
    bftom.display();

    bmenu.display();


    text("Score: "+ str(score), margin, margin );

    wTime=700;
    while (counter<20 && millis ()-lTime>=wTime) {

      ccrash=false;
      chihat=false;
      cride=false;
      cstom=false;
      cbass=false;
      cmtom=false;
      csnare=false;
      cftom=false;
      int r= int(random(8));

      if (r==0 ) {

        crash.cue(0);
        crash.play();

        time=millis();

        if (millis()-time<wTime) {
          ccrash=true;
        }
      }
      if (r==1 ) {

        hihat.cue(0);
        hihat.play();

        time=millis();
        if (millis()-time<wTime) {
          chihat=true;
        }
      }
      if (r==2 ) {

        ride.cue(0);
        ride.play();
        time=millis();
        if (millis()-time<wTime) {
          cride=true;
        }
      }
      if (r==3 ) {

        stom.cue(0);
        stom.play();
        time=millis();
        if (millis()-time<wTime) {
          cstom = true;
        }
      }
      if (r==4) {

        bass.cue(0);
        bass.play();
        time=millis();
        if (millis()-time<wTime) {
          cbass=true;
        }
      }
      if (r==5 ) {

        mtom.cue(0);
        mtom.play();
        time=millis();
        if (millis()-time<wTime) {
          cmtom=true;
        }
      }
      if (r==6 ) {

        snare.cue(0);
        snare.play();
        time=millis();
        if (millis()-time<wTime) {
          csnare=true;
        }
      }
      if (r==7) {

        ftom.cue(0);
        ftom.play();
        time=millis();
        if (millis()-time<wTime) {
          cftom=true;
        }
      }


      counter++;
      lTime=millis();
    }
  }
}


void mousePressed()
{
 
if (bfreestyle.mousePressed()) {
    if (menu) { 
      freestyle=true;
      menu=false;
      memory=false;
    }
  }
  if (bmenu.mousePressed()) {
    if (freestyle||easy||medium||hard) {//menu button can only be pressed on the freestyle or game screens
      menu=true;
      freestyle=false;
      memory=false;
      easy=false;
      medium=false;
      hard=false;
      easy=false;
      medium=false;
      hard=false;


      counter=0;
      bcrash.setInactiveColor(color(0, 0, 0));
      bhihat.setInactiveColor(color(0, 0, 0));
      bride.setInactiveColor(color(0, 0, 0));
      bstom.setInactiveColor(color(0, 0, 0));
      bbass.setInactiveColor(color(0, 0, 0));
      bmtom.setInactiveColor(color(0, 0, 0));
      bsnare.setInactiveColor(color(0, 0, 0));
      bftom.setInactiveColor(color(0, 0, 0));
    }
  }

  if (bmemory.mousePressed()) {
    if (menu) {
      menu=false;
      freestyle=false;
      memory=true;

      easy=false;
      medium=false;
      hard=false;
    }
  }
  if (beasy.mousePressed()) {
    if (memory) {
      easy=true;
      menu=false;
      freestyle=false;
      memory=false;


      counter=0;
      bcrash.setInactiveColor(color(0, 0, 0));
      bhihat.setInactiveColor(color(0, 0, 0));
      bride.setInactiveColor(color(0, 0, 0));
      bstom.setInactiveColor(color(0, 0, 0));
      bbass.setInactiveColor(color(0, 0, 0));
      bmtom.setInactiveColor(color(0, 0, 0));
      bsnare.setInactiveColor(color(0, 0, 0));
      bftom.setInactiveColor(color(0, 0, 0));
    }
  }
  if (bmedium.mousePressed()) {
    if (memory) {
      medium=true;
      menu=false;
      freestyle=false;
      memory=false;


      counter=0;
      bcrash.setInactiveColor(color(0, 0, 0));
      bhihat.setInactiveColor(color(0, 0, 0));
      bride.setInactiveColor(color(0, 0, 0));
      bstom.setInactiveColor(color(0, 0, 0));
      bbass.setInactiveColor(color(0, 0, 0));
      bmtom.setInactiveColor(color(0, 0, 0));
      bsnare.setInactiveColor(color(0, 0, 0));
      bftom.setInactiveColor(color(0, 0, 0));
    }
  }
  if (bhard.mousePressed()) {
    if (memory) {
      hard=true;
      menu=false;
      freestyle=false;
      memory=false;


      counter=0;
      bcrash.setInactiveColor(color(0, 0, 0));
      bhihat.setInactiveColor(color(0, 0, 0));
      bride.setInactiveColor(color(0, 0, 0));
      bstom.setInactiveColor(color(0, 0, 0));
      bbass.setInactiveColor(color(0, 0, 0));
      bmtom.setInactiveColor(color(0, 0, 0));
      bsnare.setInactiveColor(color(0, 0, 0));
      bftom.setInactiveColor(color(0, 0, 0));
    }
  }


  if (bcrash.mousePressed()) {
    if (freestyle||easy||medium||hard) { 
      crash.cue(0);
      crash.play();

      if (ccrash) {
        score++;
        ccrash=false;
      }
      else {
        score--;
      }
    }
  }
  if (bhihat.mousePressed()) {

    if (freestyle||easy||medium||hard) {
      hihat.cue(0);
      hihat.play();
      if (chihat) {
        score++;
        chihat=false;
      }
      else {
        score--;
      }
    }
  }
  if (bride.mousePressed()) {
    if (freestyle||easy||medium||hard) {  
      ride.cue(0);
      ride.play();
      if (cride) {
        score++;
        cride=false;
      }
      else {
        score--;
      }
    }
  }
  if (bstom.mousePressed()) {
    if (freestyle||easy||medium||hard) {  
      stom.cue(0);
      stom.play();
      if (cstom) {
        score++;
        cstom=false;
      }
      else {
        score--;
      }
    }
  }
  if (bbass.mousePressed()) {
    if (freestyle||easy||medium||hard) {  
      bass.cue(0);
      bass.play();
      if (cbass) {
        score++;
        cbass=false;
      }
      else {
        score--;
      }
    }
  }
  if (bmtom.mousePressed()) {
    if (freestyle||easy||medium||hard) {  
      mtom.cue(0);
      mtom.play();
      if (cmtom) {
        score++;
        cmtom=false;
      }
      else {
        score--;
      }
    }
  }
  if (bsnare.mousePressed()) {
    if (freestyle||easy||medium||hard) {  
      snare.cue(0);
      snare.play();
      if (csnare) {
        score++;
        csnare=false;
      }
      else {
        score--;
      }
    }
  }
  if (bftom.mousePressed()) {

    if (freestyle||easy||medium||hard) {
      ftom.cue(0);
      ftom.play();
      if (cftom) {
        score++;
        cftom=false;
      }
      else {
        score--;
      }
    }
  }


  if (loop.mousePressed()) {

    crash.setLooping(false);  
    hihat.setLooping(false);
    ride.setLooping(false);
    stom.setLooping(false);
    bass.setLooping(false);
    mtom.setLooping(false);
    snare.setLooping(false);
    ftom.setLooping(false);
  }
  if (record.mousePressed()) {
    if (freestyle) {
      recorder.beginRecord();//begin recording
    }
  }
  if (stop.mousePressed()) {
    if (freestyle) {
      recorder.endRecord(); //end  recording
      recorder.save();  //save  recording

      rec = maxim.loadFile("myrecording.wav");
    }
  }
  if (play.mousePressed()) {
    if (freestyle) {
      rec.cue(0);
      rec.play();
    }
  }

}

void mouseDragged()
{
 
}

void mouseReleased()
{
  bfreestyle.mouseReleased();
  bmenu.mouseReleased();
  bmemory.mouseReleased();
  bcrash.mouseReleased();
  bhihat.mouseReleased();
  bride.mouseReleased();
  bstom.mouseReleased();
  bbass.mouseReleased();
  bmtom.mouseReleased();
  bsnare.mouseReleased();
  bftom.mouseReleased();
  loop.mouseReleased();
  record.mouseReleased();
  play.mouseReleased();
  beasy.mouseReleased();
  bmedium.mouseReleased();
  bhard.mouseReleased();
  stop.mouseReleased();

}
void keyReleased()
{
  if ( key == 'l' ) 
  {
    if (bhihat.mousePressed()) {

      hihat.play();
      hihat.setLooping(true);
    }
    else if (bcrash.mousePressed()) {

      crash.play();
      crash.setLooping(true);
    }
    else if (bride.mousePressed()) {

      ride.play();
      ride.setLooping(true);
    }
    else if (bstom.mousePressed()) {

      stom.play();
      stom.setLooping(true);
    }
    if (bbass.mousePressed()) {

      bass.play();
      bass.setLooping(true);
    }
    else  if (bmtom.mousePressed()) {

      mtom.play();
      mtom.setLooping(true);
    }
    else  if (bsnare.mousePressed()) {

      snare.play();
      snare.setLooping(true);
    }
    else  if (bftom.mousePressed()) {

      ftom.play();
      ftom.setLooping(true);
    }
  }
}



int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(11, 207,227);
  color activeColor = color();
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }
  
  void setImageTint(float r, float g, float b)
  {
    imageTint = color(r,g,b);
  }

  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;
  
  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }
  
  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }
  
  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }
  
  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
    
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    
    float textW = textWidth;
    if(name == "")
      textW = 0;
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textW, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textW, extents.x, extents.y-textW);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textW-4); 
        rect(pos.x+textW+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2 + (extents.y-textW-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;
  /*
  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }
  */
  MultiSlider(int numSliders, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w, h*numSliders);
    sliders = new Slider[numSliders];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider("", 0, min, max, bx, by, w, h, orientation);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(i >= names.length)
        break;
      sliders[i].setName(names[i]);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}



