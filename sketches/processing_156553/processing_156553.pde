
// define buttons and sliders 
Toggle[] trackPlay;
Slider[] volume;
MultiSlider[] beats;  

// audio engine
Maxim maxim;
// synthesizers
WavetableSynth synthesizer1;
WavetableSynth synthesizer2;

// drum samples
AudioPlayer track1;
AudioPlayer track2;
AudioPlayer track3;
AudioPlayer track4;
AudioPlayer track5;
AudioPlayer track6;
AudioPlayer track7;
AudioPlayer track8;

// buttons
Button tempoUp, tempoDown, synth1edit, synth2edit, backToDesktop;
Toggle playStop;
RadioButtons[] s1notes;
RadioButtons[] s2notes;
RadioButtons octave1, octave2;


// images
PImage bg1;
PImage bg2;
PImage ButtonInactive;
PImage ButtonActive;
PImage CountInactive;
PImage CountActive;
PImage tempoUpPressed;
PImage tempoUpReleased;
PImage tempoDownPressed;
PImage tempoDownReleased;
PImage synth1ButtonA;
PImage synth1ButtonD;
PImage synth2ButtonA;
PImage synth2ButtonD;
PImage backButtonA;
PImage backButtonD;
PImage octaveButtonA;
PImage octaveButtonD;
PImage synthNotesA;
PImage synthNotesD;

// some variables
int margin = 20;
int trackMargin = 5;
int trackHeight = 40;
int trackNumber = 10;
int currentTempo = 8;
PFont f;
int numBeats = 16;
int currentBeat = 0;

int playhead;
int[] notes1 = {
  0, 3, 3, 12, 10, 12, 10, 10, 12, 7, 7, 5, 6, 6, 3, 3
};
int[] notes2 = {
  3, 0, 5, 12, 12, 12, 5, 7, 10, 7, 12, 7, 3, 6, 3, 0
};

//boolean playit=false;

float fc1, res1, attack1, release1;
float fc2, res2, attack2, release2;
Slider dt1, dg1, a1, r1, f1, q1, o1;
Slider dt2, dg2, a2, r2, f2, q2, o2;
MultiSlider seq1;
MultiSlider seq2;

double transpose1 = 0;
double transpose2 = 0;

float[] wavetable1 = new float[514];
float[] wavetable2 = new float[514];

// some boolean variables
boolean isPlaying=false;
boolean[] isTrackPlaying;
boolean seqDesktop = true;
boolean synth1Desktop = false;
boolean synth2Desktop = false;

