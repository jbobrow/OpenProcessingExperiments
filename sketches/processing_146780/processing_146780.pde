

boolean flipFlop = false;
int diam;
 
int word;
int open;
float randNum;
float randNum2;
float randNum3;
float randNum4;
float randNum5;

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer Rave;
FFT         fft;

AudioSample kick;
AudioSample snare;


void setup (){
size(300,300); 

minim = new Minim(this);
kick = minim.loadSample( "BD.mp3", 512);
if ( kick == null ) println("Didn't get kick!");
snare = minim.loadSample("SD.wav", 512);
  if ( snare == null ) println("Didn't get snare!");


 Rave = minim.loadFile("rave music.mp3", 1024);
  Rave.loop();
  fft = new FFT( Rave.bufferSize(), Rave.sampleRate() );
}
void draw(){
  
   for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
    line(x1, 50 - kick.mix.get(i)*50, x2, 50 - kick.mix.get(i+1)*50);
    line(x1, 150 - snare.mix.get(i)*50, x2, 150 - snare.mix.get(i+1)*50);
  }
  randNum = random(0,250);
  randNum2 = random(60,-30);
  randNum2 = random(20, -100);
  randNum3 = random(0,250); 
   randNum4 = random(0,250);
   randNum5 = random(0,250);
  

  background(0,0,0);
  
  if(flipFlop == false){
    diam = 40;
 

    word = 120;
    open = 5;
  }else{
    diam = 90;
 
    word = 80;
    open = 30;
  }
  
translate(150,150);
noStroke();
ellipse(-100,5,diam,diam);
ellipse(-100,5,diam,diam);
ellipse(randNum2,randNum2,diam,diam);
ellipse(100,5,diam,diam);
 
fill(randNum,randNum3, randNum4);
ellipse(0,0,200,200);
fill(255,255,255);
fill(0,0,0);
fill(255,255,255);
fill(0);
fill(randNum5);
rect(-25,50, 55,open);
  rect(-25, 50, 5, 20);
  rect(25, 50, 5, 20);
  rect(12.5, 50, 5, 20);
  rect(-12.5, 50, 5, 20);
  rect(1, 50, 5, 20);
 

 


 

 
 
 
 
 ellipse(-45,5,20,20);
  ellipse(45,5,20,20);

int value = 0;

}

void keyPressed() {
  flipFlop =! flipFlop; 
   if ( key == 's' ) snare.trigger();
  if ( key == 'k' ) kick.trigger();


  
}



