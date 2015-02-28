
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

void setup()
{
   size(800, 400);
   smooth(); 
   minim = new Minim(this);
   track = minim.loadFile("CARBON KEVLAR - Coco Shaker.mp3", 1024);
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
   text("Track: " + meta.fileName(), width/2 - 125, 30);
   text("Author: " + meta.author(), width/2 - 80, 60);
   float durata = meta.length() / 60000;
   text("Length: " + durata + " mins", width/2 - 55, 90); 
   if(key != 'l' && key != 'L')
   { 
   fill(255);
   rect(3*width/4, height/4, 30, 30);   
   fill(238,0,0); 
   text("Press",3*width/4 - 40, height/4 + 20);
   text("L", 3*width/4 + 12, height/4 + 20); 
   text("for Low Pass Filter", 3*width/4 + 40, height/4 + 20);
   }      
   if(key != 'h' && key !='H')
   {
   fill(255);   
   rect(3*width/4, height/4 + 80, 30, 30);     
   fill(34,139,34);
   text("Press",3*width/4 - 40, height/4 + 100);
   text("H", 3*width/4 + 11, height/4 + 100);
   text("for High Pass Filter", 3*width/4 + 40, height/4 + 100);
   }         
   if(key == 'l' || key == 'L') 
   {
      stroke(255);
      line(width/16, 7*height/8, 15*width/16, 7*height/8);
      fill(238,0,0);
      text("0", width/16-20, 7*height/8-20);
      text("10800", 15*width/16-20, 7*height/8-20);   
      text("Low Pass Filter", width/2 - 45, 7*height/8 + 30);
      float l = map(mouseX, 0, width, width/16, 15*width/16);
      float lowFreq = map(l, width/16, 15*width/16, 0, 10800);     
      line(l, 7*height/8-10, l, 7*height/8+10); 
      lowpass.setFreq(lowFreq);
      println("Freq: " + lowFreq);
   }
   if(key == 'h' || key == 'H')
   {
      stroke(255);
      line(width/16, 7*height/8, 15*width/16, 7*height/8);
      fill(34,139,34);
      text("0", width/16-20, 7*height/8-20);
      text("10800", 15*width/16-20, 7*height/8-20);
      text("High Pass Filter", width/2 - 45, 7*height/8 + 30);
      float h = map(mouseX, 0, width, width/16, 15*width/16);
      float highFreq = map(h, width/16, 15*width/16, 0, 10800);    
      line(h, 7*height/8-10, h, 7*height/8+10); 
      highpass.setFreq(highFreq);
      println("Freq: " + highFreq);
   }      
  fft.forward(track.mix);
  for(int i = 0; i < 120; i+=2)
  {
    band = fft.getBand(i);
    if(key != 'l' && key != 'L' && key != 'h' && key != 'H')
    stroke(0,0,238);
    if(key == 'l' || key == 'L')
    stroke(238,0,0);
    if(key == 'h' || key == 'H')
    stroke(34,139,34);
    strokeWeight(5);
    line(width/8 + 5*i, 3*height/4, width/8 + 5*i, 3*height/4-4*band);   
    if(key != 'l' && key != 'L' && key != 'h' && key != 'H')
   {
    stroke(0,0,128);
    line(width/8 + 5*i, 3*height/4, width/8 + 5*i - 1*band, 3*height/4 + 1*band);
    if(key == 'l' || key =='L')
    stroke(205,79,57);
    if(key == 'h' || key == 'H') 
    stroke(2,157,116);    
    strokeWeight(5);}
    }  
}

void stop()
{
   track.close();
   minim.stop();
   super.stop();
}