void setup()
{
  size(640, 1136);

  maxim = new Maxim(this);
  synthesizer1 = maxim.createWavetableSynth(128);
  synthesizer2 = maxim.createWavetableSynth(128);
  // name, value, min, max, pos.x, pos.y, width, height
  dt1 = new Slider("d time", 1, 0, 100, 50, 20, 200, 20, HORIZONTAL);
  dg1 = new Slider("d amnt", 1, 0, 100, 50, 40, 200, 20, HORIZONTAL);
  a1 = new Slider("attack", 1, 0, 100, 50, 60, 200, 20, HORIZONTAL);
  r1 = new Slider("release", 20, 0, 100, 50, 80, 200, 20, HORIZONTAL);
  f1 = new Slider("filter", 20, 0, 100, 50, 100, 200, 20, HORIZONTAL);
  q1 = new Slider("res", 20, 0, 100, 50, 120, 200, 20, HORIZONTAL);
  o1 = new Slider("transpose", 0, 1, 80, 50, 140, 200, 20, HORIZONTAL);
  seq1 = new MultiSlider(notes1.length, 0, 256, 0, 300, width/18/2, 150, UPWARDS);

  // name, value, min, max, pos.x, pos.y, width, height
  dt2 = new Slider("delay time", 1, 0, 100, 50, 20, 200, 20, HORIZONTAL);
  dg2 = new Slider("delay amnt", 1, 0, 100, 50, 40, 200, 20, HORIZONTAL);
  a2 = new Slider("attack", 1, 0, 100, 50, 60, 200, 20, HORIZONTAL);
  r2 = new Slider("release", 20, 0, 100, 50, 80, 200, 20, HORIZONTAL);
  f2 = new Slider("filter", 20, 0, 100, 50, 100, 200, 20, HORIZONTAL);
  q2 = new Slider("res", 20, 0, 100, 50, 120, 200, 20, HORIZONTAL);
  o2 = new Slider("transpose", 10, 1, 80, 50, 140, 200, 20, HORIZONTAL);
  seq2 = new MultiSlider(notes2.length, 0, 256, 0, 300, width/18/2, 150, UPWARDS);

  // load drum samples
  track1 = maxim.loadFile("bd1.wav");
  track1.setLooping(false);
  track2 = maxim.loadFile("bd2.wav");
  track2.setLooping(false);
  track3 = maxim.loadFile("sn1.wav");
  track3.setLooping(false);
  track4 = maxim.loadFile("sn2.wav");
  track4.setLooping(false);
  track5 = maxim.loadFile("hh1.wav");
  track5.setLooping(false);
  track6 = maxim.loadFile("hh2.wav");
  track6.setLooping(false);
  track7 = maxim.loadFile("clap.wav");
  track7.setLooping(false);
  track8 = maxim.loadFile("bell.wav");
  track8.setLooping(false);

  frameRate(32);

  // load images
  ButtonInactive = loadImage("play.png");
  ButtonActive = loadImage("stop.png");
  CountInactive = loadImage("play.png");
  CountActive = loadImage("stop.png");
  tempoUpPressed = loadImage("tempoUpActive.png");
  tempoUpReleased = loadImage("tempoUpInactive.png");
  tempoDownPressed = loadImage("tempoDownActive.png");
  tempoDownReleased = loadImage("tempoDownInactive.png");
  synth1ButtonA = loadImage("synth1editA.png");
  synth1ButtonD = loadImage("synth1editD.png"); 
  synth2ButtonA = loadImage("synth2editA.png");
  synth2ButtonD = loadImage("synth1editD.png");
  backButtonA = loadImage("backButtonA.png");
  backButtonD = loadImage("backButtonD.png");
  octaveButtonA = loadImage("octaveA.png");
  octaveButtonD = loadImage("octaveD.png");
  synthNotesA = loadImage("synthNotesA.png");
  synthNotesD = loadImage("synthNotesD.png");
  
  bg1 = loadImage("BG1.png");
  bg2 = loadImage("BG2.png");
  
  // load font
  f = createFont("Arial", 16, true);
  textFont(f, 15);
  fill(255);

  // set all tracks to not playing
  isTrackPlaying = new boolean[trackNumber];
  for (int i=0; i<trackNumber; i++) {
    isTrackPlaying[i] = false;
  }
  // buttons
  tempoUp = new Button("tempoUp", 40, 480, 20, 20);
  tempoUp.setInactiveImage(tempoUpPressed);
  tempoUp.setActiveImage(tempoUpReleased);
  tempoDown = new Button("tempoDown", 40, 500, 20, 20);
  tempoDown.setInactiveImage(tempoDownPressed);
  tempoDown.setActiveImage(tempoDownReleased);
  synth1edit = new Button("synth1edit", 80, (10+margin+(8*(trackMargin+trackHeight))), 20, 20);
  synth1edit.setInactiveImage(synth1ButtonD);
  synth1edit.setActiveImage(synth1ButtonA);
  synth2edit = new Button("synth2edit", 80, (10+margin+(9*(trackMargin+trackHeight))), 20, 20);
  synth2edit.setInactiveImage(synth2ButtonD);
  synth2edit.setActiveImage(synth2ButtonA);
  backToDesktop = new Button("backToDesktop", 20, (50+margin+(9*(trackMargin+trackHeight))), 20, 20);
  backToDesktop.setInactiveImage(backButtonD);
  backToDesktop.setActiveImage(backButtonA);

  // toggle buttons
  playStop = new Toggle("PlayStop", width/2-40, 600, 80, 80);
  playStop.setInactiveImage(ButtonInactive);
  playStop.setActiveImage(ButtonActive);

  trackPlay = new Toggle[trackNumber];
  for (int i=0; i<trackPlay.length; i++) {
    trackPlay[i] = new Toggle("track1Play", margin, (margin+(i*(trackMargin+trackHeight))), 40, 40);
    trackPlay[i].setInactiveImage(ButtonInactive);
    trackPlay[i].setActiveImage(ButtonActive);
  }

  // sliders
  volume = new Slider[trackNumber];
  for (int i=0; i<volume.length; i++) {
    volume[i] = new Slider(" ", 90, 0, 100, 140, (5+margin+(i*(trackMargin+trackHeight))), 150, 20, HORIZONTAL);
    volume[i].setInactiveColor(color(120, 80, 80));
  }

  // multisliders
  String [] sliderNames = {
  };//"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"};
  beats = new MultiSlider[trackNumber];
  for (int i=0; i<beats.length-2; i++) {
    beats[i] = new MultiSlider(numBeats, 0, 100, 300, (margin+(i*(trackMargin+trackHeight))), 20, 40, UPWARDS);
    beats[i].setNames(sliderNames);
  }
  beats[8] = new MultiSlider(numBeats, 0, 100, 300, (margin+(8*(trackMargin+trackHeight))), 20, 40, UPWARDS);
  beats[8].setNames(sliderNames);
  beats[9] = new MultiSlider(numBeats, 0, 100, 300, (margin+(9*(trackMargin+trackHeight))), 20, 40, UPWARDS);
  beats[9].setNames(sliderNames);

  // radio buttons
  //String [] radioNames = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
  s1notes = new RadioButtons[numBeats];
  s2notes = new RadioButtons[numBeats];
  for (int i=0; i<numBeats; i++) {
    s1notes[i] = new RadioButtons(12, (140+i*30), 180, 30, 10, VERTICAL);
    s1notes[i].setAllInactiveImages(synthNotesD);
    s1notes[i].setAllActiveImages(synthNotesA);
    s2notes[i] = new RadioButtons(12, (140+i*30), 180, 30, 10, VERTICAL);
    s2notes[i].setAllInactiveImages(synthNotesD);
    s2notes[i].setAllActiveImages(synthNotesA);
  }
  octave1 = new RadioButtons(5, 320, 40, 30, 30, HORIZONTAL);
  octave1.setAllInactiveImages(octaveButtonD);
  octave1.setAllActiveImages(octaveButtonA);
  octave2 = new RadioButtons(5, 320, 40, 30, 30, HORIZONTAL);
  octave2.setAllInactiveImages(octaveButtonD);
  octave2.setAllActiveImages(octaveButtonA);

  for (int i = 0; i < 514; i++) {

    wavetable1[i]=((float)i/514)-0.5;
    wavetable2[i]=((float)i/514)-0.5;
  }

  synthesizer1.waveTableSize(514);
  synthesizer1.loadWaveTable(wavetable1);
  synthesizer1.volume(0);
  synthesizer2.waveTableSize(514);
  synthesizer2.loadWaveTable(wavetable2);
  synthesizer2.volume(0);
}

