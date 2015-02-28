
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer song;
FFT fft;

LowPassSP lowpass;
HighPassSP highpass;
int filtro;

int widthBand;
int nBands=32;
int raggi[] = new int[32];

int nPart=20;
Particle particelle[]= new Particle[nPart];

void setup(){
  size(500, 500, P3D);
  textMode(SCREEN);
  rectMode(CORNERS);
  colorMode(HSB, 100);
  minim = new Minim(this);
  song = minim.loadFile("ESOM.mp3", 1024);
  
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(nBands);
  for(int i=0; i<32; i++){
    raggi[i]=320-(10*i);
  }
  
  lowpass = new LowPassSP(20000, 44100);     //DICHIARAZIONE FILTRO PASSA BASSO
  highpass = new HighPassSP(200, 44100);   //DICHIARAZIONE FILTRO PASSA ALTO 
  song.addEffect(lowpass);
  song.addEffect(highpass);
  filtro=0; //0=none, 1=bass, 2=high
  
  for(int i=0; i<nPart; i++){
    particelle[i]=new Particle(width/2,height/2,random(-10,10),random(-10,10),50);
  }
  
  song.loop();
  
}
void draw(){
  background(155,36,78);
  stroke(255);
  fill(255);
  // esegue trasformata di Fourier sul buffer mix
  fft.forward(song.mix);

  for (int i = 0; i < fft.avgSize(); i++){
    //rect(i*widthBand, height, i*widthBand+widthBand, height-heightBand*4);
    fill(color(i*3,70,90,100));
    ellipse(width/2, height/2, raggi[i]+fft.getAvg(i)*4, raggi[i]+fft.getAvg(i)*4);
    if(fft.getAvg(0)>50){
       for(int j=0; j<nPart; j++){
          particelle[j]=new Particle(width/2,height/2,random(-10,10),random(-10,10),50);
        }
    }
    fill(color(map(mouseX,0,width,0,100),90,90,20));
    pushMatrix();
    translate(width/2, height/2);
    for(int j=0; j<nPart; j++){
        particelle[j].display();
        particelle[j].update();
        rotate(1);
    }
    popMatrix();
    noStroke();
  }
  
}

void keyPressed() {
  if(key=='b' || key=='B'){ //introduco filtro passa basso
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

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

