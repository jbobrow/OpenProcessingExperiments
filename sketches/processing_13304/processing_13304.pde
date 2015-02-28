
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
String state = "setup";
String pos = "none";
int count = 0;
int a = 0;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int f = 0;
int g = 0;
int inc = 10;
 
Minim minim;
AudioOutput out;
SquareWave towerA, towerB, towerC, towerD, towerE, towerF, towerG;
LowPassSP lowpass;
 
void setup(){
  size (700,400,P3D);
  noStroke();
  background(160);
  noLoop();
  fill(0,0,255);
  frameRate(40);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  
  lowpass = new LowPassSP(200, 50000);
 
  out.addEffect(lowpass);
}
 
void draw(){
  if (state.equals("setup")){
    if (mouseButton == LEFT){
      addit();
    }
    else if (mouseButton == RIGHT){
      subtract();
    }
  }
  else if (state.equals("play")){
  
    background(102);
    translate(0,0,-100);
  }
}
 
void stop(){
  out.close();
  minim.stop();
  super.stop();
}
 
 
void mouseMoved(){
  state = "setup";
  if (pos.equals("done")){
    background(0);        
    translate(0,0,100);
    disable();
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    pos = "none";
  }
  loop();
   
}
 
void mouseReleased(){
  loop();
}
 
 
void drawRect(int x, int y){
  fill(x/1.50,200);
  rect(x,(height)-(inc*y/inc),90,inc-4);
}
 
void eraseRect(int x, int y){
  fill(160);
  rect(x,(height-10)-(inc*y/inc),90,inc-4);
}
 
void drawSketch(int x, int y){
  int col = 0;
  for (int i = 0; i <= y/inc; i++){
    fill(col/1.,0,16);
    rect(x,(height)-(inc*col/inc),90,inc-4);
    col += inc;
  }
  col = 0;
}
void addit(){
  if (mouseX >=0 && mouseX <= 100 && a <= 400){
    out.disableSignal(towerA);
    a += inc;
    drawRect(5,a);
    towerA = new SquareWave(a, 1, 44100);
    out.addSignal(towerA);
  }
  if (mouseX >100 && mouseX <= 200 && b <= 400){
    out.disableSignal(towerB);
    b += inc;
    drawRect(105,b);
    towerB = new SquareWave(a+100, 1, 44100);
    out.addSignal(towerB);
  }
  if (mouseX >200 && mouseX <= 300 && c <= 400){
    out.disableSignal(towerC);
    c += inc;
    drawRect(205,c);
    towerC = new SquareWave(a+200, 1, 44100);
    out.addSignal(towerC);
  }
  if (mouseX >300 && mouseX <= 400 && d <= 400){
    out.disableSignal(towerD);
    d += inc;
    drawRect(305,d);
    towerD = new SquareWave(a+300, 1, 44100);
    out.addSignal(towerD);
  }
  if (mouseX >400 && mouseX <= 500 && e <= 400){
    out.disableSignal(towerE);
    e += inc;
    drawRect(405,e);
    towerE = new SquareWave(a+400, 1, 44100);
    out.addSignal(towerE);
  }
  if (mouseX >500 && mouseX <= 600 && f <= 400){
    out.disableSignal(towerF);
    f += inc;
    drawRect(505,f);
    towerF = new SquareWave(a+500, 1, 44100);
    out.addSignal(towerF);
  }
  if (mouseX >600 && mouseX <= 700 && g <= 400){
    out.disableSignal(towerG);
    g += inc;
    drawRect(605,g);
    towerG = new SquareWave(a+600, 1, 44100);
    out.addSignal(towerG);
  }
}
void subtract(){
  if (mouseX >=0 && mouseX <= 100 && a > 0){
    out.disableSignal(towerA);
    a -= inc;
    eraseRect(5,a);
    towerA = new SquareWave(a, 1, 44100);
    out.addSignal(towerA);
  }
  if (mouseX >100 && mouseX <= 200 && b > 0){
    out.disableSignal(towerB);
    b -= inc;
    eraseRect(105,b);
    towerB = new SquareWave(a+100, 1, 44100);
    out.addSignal(towerB);
  }
  if (mouseX >200 && mouseX <= 300 && c > 0){
    out.disableSignal(towerC);
    c -= inc;
    eraseRect(205,c);
    towerC = new SquareWave(a+200, 1, 44100);
    out.addSignal(towerC);
  }
  if (mouseX >300 && mouseX <= 400 && d > 0){
    out.disableSignal(towerD);
    d -= inc;
    eraseRect(305,d);
    towerD = new SquareWave(a+300, 1, 44100);
    out.addSignal(towerD);
  }
  if (mouseX >400 && mouseX <= 500 && e > 0){
    out.disableSignal(towerE);
    e -= inc;
    eraseRect(405,e);
    towerE = new SquareWave(a+400, 1, 44100);
    out.addSignal(towerE);
  }
  if (mouseX >500 && mouseX <= 600 && f > 0){
    out.disableSignal(towerF);
    f -= inc;
    eraseRect(505,f);
    towerF = new SquareWave(a+500, 1, 44100);
    out.addSignal(towerF);
  }
  if (mouseX >600 && mouseX <= 700 && g > 0){
    out.disableSignal(towerG);
    g -= inc;
    eraseRect(605,g);
    towerG = new SquareWave(a+600, 1, 44100);
    out.addSignal(towerG);
  }
}