void draw()
{
  if (seqDesktop) {
    
    //background(127, 0, 0); 
    image(bg1, 0, 0, width, height);
    text("BD1", 120, (25+margin+(0*(trackMargin+trackHeight))));
    text("BD2", 120, (25+margin+(1*(trackMargin+trackHeight))));
    text("SN1", 120, (25+margin+(2*(trackMargin+trackHeight))));
    text("SN2", 120, (25+margin+(3*(trackMargin+trackHeight))));
    text("HHC", 120, (25+margin+(4*(trackMargin+trackHeight))));
    text("HHO", 120, (25+margin+(5*(trackMargin+trackHeight))));
    text("CL", 120, (25+margin+(6*(trackMargin+trackHeight))));
    text("BL", 120, (25+margin+(7*(trackMargin+trackHeight))));
    text("Synth1", 120, (25+margin+(8*(trackMargin+trackHeight))));
    text("Synth2", 120, (25+margin+(9*(trackMargin+trackHeight))));
    text("Tempo", 80, 505);
    for (int i=0; i<trackNumber; i++) {
      trackPlay[i].display();
      volume[i].display();
      beats[i].display();
    }
    playStop.display();
    tempoUp.display();
    tempoDown.display();
    synth1edit.display();
    synth2edit.display();

    // playhead position
    for (int i = 0; i < numBeats; i++) {
      image(ButtonActive, 300+(i*20), 500, 20, 20);
      image(ButtonInactive, 300+(currentBeat*20), 500, 20, 20);
    }
  } else if (synth1Desktop) {
    
    image(bg2, 0, 0, width, height);
    backToDesktop.display();
    dt1.display();
    dg1.display();
    a1.display();
    r1.display();
    f1.display();
    q1.display(); 
    //seq1.display();

    //fa1.display(); 
    //o1.display();
    for (int i=0; i<numBeats; i++) {
      s1notes[i].display();
    }
    octave1.display();
    trackPlay[8].display();
      volume[8].display();
      beats[8].display();
  } else if (synth2Desktop) {
    
    image(bg2, 0, 0, width, height);
    dt2.display();
    dg2.display();
    a2.display();
    r2.display();
    f2.display();
    q2.display();
    //fa2.display(); 
    //o2.display();
    //seq2.display();
    backToDesktop.display();
    for (int i=0; i<numBeats; i++) {
      s2notes[i].display();
    }
    octave2.display();
    trackPlay[9].display();
      volume[9].display();
      beats[9].display();
  }

  // update playhead
  playhead ++;
  if (isPlaying) {
    if (playhead%currentTempo==0) {
      if (isTrackPlaying[0]) {
        track1.volume((beats[0].get(currentBeat))*(volume[0].get())/10000);
        track1.cue(0);
        track1.play();
      }
      if (isTrackPlaying[1]) {
        track2.volume((beats[1].get(currentBeat))*(volume[1].get())/10000);
        track2.cue(0);
        track2.play();
      }
      if (isTrackPlaying[2]) {
        track3.volume((beats[2].get(currentBeat))*(volume[2].get())/10000);
        track3.cue(0);
        track3.play();
      }
      if (isTrackPlaying[3]) {
        track4.volume((beats[3].get(currentBeat))*(volume[3].get())/10000);
        track4.cue(0);
        track4.play();
      }
      if (isTrackPlaying[4]) {
        track5.volume((beats[4].get(currentBeat))*(volume[4].get())/10000);
        track5.cue(0);
        track5.play();
      }
      if (isTrackPlaying[5]) {
        track6.volume((beats[5].get(currentBeat))*(volume[5].get())/10000);
        track6.cue(0);
        track6.play();
      }
      if (isTrackPlaying[6]) {
        track7.volume((beats[6].get(currentBeat))*(volume[6].get())/10000);
        track7.cue(0);
        track7.play();
      }
      if (isTrackPlaying[7]) {
        track8.volume((beats[7].get(currentBeat))*(volume[7].get())/10000);
        track8.cue(0);
        track8.play();
      }
      if (isTrackPlaying[8]) {
        synthesizer1.play();
        synthesizer1.volume((beats[8].get(currentBeat))*(volume[8].get())/10000);
      } else {
        synthesizer1.stop();
      }
      if (isTrackPlaying[9]) {
        synthesizer2.play();
        synthesizer2.volume((beats[9].get(currentBeat))*(volume[9].get())/10000);
        //synthesizer2.setFrequency(mtof[notes1[playhead/4%16]+30]);
      } else {
        synthesizer2.stop();
      }
      currentBeat++;
      if (currentBeat >= numBeats)
        currentBeat = 0;
    }
  } else {
    synthesizer1.stop();
    synthesizer2.stop();
  }
  synthesizer1.setFrequency(mtof[notes1[currentBeat]+30]);
  synthesizer2.setFrequency(mtof[notes2[currentBeat]+30]);

  // synth 1 settings
  if (f1.get()!=0) {
    fc1=f1.get()*100;
    synthesizer1.setFilter(fc1, res1);
  }

  if (dt1.get()!=0) {
    synthesizer1.setDelayTime((float) dt1.get()/50);
  }

  if (dg1.get()!=0) {
    // delay effect not implemented in java/ android yet....
    synthesizer1.setDelayFeedback((int)dg1.get()/100);
  }

  if (q1.get() !=0 ) {
    res1=q1.get() / 50;
    //println("res "+res1);
    synthesizer1.setFilter(fc1, res1);
  }

  if (a1.get()!= 0) {
    attack1=a1.get()*10;
  }

  if (r1.get() !=0 ) {
    release1=r1.get()*10;
  }
  if (o1.get()!=0) {
    transpose1=Math.floor(o1.get());
    
  }

  // synth 2 settings
  if (f2.get()!=0) {
    fc2=f2.get()*100;
    synthesizer2.setFilter(fc2, res2);
  }

  if (dt2.get()!=0) {
    synthesizer2.setDelayTime((float) dt2.get()/50);
  }

  if (dg2.get()!=0) {
    synthesizer2.setDelayFeedback((int)dg2.get()/100);
  }

  if (q2.get() !=0 ) {
    res2=q2.get() / 50;
    //println("res "+res2);
    synthesizer2.setFilter(fc2, res2);
  }

  if (a2.get()!= 0) {
    attack2=a2.get()*10;
  }

  if (r2.get() !=0 ) {
    release2=r2.get()*10;
  }
  if (o2.get()!=0) {
    transpose2=Math.floor(o2.get());
  }
}


