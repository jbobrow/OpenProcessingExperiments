
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
BeatDetect beat;
PFont f;
//tre contatori per i tre rispettivi beat
int kick; int snare; int hat;
int d = 10; 
//due filtri alto/basso
LowPassSP lowpass;
HighPassSP highpass;
//due controlli per permettere la mutua esclusione
boolean lowAttivo,highAttivo;
//variabili per le frequenze del filtri
float lowFreq, highFreq;
//var boleana per il volume
boolean gainAttivo;

void setup(){
  size(550,400,P2D);
  colorMode(HSB,100);
  f=loadFont("CooperBlack.vlw");
  minim = new Minim(this);
  song = minim.loadFile("Avril Lavigne - What The Hell [2010-Single][MJN].mp3", 1024);
  song.loop();  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(2); 
  //FFT
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(54,3);
  //filtri passabasso - passaalto
  highpass = new HighPassSP(15000, 44100);
  lowpass = new LowPassSP(20, 44100);
}

void draw(){
  background(0,0,100);
  noStroke();
  beat.detect(song.mix);
  kick=0; snare=0; hat=0;//inizializzo i contatori
  disegna_Anim();
  fill(0,100,100);
  textFont(f,48);
  text("W H A T   T H E     ",15,50);  
  rect(0,350,width,25);
  textFont(f,14);
  fill(0,0,100);
  
  //prima riga di comandi
  fill(0,0,100);
  text("(L)owpass",15,365);
  text("(N)one",240,365);
  text("(H)ighpass",450,365);
  if (lowAttivo){ 
      ellipse(10,360,10,10);
      lowFreq = map(mouseX,0,width,5000,15000); //considero solo le freq inferiori a lowFreq
      lowpass.setFreq(lowFreq);
      song.addEffect(lowpass); 
  }else if (highAttivo){ 
      ellipse(445,360,10,10);
      highFreq = map(mouseX,0,width,100,1000);//considero solo le freq superiori a highFreq
      highpass.setFreq(highFreq);
      song.addEffect(highpass);
  }else {
      song.clearEffects();
      ellipse(235,360,10,10);  
  }   
  
  //seconda riga di comandi
  fill(0,100,100);
  text("(M)ute",15,390);
  text("(V)olume",240,390);
  text("(U)nmute",450,390);
  fill(0,100,100);
  if(song.isMuted()){
      ellipse(10,385,10,10);
    }else{
      ellipse(445,385,10,10);
    }
  if(gainAttivo){
      ellipse(235,385,10,10);
      song.setGain(map(mouseX,0,width-5,-60,6)); 
   }
}

  void stop(){
    song.close();
    minim.stop();
    super.stop();
  }

//Procedura di gestione input da tastiera
  void keyPressed(){
    if(key == 'L' || key == 'l' && !highAttivo){
        lowAttivo = (!lowAttivo);
    }
    if (key == 'H' || key == 'h' && !lowAttivo){
        highAttivo = (!highAttivo);
    }
    if (key == 'N' || key == 'n'){
        lowAttivo = false;
        highAttivo = false;
    }   
    if (key =='M' || key == 'm'){
        if(song.hasControl(Controller.MUTE)){
          song.mute();
          println(song.isMuted());
        }
    }
    if (key =='U' || key == 'u'){
        if(song.hasControl(Controller.MUTE)){
          song.unmute();
          println(song.isMuted());
        }
    }
    if (key =='v' || key == 'V'){
        if(song.hasControl(Controller.GAIN)){
          gainAttivo = !gainAttivo;
        }
    }
  }

//Procedura per la creazione dell'animazione
  public void disegna_Anim(){
    fft.forward(song.mix);  
    for (int i = 0; i < fft.avgSize(); i++){
        fill(map( i, 0, fft.avgSize(), 0, 100),100,100);
        //uso pushMatrix e popMatrix per limitare la proprietà cumulativa di translate()
        //LINEE VERTICALI DI:
        pushMatrix();
         translate(25,300);
         translate(0,-fft.getAvg(i));
         //- H
         ellipse(0,0,d,d);
         ellipse(125,0,d,d);
         //- E
         ellipse(175,0,d,d);
         //- L
         ellipse(315,0,d,d);
         ellipse(415,0,d,d);
        popMatrix();
       //LINEE ORIZZONTALI DI:
        pushMatrix();
          translate(200,100);
          translate(fft.getAvg(i)/2,0);
          //- E
          ellipse(0,0,d,d);
          ellipse(0,100,d,d);
          ellipse(0,200,d,d);
          //- L
          ellipse(140,200,d,d);
          ellipse(240,200,d,d);
          //- H
          translate(-175,0);
          ellipse(0,100,d,d);
        popMatrix();
        
        //puntini animati dai beat
         if(beat.isKick()){ kick++; }else{kick=0;}
         if(beat.isSnare()){ snare++; }else{snare=0;}
         if(beat.isHat()){ hat++; }else{hat=0;}
         
         fill(0,100,100);
         
         ellipse(475,45,(d+kick)/2,(d+kick)/2);
         ellipse(500,45,(d+snare)/2,(d+snare)/2);
         ellipse(525,45,(d+hat)/2,(d+hat)/2);
    }
    
    
   }
 

