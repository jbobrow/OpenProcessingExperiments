
//PDALSelfPortrait5.pde
//this sketch uses the RiTa Libray
//http://www.rednoise.org/rita/
import rita.*;
import ddf.minim.*;

Minim minim;
AudioSample hEdge;
AudioSample mEdge;
AudioSample sEdge;
AudioSample mMouse;

RiSpeech speech;

PFont hFont;
PFont mFont;
PFont sFont;

Word[]hcs=new Word[12];
Word[]mcs=new Word[60];
Word[]scs=new Word[60];

String[] hWords = { "learn","fail","near","grief" };
String[] mWords = { "long","leaf","fire","fog" };
String[] sWords = { "fear","go","fill","ring" };

int totalHours = 0;
int totalMinutes = 0;
int totalSeconds = 0;
 
void setup(){
  size(800,400);
  background(255);
  frameRate(100);
  smooth();
  noStroke();
  //hours field
  fill(210,210,210);
  rect(0,0,400,400);
  //minutes field
  fill(220,220,220);
  rect(400,0,250,400);
  //seconds field
  fill(230,230,230);
  rect(650,0,150,400);
  //speech
  speech = new RiSpeech(this);
  speech.useMacTTS();
  speech.setVoice("Vicki");
  //sound
  minim = new Minim(this);
  hEdge = minim.loadSample("hEdge.mp3");
  mEdge = minim.loadSample("mEdge.mp3");
  sEdge = minim.loadSample("sEdge.mp3");
  mMouse = minim.loadSample("mMouse.mp3");
  //timers
  RiTa.setCallbackTimer(this,"hours",3600.0f);
  RiTa.setCallbackTimer(this,"minutes",60.0f);
  RiTa.setCallbackTimer(this,"seconds",1.0f);
  //font
  hFont = loadFont("ArialMT-30.vlw"); 
  mFont = loadFont("ArialMT-20.vlw"); 
  sFont = loadFont("ArialMT-10.vlw");
}

//make letters
void onRiTaEvent(RiTaEvent re){
  if(re.getTag().equals("hours")){
    //println("hour");
    String wText = hWords[totalHours % 4];
    hcs[totalHours % 12] = new Word(10,390,20,400,20+random(180),200+random(-100,100),random(-1.5,1.5),hEdge,hFont,40,88,95,170,wText);
    totalHours++;
    if(totalHours>12) {
      totalHours=0;
    }
  }
  else if(re.getTag().equals("minutes")){
    //println("minute");
    String wText = mWords[totalMinutes % 4];
    mcs[totalMinutes % 60] = new Word(410,620,20,400,420+random(80),200+random(-100,100),random(-2,2),mEdge,mFont,30,0,175,160,wText);
    totalMinutes++;
    if(totalMinutes>60){
      totalMinutes=0;
    }
    speech.speak("Another minute of your life has passed.");
  }
  else if(re.getTag().equals("seconds")){
    //println("second");
    //println("totalSeconds: " + totalSeconds);
    String wText = sWords[totalSeconds % 4];
    scs[totalSeconds % 60] = new Word(660,780,20,400,660+random(40),200+random(-100,100),random(-2.5,2.5),sEdge,sFont,20,0,107,167,wText);
    totalSeconds++;
    //println("totalSeconds: " + totalSeconds);
    if(totalSeconds>60){
      totalSeconds=0;
    }
  }
}

void draw() {
  noStroke();
   //hours
  //fill(200,200,200);
  fill(148,197,234);
  rect(0,0,400,400);
  //minutes
  //fill(220,220,220);
  fill(157,220,249);
  rect(400,0,250,400);
  //seconds
  //fill(240,240,240);
  fill(199,223,244);
  rect(650,0,150,400);
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
  rect(0,0,800,400);
}//draw 

class Word {
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
  String wText; 
  
  Word(int left, int right, int top, int bottom, float x, float y, float speed, AudioSample snd, PFont font, int fontSize, int r, int g, int b, String wText){
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
    this.wText = wText; 
    }
     
    void move() { 
      x += speed/3;
      y += speed/2;
      
      if(x<=left || x>=right){
        speed *= -1;
        snd.trigger();
      }
      
      if(y<=top || y>=bottom) {
        speed *= -1;
        snd.trigger();
      }
      
      if(mouseX>left&&mouseX<right&&mouseY>top&&mouseY<bottom) {
        //println("in field");
        float distX = x-mouseX;
        float distY = y-mouseY;
        float distW = sqrt(distX*distX+distY*distY);
        //println(distW);
        if(distY<0 && distW<20) {
          //println("too close");
          //x=mouseX+20*distX/distW;
          y=abs(mouseY+30*distY/distW);
          mMouse.trigger();
        }
      }
      
    } //move
    
    void display() {
      fill(r,g,b);
      textFont(font, fontSize); 
      text(wText,x,y);
    } //display
    
    void stop(){
      snd.close();
      minim.stop();
      //super.stop();
    }
}//Word


