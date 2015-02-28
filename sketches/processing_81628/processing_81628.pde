
import ddf.minim.*;
/*import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
*/
Minim minim;
AudioPlayer hi;
AudioPlayer pussy;
AudioPlayer wake;
AudioPlayer great;
AudioPlayer rightnow;
AudioPlayer buenavista;

PFont font;

boolean ring = false;
boolean setala = false;
boolean gotup = false;
boolean mins= false;
boolean nottod=false;
boolean ok= false;

int ah, am, as=0;
PImage greatsucess;
PImage clockback;
PImage got;
PImage minus;
PImage setal;
PImage okok;
PImage not;

int num=0;
//######################################################################################
void setup() {

  size(600, 400);
  background(0);
  imageMode(CENTER);
  
  clockback=loadImage("clockback.png");
  got = loadImage("got.png");
  okok = loadImage("ok.png");
  not = loadImage("not.png");
  minus = loadImage("5.png");
  setal = loadImage("set.png");
  greatsucess = loadImage("greatsucess.png");
  font = loadFont("LCD-48.vlw");
  textFont(font, 50);

  minim = new Minim(this);
  hi = minim.loadFile("hi big sexy.mp3");

  minim = new Minim(this);
  pussy = minim.loadFile("such a pussy.mp3");

  minim = new Minim(this);
  wake = minim.loadFile("wake.mp3");
  
   minim = new Minim(this);
  rightnow = minim.loadFile("rightnow.mp3");
  
  minim = new Minim(this);
  great = minim.loadFile("great.mp3");
  
  minim = new Minim(this);
  buenavista = minim.loadFile("buenavista.mp3");

  frameRate(10);
}
//######################################################################################
void draw() {


  switch(num) {
  case 1:
    setalarm(); 
    break;
  case 2:
    waky(); 
    break;
  case 3:
    step1(); 
    break;
  case 4:
    getup(); 
    break;
  case 5:
    step2(); 
    break;
  case 6:
    great(); 
    break;
  default:           
    clock();
    break;
  }
}
//######################################################################################
public void setalarm()
{
  background(0);
  fill(255);
  rect(210, 200, 30, 20);
  rect(210, 140, 30, 20);
  rect(260, 140, 30, 20);
  rect(260, 200, 30, 20);
   image(setal, (width/2), (300));
  text(ah+":"+am, 210, 200);
  
  if (mousePressed==true) {
    if (mouseX >=(210) && mouseX <=(240)) {
      if (mouseY >=(140) && mouseY <=(160)) {
        ah++;
        if (ah>23) {
          ah=0;
        }
      }
    }
    if (mouseX >=(210) && mouseX <=(240)) {
      if (mouseY >=(200) && mouseY <=(220)) {
        ah--;
        if (ah<0) {
          ah=23;
        }
      }
    }
    if (mouseX >=(260) && mouseX <=(290)) {
      if (mouseY >=(140) && mouseY <=(160)) {
        am++;
        if (am>59) {
          am=0;
          ah++;
        }
      }
    }
    if (mouseX >=(260) && mouseX <=(290)) {
      if (mouseY >=(200) && mouseY <=(220)) {
        am--;
        if (am<0) {
          am=59;
          ah--;
        }
      }
    }
      if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(275) && mouseY <=(325)) {
        num=0; //clock
      }}
  }
}
//######################################################################################
void waky()
{
  image(clockback, (width/2), (height/2));
  image(got, (width/2), (225));
  image(minus, (width/2), (325));
  hi.play();
  if (mousePressed==true) {
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(200) && mouseY <=(250)) {
        num=6; //gotup > great
      }
    }
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(300) && mouseY <=(350)) {
        num=3; // mins > step1
      }
    }
  }
}
//######################################################################################
void step1()
{
  wake.play();
  image(clockback, (width/2), (height/2));
  image(got, (width/2), (225));
  image(not, (width/2), (325));
  if (mousePressed==true) {
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(200) && mouseY <=(250)) {
        num=6; //gotup > great
      }
    }
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(300) && mouseY <=(350)) {
        num=5; //nottod > step2
      }
    }
  }
}
//######################################################################################

void step2()
{
  pussy.play();
  image(clockback, (width/2), (height/2));
  image(okok, (width/2), (300));
  if (mousePressed==true) {
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(275) && mouseY <=(325)) {
        num=4; //ok > getup
      }
    }
  }
}

//######################################################################################
void getup()
{
  rightnow.play();
  image(clockback, (width/2), (height/2));
  image(got, (width/2), (300));
  if (mousePressed==true) {
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(275) && mouseY <=(325)) {
        num=6;// got up > great
      }
    }
  }
}
//######################################################################################

void great()
{
  image(greatsucess, (width/2), (height/2));
  great.play();
  buenavista.play();
}
//######################################################################################
void clock()
{
  image(clockback, (width/2), (height/2));
  image(setal, (width/2), (300));
  int s = second();
  int m = minute();
  int h = hour();
  int cx = 210;
  int cy = 200;
  if (m<10)
  {
    text(h+":"+"0"+m+":"+s, cx, cy);
  }
  else if (s<10)
  {
    text(h+":"+m+":"+"0"+s, cx, cy);
  }
  else
  {
    text(h+":"+m+":"+s, cx, cy);
  }
  if (ah==h && am==m)
  {
    num=2;//ring > waky
  }
  if (mousePressed==true) {
    if (mouseX >=(150) && mouseX <=(450)) {
      if (mouseY >=(275) && mouseY <=(325)) {
        num=1;//set alarm
      }
    }
  }
}