void mousePressed()
{
  if (seqDesktop) {
    for (int i=0; i<trackNumber; i++) {
      trackPlay[i].mousePressed();
      volume[i].mousePressed();
      beats[i].mousePressed();
    }
    playStop.mousePressed();
    tempoUp.mousePressed();
    tempoDown.mousePressed();
    synth1edit.mousePressed();
    synth2edit.mousePressed();
  } else if (synth1Desktop) {
    //  synthesizer1.ramp(0.5,1);
    backToDesktop.mousePressed();
    dt1.mousePressed();
    dg1.mousePressed();
    a1.mousePressed();
    r1.mousePressed();
    f1.mousePressed();
    q1.mousePressed();
    seq1.mousePressed();
    o1.mousePressed();
    for (int i=0; i<numBeats; i++) {
      s1notes[i].mousePressed();
    }
    octave1.mousePressed();
    trackPlay[8].mousePressed();
      volume[8].mousePressed();
      beats[8].mousePressed();
  } else if (synth2Desktop) {
    backToDesktop.mousePressed();
    dt2.mousePressed();
    dg2.mousePressed();
    a2.mousePressed();
    r2.mousePressed();
    f2.mousePressed();
    q2.mousePressed();
    //fa2.mousePressed();
    o2.mousePressed();
    seq2.mousePressed();
    for (int i=0; i<numBeats; i++) {
      s2notes[i].mousePressed();
    }
    octave2.mousePressed();
    trackPlay[9].mousePressed();
      volume[9].mousePressed();
      beats[9].mousePressed();
  }
}


