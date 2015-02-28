
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
BeatGenerator[] beats;
button[] clock;
void setup(){
  size(300,200);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO,2048);
  beats = new BeatGenerator[3];
  beats[0] = new BeatGenerator(out.sampleRate(),220);
  beats[1] = new BeatGenerator(out.sampleRate(),220f*3/2);
  beats[2] = new BeatGenerator(out.sampleRate(),440);
  beats[2].amplitude = 0.1;
  for(int i=0;i<3;i++){
    out.addSignal(beats[i]);
  }
  stroke(255);
  clock = new button[12*3];
  for(int i=0;i<12;i++){
    for(int j=0;j<3;j++){
      float angle = TWO_PI*i/12;
      float radius = 33 + 16*j;
      clock[j*12+i] = new button(new PVector(
        width/2+radius*cos(angle),
        height/2+radius*sin(angle)),
        i*round(out.sampleRate())/12);
      beats[j].buttons = (button[]) append(
        beats[j].buttons,clock[j*12+i]);
    }
  }
  beats[0].buttons[9].value = true;
  beats[1].buttons[1].value = true;
  beats[2].buttons[5].value = true;
}
void draw(){
  background(0);
  for(int i=0;i<12*3;i++){
    clock[i].draw();
  }
}
void stop(){
  out.close();
  minim.stop();
  super.stop();
}
class BeatGenerator implements AudioSignal{
  float amplitude = 0.33;
  float frequency = 220;//Hz
  float timeConst = 0.05;//s
  int timer = 0;
  int sampleRate;
  int counter;
  button[] buttons;
  BeatGenerator(float sr,float freq){
    sampleRate = round(sr);
    frequency = freq;
    frequency /= sampleRate;
    timeConst *= sampleRate;
    counter = round(timeConst*4);
    buttons = new button[0];
  }
  void generate(float[] samp){
    for(int i=0;i<samp.length;i++){
      samp[i] = getAmplitude();
    }
  }
  void generate(float[] left,float[] right){
    float amp;
    for(int i=0;i<left.length;i++){
      amp = getAmplitude();
      left[i] = amp;
      right[i] = amp;
    }
  }
  float getAmplitude(){
    float amp = amplitude*exp(-counter/timeConst)
      *sin(TWO_PI*counter*frequency);
    counter++;
    timer++;
    if(timer==sampleRate){timer=0;}
    for(int i=0;i<buttons.length;i++){
      if(buttons[i].value&&timer==buttons[i].time){
        counter=0;
      }
    }
    return amp;
  }
}
class button{
  boolean value = false;
  PVector location;
  int time;
  float diam = 16;
  button(PVector loc,int t){
    location = loc;
    time = t;
  }
  void draw(){
    ellipseMode(CENTER);
    stroke(255);
    smooth();
    strokeWeight(2);
    noFill();
    if(value){fill(128);}
    ellipse(location.x,location.y,diam,diam);
  }
  void clickTest(){
    PVector mouse = new PVector(mouseX,mouseY);
    if(PVector.sub(location,mouse).mag()<diam/2){
      if(value){value=false;
      }else{value=true;}
    }
  }
}
void mousePressed(){
  for(int i=0;i<12*3;i++){
    clock[i].clickTest();
  }
}

