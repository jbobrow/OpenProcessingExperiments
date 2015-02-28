
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioPlayer track;
AudioMetaData meta;
FFT fft;
 
LowPassSP lowpass;
HighPassSP highpass;
float band;
float freq;
void setup()
{
   size(600, 600);
   smooth();
   minim = new Minim(this);
   track = minim.loadFile("Can_t_Say_No-Conor_Maynard.mp3", 1024);
   track.play();
   meta = track.getMetaData();  
   fft = new FFT(track.bufferSize(), track.sampleRate());   
   lowpass = new LowPassSP(15000, track.sampleRate());
   track.addEffect(lowpass); 
   highpass = new HighPassSP(1, track.sampleRate());
   track.addEffect(highpass);
   
}
 
void draw()
{
   background(0);
   noStroke(); 
   fill(255);
   text("Brano: Can't say no - Conor Maynard", 20, 35);
   text("Autore: Pecile Francesco", 20,50);
   text("Durata: 3.15", 20,65);
   if(key != 'l' && key != 'L' && key!='h' && key !='H') {  
    text ("[L] filtro passa basso", 50, 450);
    text ("[H] filtro passa alto", 50, 480); 
 
      }  
   if (key == 'l' || key == 'L') {
        text ("Premi il mouse n una posizione qualsiasi per modificare la frequenza:", 50, 450); 
      text ("[H] filtro passa alto", 50, 480);
     lowpass.setFreq(freq);

     text (int (freq), 500,450);}
   
     
  if (key == 'h' || key == 'H') {
     text ("Premi il mouse in una posizione qualsiasi per modificare la frequenza:", 50, 450); 
      text ("[L] filtro passa basso", 50, 480);
      highpass.setFreq(freq);

     text (int(freq), 500,450); 
     
    
     }

  track.setGain(map(mouseY, 0, height, -20,4));
  fft.forward(track.mix);
  for(int i = 0; i < 40; i+=2)
  {
    band = fft.getBand(i);
    if(key != 'l' && key != 'L' && key != 'h' && key != 'H'){
    stroke(100+5*i,0+5*i,200+5*i);}
    if(key == 'l' || key == 'L'){
    stroke(0+5*i,0+5*i,200+5*i);}
    if(key == 'h' || key == 'H' ){
    stroke(50+5*i,100+5*i,50+5*i);}
    line(width/4+50 + 5*i, height/4, width/4+50 + 5*i, height/4-4*band); 
    line(width/4+50 , height/4+ 5*i, width/4+50 -4*band, height/4+5*i);
    line(width/2+98 , height/4+ 5*i, width/2+98 +4*band, height/4+5*i); 
    line(width/4+50 + 5*i, height/2+50, width/4+50 + 5*i, height/2+4*band+50); 
    strokeWeight(5);
   
    } 
}

void mouseClicked() {
 freq=( map(mouseX, 0, width, 0, 10800));
 }
 
void stop(){
   track.close();
   minim.stop();
   super.stop();
}

