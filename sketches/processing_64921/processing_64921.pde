
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


int filtro;
float band;

Minim minim;
AudioPlayer song;
FFT fft;

LowPassSP lowpass;
HighPassSP highpass;

 
 
void setup() {
  size(601, 621);
  smooth();
  textMode(SCREEN);
  frameRate(30);
  minim = new Minim(this);
  song = minim.loadFile("Dubstep Violin - Lindsey Stirling - Crystallize.mp3", 1024);
  song.loop();

  lowpass = new LowPassSP(20000, 44100);     //DICHIARAZIONE FILTRO PASSA BASSO
  highpass = new HighPassSP(200, 44100);   //DICHIARAZIONE FILTRO PASSA ALTO
  song.addEffect(lowpass);
  song.addEffect(highpass);
  
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(30);

  

  filtro=0; //0=none, 1=bass, 2=high
}
 
void keyPressed() {
  if(key=='l' || key=='L'){ //introduco filtro passa basso
    if(filtro==0 || filtro==2){
        highpass.setFreq(200); //tolgo filtro passa alto
        lowpass.setFreq(200);  //introduco filtro passa basso
        filtro=1;
    }
  }
  else if(key=='h' || key=='H'){ //introduco filtro passa alto
    if(filtro==0 || filtro==1){
        highpass.setFreq(10000); //introduco filtro passa alto
        lowpass.setFreq(20000);  //tolgo filtro passa basso
        filtro=2;
    }
  }
  else if(key=='n' || key=='N'){ //tolgo ogni filtro (canzone normale)
    if(filtro==1 || filtro==2){
        highpass.setFreq(200);   //tolgo filtro passa alto
        lowpass.setFreq(20000);  //tolgo filtro passa basso
        filtro=0;
    }
  }
}


void draw() {
  background(0);
  fft.forward(song.mix);


      for (int i = 0; i < fft.avgSize(); i++) {
        for (int y = 10; y <= height; y = y +20) {
          stroke(60);
          fill(0);
          rect (10+(width/30)*i, y, 20,20);
        }
      }
       
     
          for (int i = 0; i < fft.avgSize(); i++) {
             band = fft.getBand(i);
         
              
             for(int z=0; z<fft.getAvg(i)*15; z+=20){
                
                fill( 30,map(i,0,band, 255,10),map(i,0,fft.avgSize(), 50,255));
                
                rectMode(CENTER);
                rect(10+(width/30)*i,height/2+z,20,20);
                rect(10+(width/30)*i,height/2-z,20,20);
              
                rect(10+(width/30)*(29-i),height/2+z,20,20);
                rect(10+(width/30)*(29-i),height/2-z,20,20);
           
              
     }
  }
           
}

