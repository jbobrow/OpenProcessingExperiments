
//PDALSelfPortrait.pde
//this sketch uses the RiTa Libray
//http://www.rednoise.org/rita/
import rita.*;
import ddf.minim.*;

Minim minim;
AudioSample hEdge;
AudioSample mEdge;
AudioSample sEdge;

RiSpeech speech;

PFont hFont;
PFont mFont;
PFont sFont;

Letter[] hcs = new Letter[24];
Letter[] mcs = new Letter[60];
Letter[] scs = new Letter[60];

int totalHours = 0;
int totalMinutes = 0;
int totalSeconds = 0;
 
void setup(){
  size(600,200);
  background(255);
  frameRate(30);
  smooth();
  noStroke();
  //hours field
  fill(210,210,210);
  rect(0,0,300,200);
  //minutes field
  fill(220,220,220);
  rect(300,0,200,200);
  //seconds field
  fill(230,230,230);
  rect(500,0,100,200);
  //speech
  speech = new RiSpeech(this);
  speech.useMacTTS();
  speech.setVoice("Vicki");
  //sound
  minim = new Minim(this);
  hEdge = minim.loadSample("hEdge.mp3");
  mEdge = minim.loadSample("mEdge.mp3");
  sEdge = minim.loadSample("sEdge.mp3");
  //timers
  RiTa.setCallbackTimer(this,"hours",3600.0f);
  RiTa.setCallbackTimer(this,"minutes",60.0f);
  RiTa.setCallbackTimer(this,"seconds",1.0f);
  //font
  hFont = loadFont("ArialMT-40.vlw"); 
  mFont = loadFont("ArialMT-30.vlw"); 
  sFont = loadFont("ArialMT-20.vlw");
}

//make letters
void onRiTaEvent(RiTaEvent re){
  if(re.getTag().equals("hours")){
    //println("hour");
    hcs[totalHours] = new Letter(15,285,15,175,20+random(250),15+random(175),random(-2,2),hEdge,hFont,40,88,95,170);
    totalHours++;
    if(totalHours>=24) {
      totalHours=0;
    }
  }
  else if(re.getTag().equals("minutes")){
    //println("minute");
    mcs[totalMinutes] = new Letter(310,490,10,175,310+random(170),10+random(170),random(-4,4),mEdge,mFont,30,0,175,160);
    totalMinutes++;
    if(totalMinutes>=60){
      totalMinutes=0;
    }
    speech.speak("Another minute of your life has passed.");
  }
  else if(re.getTag().equals("seconds")){
    //println("second");
    //println("totalSeconds: " + totalSeconds);
    scs[totalSeconds] = new Letter(505,590,10,170,505+random(90),10+random(195),random(-6,6),sEdge,sFont,20,197,53,67);
    totalSeconds++;
    //println("totalSeconds: " + totalSeconds);
    if(totalSeconds>=60){
      totalSeconds=0;
    }
  }
}

void draw() {
  noStroke();
   //hours
  fill(200,200,200);
  rect(0,0,300,200);
  //minutes
  fill(220,220,220);
  rect(300,0,200,200);
  //seconds
  fill(240,240,240);
  rect(500,0,100,200);
  //animate letters
  for(int i=0;i<totalHours;i++) {
    //println("hcs[i]: " + hcs[i]);
    hcs[i].move();
    hcs[i].display();
  }
  for(int i=0;i<totalMinutes;i++) {
    //println("mcs[i]: " + mcs[i]);
    mcs[i].move();
    mcs[i].display();
  }
  for(int i=0;i<totalSeconds;i++) {
    //println("scs[i]: " + scs[i]);
    scs[i].move();
    scs[i].display();
  }
  //border
  noFill();
  strokeWeight(4);
  stroke(255);
  rect(0,0,598,300);
}//draw 


class Letter {
  int left;
  int right;
  int top;
  int bottom;
  float x;
  float y;
  float speed;
  AudioSample snd;
  PFont font;
  int fontSize;
  int r;
  int g; 
  int b;
  
  Letter(int left, int right, int top, int bottom, float x, float y, float speed, AudioSample snd, PFont font, int fontSize, int r, int g, int b){
    this.left = left;
    this.right = right;
    this.top = top;
    this.bottom = bottom;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.snd = snd;
    this.font = font;
    this.fontSize = fontSize;
    this.r = r;
    this.g = g;
    this.b = b;
    }
    
    void move() {
      x += speed/3;
      y += speed/2;
      
      if(x<left || x>right){
        speed *= -1;
        snd.trigger();
      }
      
      if(y<top || y>bottom) {
        speed *= -1;
        snd.trigger();
      }
    } // move
    
    void display() {
      fill(r,g,b);
      textFont(font, fontSize); 
      text("A",x,y);
    } //display
    
    void stop(){
      snd.close();
      minim.stop();
      //super.stop();
    }

}//Letter