void mouseDragged()
{
  if (seqDesktop) {
    for (int i=0; i<trackNumber; i++) {
      trackPlay[i].mouseDragged();
      if (volume[i].mouseDragged()) {
      }
      beats[i].mouseDragged();
    }
    playStop.mouseDragged();
    tempoUp.mouseDragged();
    tempoDown.mouseDragged();
    synth1edit.mouseDragged();
    synth1edit.mouseDragged();
  } else if (synth1Desktop) {
    backToDesktop.mouseDragged();
    dt1.mouseDragged();
    dg1.mouseDragged();
    a1.mouseDragged();
    r1.mouseDragged();
    f1.mouseDragged();
    q1.mouseDragged();
    seq1.mouseDragged();
    o1.mouseDragged();
    for (int i=0; i<numBeats; i++) {
      s1notes[i].mouseDragged();
    }
    octave1.mouseDragged();
    trackPlay[8].mouseDragged();
      if (volume[8].mouseDragged()) {
      }
      beats[8].mouseDragged();
  } else if (synth2Desktop) {
    backToDesktop.mouseDragged();
    dt2.mouseDragged();
    dg2.mouseDragged();
    a2.mouseDragged();
    r2.mouseDragged();
    f2.mouseDragged();
    q2.mouseDragged();
    //fa2.mouseDragged();
    o2.mouseDragged();
    seq2.mouseDragged();
    for (int i=0; i<numBeats; i++) {
      s2notes[i].mouseDragged();
    }
    octave2.mouseDragged();
    trackPlay[9].mouseDragged();
      if (volume[9].mouseDragged()) {
      }
      beats[9].mouseDragged();
  }
  //synthesizer1.filterCutoff(200+mouseX,10);
}

