
// Hello ! ///////////////////////////

//////////////////////////////////////
// by Jeremy Vey /////////////////////
// Graphic designer //////////////////
//////////////////////////////////////
// www (dot) jeremyvey (dot) net /////
//////////////////////////////////////
// hello (at) jeremyvey (dot) net ////
// +33 (0) 6 72 91 82 13 /////////////
// F — 31000 Toulouse ////////////////
//////////////////////////////////////

//////////////////////////////////////

import krister.Ess.*;

int bufferSize;

FFT myFFT;
AudioInput myInput;

float freq;
float vol;

int op;

PFont font;  

void setup () {

  font = loadFont("Helvetica-Bold-12.vlw");

  size(770,578);
  background(255);

  Ess.start(this);  

  smooth();

  bufferSize=8;
  myInput=new AudioInput(bufferSize);

  myFFT=new FFT(bufferSize*2);

  frameRate(30);         

  myInput.start();

}

//======================================
//======================================

void draw() {


  textFont(font); 
  fill(0);
  text("« On peut lire une image comme un texte. Les signes qui la composent appartiennent à plusieurs registres, allant de l'analogie à la trace. Mais sa simple présence visuelle soulève aussi une autre attente : celle de la vérité… »", 30, height-65, width-60, 120); 
  fill(0);
  text("Martine Joly", 615, height-20);

  op = 25;

  noStroke();
  fill(255,op);
  rect(0,0,width,height);


  vol = myFFT.getLevel(myInput)*150;

  translate(0,height-40);
  scale(2);

  if(vol>1){

    for(int i=0; i<bufferSize; i++){

      freq= myFFT.spectrum[i]*3000;

      float L = 1*(freq*2/vol);
      float H = (-(vol*(freq/10)+(freq*2/freq)))/height;
      float x = freq/2;
      float y = -(vol*20+(1/freq*50));

      noStroke();
      fill(L*3,0,0);
      rect(x, y-H, L, H-x);

      strokeWeight(0.5);
      stroke(L+50,0,0,70);
      line(-300,y+H,+3000,y+H);
    }
  }
}

public void audioInputData(AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}








