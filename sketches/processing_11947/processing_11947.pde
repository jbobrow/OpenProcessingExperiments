
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
SquareWave squareA, squareB, squareC, squareD, squareE, squareF, squareG;
LowPassSP lowpass;

void setup(){
  size (700,400,P3D);
  noStroke();
  background(0);
  noLoop();
  fill(0,0,255);
  frameRate(60);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
 
  lowpass = new LowPassSP(200, 44100);

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
    // Draws the whole sketch back little in prespective and begins
    // to play the sounds, each sound block will appear to come closer
    // as it plays.
    background(0);
    translate(0,0,-100);
    disable();
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    play(count);
  } 
  count += 2;
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}


void mousePressed(){
  state = "setup";
  if (pos.equals("done")){//So that it know when the mouse is pressed during the
    background(0);        //play section of draw. 
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
  noLoop();
}

void keyPressed(){
  if (key == ENTER){
    pos = "done";
    state = "play";
    count = 0;
    loop();
  }
  if (key == 'm'){//You can mute it if the sound gets too much.
    if (out.isMuted()){
      out.unmute();
    }
    else{
      out.mute();
    }
  }
}

void drawRect(int x, int y){
  fill(y/1.5,0,255);
  rect(x,(height)-(inc*y/inc),90,inc-4);
}

void eraseRect(int x, int y){
  fill(0);
  rect(x,(height-10)-(inc*y/inc),90,inc-4);
}

void drawSketch(int x, int y){
  int col = 0;
  for (int i = 0; i <= y/inc; i++){
    fill(col/1.,0,255);
    rect(x,(height)-(inc*col/inc),90,inc-4);
    col += inc;
  }
  col = 0;
}
    
// The play method plays each synthesised sound from left to right in sync with
// the framre rate, also adds the little bit of 3d prespective to the sound
// blocks.
void play(int x){
  if (count < 60){
    background(0);
    pushMatrix();
    translate(0,0,50);
    drawSketch(5,a);
    popMatrix();
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    out.addSignal(squareA);
  }
  else if (count >=60 && count < 120){
    background(0);
    drawSketch(5,a);
    pushMatrix();
    translate(0,0,50);
    drawSketch(105,b);
    popMatrix();
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    out.disableSignal(squareA);
    out.addSignal(squareB);
  }
  else if (count >=120 && count < 180){
    background(0);
    drawSketch(5,a);
    drawSketch(105,b);
    pushMatrix();
    translate(0,0,50);
    drawSketch(205,c);
    popMatrix();
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    out.disableSignal(squareB);
    out.addSignal(squareC);
  }
  else if (count >=180 && count < 240){
    background(0);
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    pushMatrix();
    translate(0,0,50);
    drawSketch(305,d);
    popMatrix();
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    out.disableSignal(squareC);
    out.addSignal(squareD);
  }
  else if (count >=240 && count < 300){
    background(0);
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    pushMatrix();
    translate(0,0,50);
    drawSketch(405,e);
    popMatrix();
    drawSketch(505,f);
    drawSketch(605,g);
    out.disableSignal(squareD);
    out.addSignal(squareE);
  }
  else if (count >=300 && count < 360){
    background(0);
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    pushMatrix();
    translate(0,0,50);
    drawSketch(505,f);
    popMatrix();
    drawSketch(605,g);
    out.disableSignal(squareE);
    out.addSignal(squareF);
  }
  else if (count >=360 && count < 420){
    background(0);
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    pushMatrix();
    translate(0,0,50);
    drawSketch(605,g);
    popMatrix();
    out.disableSignal(squareE);
    out.addSignal(squareF);
    out.disableSignal(squareF);
    out.addSignal(squareG);
  }
  else if (count >=420){
    background(0);
    drawSketch(5,a);
    drawSketch(105,b);
    drawSketch(205,c);
    drawSketch(305,d);
    drawSketch(405,e);
    drawSketch(505,f);
    drawSketch(605,g);
    out.disableSignal(squareG);
    count = 0;
  }
}

void disable(){
  out.disableSignal(squareA);
  out.disableSignal(squareB);
  out.disableSignal(squareC);
  out.disableSignal(squareD);
  out.disableSignal(squareE);
  out.disableSignal(squareF);
  out.disableSignal(squareG);
}

// Addit method allows the user to increase the level of the sound towers
// As the towers increase in size the frequency of the sound increases.
void addit(){
  if (mouseX >=0 && mouseX <= 100 && a <= 400){
    out.disableSignal(squareA);
    a += inc;
    drawRect(5,a);
    squareA = new SquareWave(a, 1, 44100);
    out.addSignal(squareA);
  }
  if (mouseX >100 && mouseX <= 200 && b <= 400){
    out.disableSignal(squareB);
    b += inc;
    drawRect(105,b);
    squareB = new SquareWave(a+100, 1, 44100);
    out.addSignal(squareB);
  }
  if (mouseX >200 && mouseX <= 300 && c <= 400){
    out.disableSignal(squareC);
    c += inc;
    drawRect(205,c);
    squareC = new SquareWave(a+200, 1, 44100);
    out.addSignal(squareC);
  }
  if (mouseX >300 && mouseX <= 400 && d <= 400){
    out.disableSignal(squareD);
    d += inc;
    drawRect(305,d);
    squareD = new SquareWave(a+300, 1, 44100);
    out.addSignal(squareD);
  }
  if (mouseX >400 && mouseX <= 500 && e <= 400){
    out.disableSignal(squareE);
    e += inc;
    drawRect(405,e);
    squareE = new SquareWave(a+400, 1, 44100);
    out.addSignal(squareE);
  }
  if (mouseX >500 && mouseX <= 600 && f <= 400){
    out.disableSignal(squareF);
    f += inc;
    drawRect(505,f);
    squareF = new SquareWave(a+500, 1, 44100);
    out.addSignal(squareF);
  }
  if (mouseX >600 && mouseX <= 700 && g <= 400){
    out.disableSignal(squareG);
    g += inc;
    drawRect(605,g);
    squareG = new SquareWave(a+600, 1, 44100);
    out.addSignal(squareG);
  }
}

//Subtract method does the opposite of Addit, it allows the user to decrease the
//size of the tower therefore decreaseing the frequency of the sound.
void subtract(){
  if (mouseX >=0 && mouseX <= 100 && a > 0){
    out.disableSignal(squareA);
    a -= inc;
    eraseRect(5,a);
    squareA = new SquareWave(a, 1, 44100);
    out.addSignal(squareA);
  }
  if (mouseX >100 && mouseX <= 200 && b > 0){
    out.disableSignal(squareB);
    b -= inc;
    eraseRect(105,b);
    squareB = new SquareWave(a+100, 1, 44100);
    out.addSignal(squareB);
  }
  if (mouseX >200 && mouseX <= 300 && c > 0){
    out.disableSignal(squareC);
    c -= inc;
    eraseRect(205,c);
    squareC = new SquareWave(a+200, 1, 44100);
    out.addSignal(squareC);
  }
  if (mouseX >300 && mouseX <= 400 && d > 0){
    out.disableSignal(squareD);
    d -= inc;
    eraseRect(305,d);
    squareD = new SquareWave(a+300, 1, 44100);
    out.addSignal(squareD);
  }
  if (mouseX >400 && mouseX <= 500 && e > 0){
    out.disableSignal(squareE);
    e -= inc;
    eraseRect(405,e);
    squareE = new SquareWave(a+400, 1, 44100);
    out.addSignal(squareE);
  }
  if (mouseX >500 && mouseX <= 600 && f > 0){
    out.disableSignal(squareF);
    f -= inc;
    eraseRect(505,f);
    squareF = new SquareWave(a+500, 1, 44100);
    out.addSignal(squareF);
  }
  if (mouseX >600 && mouseX <= 700 && g > 0){
    out.disableSignal(squareG);
    g -= inc;
    eraseRect(605,g);
    squareG = new SquareWave(a+600, 1, 44100);
    out.addSignal(squareG);
  }
}