void mouseReleased()
{
  if (seqDesktop) {
    for (int i=0; i<trackNumber; i++) {
      if (trackPlay[i].mouseReleased()) {
        isTrackPlaying[i]=!isTrackPlaying[i];
      }
      volume[i].mouseReleased();
      beats[i].mouseReleased();
    }
    if (playStop.mouseReleased()) {
      isPlaying=!isPlaying;
    }
    if (tempoUp.mouseReleased()) {
      currentTempo--;
      if (currentTempo<1) {
        currentTempo=1;
      }
    }
    if (tempoDown.mouseReleased()) {
      currentTempo++;
      if (currentTempo>100) {
        currentTempo=100;
      }
    }
    if (synth1edit.mouseReleased()) {
      seqDesktop=false;
      synth1Desktop=true;
      synth2Desktop=false;
    }
    if (synth2edit.mouseReleased()) {
      seqDesktop=false;
      synth1Desktop=false;
      synth2Desktop=true;
    }
  } else if (synth1Desktop) {
    if (backToDesktop.mouseReleased()) {
      seqDesktop=true;
      synth1Desktop=false;
      synth2Desktop=false;
    }
      if (trackPlay[8].mouseReleased()) {
        isTrackPlaying[8]=!isTrackPlaying[8];
      }
      volume[8].mouseReleased();
      beats[8].mouseReleased();
      for (int i=0; i<notes1.length; i++) {
        if (s1notes[i].get()<0) {
          notes1[i]=0;
        } else{
        if (octave1.get()>=0) {
          notes1[i]=(13-s1notes[i].get()+12*(octave1.get()+1));//(int) Math.floor(seq1.get(i)/256*12+12*(octave1.get()+1));
        } else {
          notes1[i]=(13-s1notes[i].get());
        }
        
      }
    }
      for (int i=0; i<numBeats; i++) {
      s1notes[i].mouseReleased();
    }
    if (octave1.mouseReleased()) {
      println(octave1.get());
    }
    
  } else if (synth2Desktop) {
    if (backToDesktop.mouseReleased()) {
      seqDesktop=true;
      synth1Desktop=false;
      synth2Desktop=false;
    }
      if (trackPlay[9].mouseReleased()) {
        isTrackPlaying[9]=!isTrackPlaying[9];
      }
      volume[9].mouseReleased();
      beats[9].mouseReleased();
      for (int i=0; i<notes2.length; i++) { 
        if (s2notes[i].get()<0) {
          notes2[i]=0;
        } else{
        if (octave2.get()>=0) {
        //notes2[i]=(int) Math.floor(seq2.get(i)/256*12+12*(octave2.get()+1));
          notes2[i]=(13-s2notes[i].get()+12*(octave2.get()+1));
        } else {
          //notes2[i]=(int) Math.floor(seq2.get(i)/256*12);
          notes2[i]=(13-s2notes[i].get());
        }
        }
      
    }
    for (int i=0; i<numBeats; i++) {
      s2notes[i].mouseReleased();
    }
    octave2.mouseReleased();
  }
}

void keyPressed() 
{
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

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
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



