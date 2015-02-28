
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;


int filtro;


LowPassSP lowpass;
HighPassSP highpass;
float band;

void setup(){
size(600, 600);
smooth();
fill(255,0,30);
minim = new Minim(this);
song = minim.loadFile("02 - Bangarang feat. Sirah (Original Mix).mp3", 1024);
song.loop();
fft = new FFT(song.bufferSize(), song.sampleRate());
lowpass = new LowPassSP(15000, song.sampleRate());
song.addEffect(lowpass);
highpass = new HighPassSP(1, song.sampleRate());
song.addEffect(highpass);

  colorMode(HSB,100);

filtro=0; //0=none, 1=bass, 2=high

}

void keyPressed() {
  if(key=='l' || key=='L'){ //introduco filtro passa BASSO
    if(filtro==0 || filtro==2){
        highpass.setFreq(200); //tolgo filtro passa ALTO
        lowpass.setFreq(200);  //introduco filtro passa BASSO
        filtro=1;
       }
  }
  
  else if(key=='h' || key=='H'){ //introduco filtro passa ALTO
    if(filtro==0 || filtro==1){
        highpass.setFreq(10000); //introduco filtro passa ALTO
        lowpass.setFreq(20000);  //tolgo filtro passa BASSO
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

void draw(){
  fill(0,40);                //al posto di background(0); utilizzo un rettangolo di dimensioni dell'intera schermata di setup con riempimento nero (0) e trasparenza [alpha] (40)
  rect(0,0,width,height);
  stroke(255);
  fill(255);

fft.forward(song.mix);
for (int i = 0; i < 120; i+=3) {
band = fft.getBand(i);

for(int y=0; y<band; y=y+13){
 fill( map(i,0,120, 0,100),map(y,0,band, 100,0),100);
ellipse(width/8+4*i,2*height/4-y,10,10);
 fill( map(i,0,120, 0,100),map(y,0,band, 100,0),100);
ellipse(width/8+4*i,2*height/4+y,10,10);

}

}

}
void stop(){
song.close();
minim.stop();
super.stop();
}

