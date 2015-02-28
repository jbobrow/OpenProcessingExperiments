
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
Synthesizer synth;
int firstPianoKey = 40;
int numberOfWhiteKeys = 15;
SequenceMaker editor;
boolean draggingSequence = false;
Sequence draggedSequence;
TwelveBar twelveBar;
void setup(){
  size(400,300);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  editor = new SequenceMaker(
    new PVector(width/2,height*2/3-8));
  synth = new Synthesizer(editor.beingMade);
  out.addSignal(synth);
  imageMode(CENTER);
  twelveBar = new TwelveBar();
}
void draw(){
  background(0);
  editor.draw();
  twelveBar.draw();
  if(draggingSequence){
    draggedSequence.draw();
  }
}
class Synthesizer implements AudioSignal{
  float amplitude = 0.33;
  float timeConst = 0.05;//s
  float[] frequency;//Hz
  int[] counter;
  int timer = 0;
  int samplesPerBeat;
  Sequence sequence;
  Synthesizer(Sequence seq){
    timeConst *= out.sampleRate();
    frequency = new float[numberOfWhiteKeys];
    counter = new int[frequency.length];
    int[] notes = {0,2,4,5,7,9,11};
    for(int i=0;i<frequency.length;i++){
      float n = firstPianoKey+12*(i/7)+notes[i%7];
      frequency[i] = 440f*pow(2f,(n-49f)/12f);
      frequency[i] /= out.sampleRate();
      counter[i] = round(timeConst*4);
    }
    samplesPerBeat = round(out.sampleRate())/12;
    sequence = seq;
  }
  float getSample(){
    float amp = 0;
    for(int i=0;i<frequency.length;i++){
      if(timer%samplesPerBeat==0){
        if(sequence.value[timer/samplesPerBeat][i]){
          counter[i] = 0;
        }
      }
      amp += amplitude*exp(-counter[i]/timeConst)
        *sin(TWO_PI*counter[i]*frequency[i]);
      counter[i]++;
    }
    timer++;
    if(timer==sequence.length*samplesPerBeat){
      timer=0;
      sequence = sequence.nextSequence;
    }
    return amp;
  }
  void generate(float[] samp){
    for(int i=0;i<samp.length;i++){
      samp[i] = getSample();
    }
  }
  void generate(float[] right,float[] left){
    for(int i=0;i<right.length;i++){
      float amp = getSample();
      right[i] = amp;
      left[i] = amp;
    }
  }
}
class Sequence{
  int length = 12;
  boolean[][] value;
  Sequence nextSequence;
  PImage thumbnail;
  PVector location;
  Sequence(PVector loc){
    value = new boolean[length][numberOfWhiteKeys];
    value[0][7] = true;
    value[6][11] = true;
    nextSequence = this;
    location = loc;
    getThumbnail();
  }
  void makeRandom(){
    for(int i=0;i<length;i++){
      for(int j=0;j<numberOfWhiteKeys;j++){
        if(random(0,1)>0.9){value[i][j]=true;
        }else{value[i][j]=false;}
      }
    }
    synth.sequence = this;
    getThumbnail();
  }
  void clear(){
    for(int i=0;i<length;i++){
      for(int j=0;j<numberOfWhiteKeys;j++){
        value[i][j]=false;
      }
    }
    synth.sequence = this;
    getThumbnail();
  }
  void getThumbnail(){
    thumbnail = createImage(length,numberOfWhiteKeys,ARGB);
    for(int i=0;i<thumbnail.width;i++){
      for(int j=0;j<thumbnail.height;j++){
        thumbnail.set(i,j,color(#000000,0));
        if(value[i][j]){
          thumbnail.set(i,j,color(#FFFFFF,255));
        }
      }
    }
    int scaleFactor = 2;
    thumbnail.resize(
      thumbnail.width*scaleFactor,
      thumbnail.height*scaleFactor);
  }
  Sequence get(){
    Sequence duplicate = new Sequence(new PVector(0,0));
    for(int i=0;i<length;i++){
      for(int j=0;j<numberOfWhiteKeys;j++){
        duplicate.value[i][j] = value[i][j];
      }
    }
    duplicate.getThumbnail();
    return duplicate;
  }
  void dropInto(Sequence target){
    for(int i=0;i<length;i++){
      for(int j=0;j<numberOfWhiteKeys;j++){
        target.value[i][j] = value[i][j];
      }
    }
    target.getThumbnail();
    synth.sequence = target;
    synth.timer = 0;
  }
  void draw(){
    image(thumbnail,location.x,location.y);
    noFill();
    stroke(255);
    strokeWeight(1);
    noSmooth();
    rectMode(CENTER);
    rect(location.x,location.y,
      thumbnail.width+3,thumbnail.height+3);
  }
  boolean mouseIsInside(PVector mouse){
    boolean val = false;
    if(PVector.sub(location,mouse).mag()<thumbnail.width/2){
      val = true;
    }
    return val;
  }
}
class SequenceMaker{
  Sequence beingMade;
  button[] buttons;
  float buttonSpacing = 13;
  float SeqWidth;
  float SeqHeight;
  SequenceMaker(PVector center){
    beingMade = new Sequence(new PVector(center.x,
      center.y-115));
    buttons = new button[beingMade.length*numberOfWhiteKeys];
    for(int i=0;i<beingMade.length;i++){
      for(int j=0;j<numberOfWhiteKeys;j++){
        buttons[i*numberOfWhiteKeys+j]
           = new button(new PVector(
          center.x+(i+0.5-beingMade.length/2f)*buttonSpacing,
          center.y+(j+0.5-numberOfWhiteKeys/2f)*buttonSpacing),
          i,j);
      }
    }
    SeqWidth = (beingMade.length+1)*buttonSpacing;
    SeqHeight = (numberOfWhiteKeys+1)*buttonSpacing;
  }
  void draw(){
    stroke(128);
    smooth();
    strokeWeight(1.5);
    ellipseMode(CENTER);
    for(int i=0;i<buttons.length;i++){
      buttons[i].draw();
    }
    beingMade.draw();
  }
  private class button{
    PVector location;
    int time;
    int whiteKey;
    float diam = 12;
    button(PVector loc,int t,int k){
      location = loc;
      time = t;
      whiteKey = k;
    }
    boolean value(){
      return beingMade.value[time][whiteKey];
    }
    void draw(){
      if(value()){fill(255);
      }else{fill(0);}
      ellipse(location.x,location.y,diam,diam);
    }
    void testPress(PVector mouse){
      if(PVector.sub(location,mouse).mag()<diam/2){
        if(value()){
          beingMade.value[time][whiteKey]=false;
        }else{
          beingMade.value[time][whiteKey]=true;
          synth.sequence = beingMade;
        }
      }
    }
  }
}
class TwelveBar{
  Sequence[] sequences;
  TwelveBar(){
    sequences = new Sequence[12];
    for(int i=0;i<sequences.length;i++){
      sequences[i] = new Sequence(new PVector(
        24+32*i,26));
    }
    linkSequences();
  }
  void linkSequences(){
    for(int i=0;i<sequences.length-1;i++){
      sequences[i].nextSequence = sequences[i+1];
    }
    sequences[sequences.length-1].nextSequence
      = sequences[0];
  }
  void draw(){
    for(int i=0;i<sequences.length;i++){
      sequences[i].draw();
    }
  }
}
void mousePressed(){
  PVector mouse = new PVector(mouseX,mouseY);
  for(int i=0;i<editor.buttons.length;i++){
    editor.buttons[i].testPress(mouse);
  }
  editor.beingMade.getThumbnail();
  if(editor.beingMade.mouseIsInside(mouse)){
    draggingSequence = true;
    draggedSequence = editor.beingMade.get();
    draggedSequence.location = mouse;
  }
  for(int i=0;i<twelveBar.sequences.length;i++){
    if(twelveBar.sequences[i].mouseIsInside(mouse)){
      draggingSequence = true;
      draggedSequence = twelveBar.sequences[i].get();
      draggedSequence.location = mouse;
    }
  }
}
void mouseDragged(){
  if(draggingSequence){
    PVector mouse = new PVector(mouseX,mouseY);
    draggedSequence.location = mouse;
  }
}
void mouseReleased(){
  PVector mouse = new PVector(mouseX,mouseY);
  if(editor.beingMade.mouseIsInside(mouse)){
    draggedSequence.dropInto(editor.beingMade);
  }
  for(int i=0;i<twelveBar.sequences.length;i++){
    if(twelveBar.sequences[i].mouseIsInside(mouse)){
      draggedSequence.dropInto(twelveBar.sequences[i]);
    }
  }
  draggingSequence = false;
}
void keyPressed(){
  if(key==' '){
    editor.beingMade.clear();
  }
  if(key=='r'){
    editor.beingMade.makeRandom();
  }
}

