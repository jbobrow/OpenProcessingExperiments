
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer song;
LowPassSP lowpass;
FFT fft;
AudioOutput out;
SquareWave sine;
SawWave sine2;
SineWave sine3;
WhiteNoise nsine;
float frequency,amp;

void setup()
{
  size(800,600);
  minim = new Minim(this);
  song = minim.loadFile("ALEXANDRA STAN - Mr. Saxobeat.mp3", 1024);
  song.loop();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(22,3);
  lowpass = new LowPassSP(15000, song.sampleRate());
  sine = new SquareWave(0, 0, song.sampleRate());
  sine2 = new SawWave(0, 0, song.sampleRate());
  sine3 = new SineWave(0,0,song.sampleRate());
  nsine = new WhiteNoise();
  song.addEffect(lowpass);
  out = minim.getLineOut(Minim.STEREO);
  out.addSignal(sine);
  out.addSignal(sine2);
  out.addSignal(sine3);
  out.addSignal(nsine);
}
void draw()
{
  background(0);
  frequency=(float)width/800.0*(float)mouseX+100.0;
  amp=(float)mouseY/(float)height;
  if(key=='q' || key=='Q'){
    sine.setFreq(frequency);
    sine.setAmp(amp);
    out.enableSignal(sine);
  }else{out.disableSignal(sine);}
  
  if(key=='t' || key=='T'){
    sine2.setFreq(frequency);
    sine2.setAmp(amp);
    out.enableSignal(sine2);
  }else{out.disableSignal(sine2);}
  
  if(key=='c'|| key=='C'){
    sine3.setFreq(frequency);
    sine3.setAmp(amp);
    out.enableSignal(sine3);
  }else{out.disableSignal(sine3);}
  
  if(key=='l' || key=='L'){
    frequency=(float)width/200.0*(float)mouseX;
    lowpass.setFreq(frequency);
  }else{lowpass.setFreq(44100);}
  
  if(key=='b' || key=='B'){
    nsine.setAmp(amp);
    out.enableSignal(nsine);
  }else{out.disableSignal(nsine);}
  
  fft.forward(song.mix);
  
  if(key=='l'||key=='L'){
    stroke(114,0,255);
    strokeWeight(5);
    for(int i=0;i<120;i+=2){
      line((float)i*5+(float)(width)/10,3*height/4,(float)i*5+(float)(width)/10,3*(float)height/4 -2*fft.getBand(i));
    }
    textSize(14);
    stroke(255);
    strokeWeight(1);
    line(2*width/5-45,height/8+5,3*width/5+45,height/8+5);
    text("Applicazione del filtro passa-basso",2*width/5-40,height/8);
    text("Per uscire premere un'altro tasto",2*width/5-40,7*height/8);
  }else{
      strokeWeight(5);
      stroke(255,0,156);
      for (int i = 0; i < fft.avgSize(); i++){
        line((float)i*15+(float)(width-10)/32.0+5.0,3*height/4,(float)i*15+(float)(width-10)/32.0+5.0,3*(float)height/4 - fft.getAvg(i));
      }
      stroke(255);
      strokeWeight(1);
      float[] mix = out.mix.toArray();
      for ( int i = 0; i < mix.length - 1; i++ )
      {
        float x1 = map(i, 0, out.bufferSize(), 20, width-280);
        float x2 = map(i+1, 0, out.bufferSize(), 20, width-280);
        line(x1, 6*height/7 - mix[i]*5, x2, 6*height/7 - mix[i+1]*5);
        }
      textSize(14);
      fill(255);
      line(2*width/5-5,height/8+5,3*width/5+50,height/8+5);
      text("Possibili operazioni sul suono",2*width/5,height/8);
      text("Schiaccia i seguenti tasti per:",5*width/8,2*height/7);
      text("-Q per sovrapporre una onda quadrata",5*width/8+5,2*height/7+20);
      text("-T per sovrapporre una onda triangolare",5*width/8+5,2*height/7+40);
      text("-C per sovrapporre una onda sinusoidale",5*width/8+5,2*height/7+60);
      text("-B per sovrapporre rumore bianco",5*width/8+5,2*height/7+80);
      text("-L per applicare un filtro passa-basso",5*width/8+5,2*height/7+100);
      text("La forma del/la rumore/onda",5*width/8+30,6*height/7+5);
  }
}
void stop()
{
song.close();
minim.stop();
super.stop();
}

