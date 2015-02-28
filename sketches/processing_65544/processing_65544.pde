
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
BeatDetect beat;
AudioMetaData mp3MetaData;
HighPassSP highPass;
LowPassSP lowPass;

float offsetAniTop=2;
float offsetAniBot=11;
int beatKeyCol = 26;                 //colore del cursore che segnala animazione beat
int nLines = 20;
int amp = 6;
int [] KeyColor = {90, 90, 90, 90};  //inizializzo i colori dei tasti a colore "OFF"
boolean beatEnable = false;
boolean hfAmpEnable = false;

void setup()
{
  size(900, 600);
  colorMode(HSB, 225);    
  minim = new Minim(this);
  song = minim.loadFile("kc.mp3", 512);
  mp3MetaData = song.getMetaData();
  song.play(); 
  lowPass = new LowPassSP(15000, song.sampleRate());
  song.addEffect(lowPass);  
  highPass = new HighPassSP(1, song.sampleRate());
  song.addEffect(highPass);
    
  //FFT
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(nLines);                                      //numero bande

  //Beat
  beat = new BeatDetect();
  beat.setSensitivity(100); 
}

void draw()
{
  fft.forward(song.mix);                                      // FFT su buffer mix
  beat.detect(song.mix);                                      // BEAT detect su buffer mix
  
  int marginLeft = width / 9;
  int marginTop = height / 5;                                //Margine Top
  int marginBot = height - marginTop;                        //Margine Bottom  
  int barHeight = height / 2 - marginTop;                    //Lunghezza delle Barre per spettro
  int barWidth = ((width - marginLeft*2) / nLines) / 2 - 3;
  int boxWidth = barWidth*2+width-marginLeft*2;              //Larghezza box cornice
  int x = int((width - 2 * marginLeft) / fft.avgSize());
 
  background(0);
  stroke(80);                                                //colore contorno oggetti
  strokeWeight(10);
  rect(marginLeft-barWidth*2+2, marginBot-barWidth-5, boxWidth, -barHeight*2);  //cornice animazione
  rect(marginLeft-barWidth*2+2, marginBot, boxWidth, height/8);                 //cornice waveform
    
  //waveform plot
  float[] mix = song.mix.toArray();
  for ( int i = 0; i < mix.length - 1; i++ )
  {
    float x1 = map(i, 0, song.bufferSize(), 0, boxWidth);
    float x2 = map(i+1, 0, song.bufferSize(), 0, boxWidth);
    strokeWeight(2);
    line(marginLeft*0.77+x1, marginBot*1.08 - mix[i]*30, marginLeft*0.77+x2, marginBot*1.08 - mix[i+1]*25);
  }

  //bottoni
  strokeWeight(5);
  rect(205,marginTop/2.5,140,38); //Beat Mode
  rect(358,marginTop/2.5,140,38); //HF-AMP
  rect(511,marginTop/2.5,140,38); //HighPass 
  rect(664,marginTop/2.5,140,38); //LowPass 
  fill(KeyColor[0],KeyColor[0]*2,KeyColor[0]*2); 
  text("BEAT MODE",239,marginTop/1.65);
  fill(KeyColor[1],KeyColor[1]*2,KeyColor[1]*2); 
  text("HF-AMP",404,marginTop/1.65);
  fill(KeyColor[2],KeyColor[2]*2,KeyColor[2]*2); 
  text("HIGHPASS",551,marginTop/1.65);
  fill(KeyColor[3],KeyColor[3]*2,KeyColor[3]*2); 
  text("LOWPASS",708,marginTop/1.65);  
  strokeWeight(1);
  
  //mp3 metaData
  fill(90);
  text("File: " + mp3MetaData.fileName(), marginLeft, marginTop/1.8);
  int duration = (song.length() - song.position())/1000; 
  int minutes = duration / 60;
  int seconds = duration - minutes * 60;
  if (seconds < 10) {
    text("Time: 0" + minutes + ".0" + seconds, marginLeft, marginTop/1.8+16); 
  } else {
    text("Time: 0" + minutes + "." + seconds, marginLeft, marginTop/1.8+16); 
  }

  //Ciclo for analisi spettrale  
  for (int i = 0; i < nLines; i++)
  {
    if (hfAmpEnable) amp = i*3+15;     
    //endScale
    int endScale = 178;    
    float fftAvgAmp=fft.getAvg(i)*amp;
    if (fftAvgAmp > endScale) fftAvgAmp = endScale; 
    fill( map( i, 0, nLines, 10, 110), 180, 180);                                             //colore barre in alto
    rect(i*x+marginLeft, marginTop, barWidth, barHeight - fftAvgAmp);                         //barre in alto    
    fill( map( i, 0, nLines, 110, 10), 180, 180);                                             //colore barre in basso
    rect(i*x+marginLeft, marginBot-40, barWidth, -(barHeight - barHeight/3 + fftAvgAmp));     //barre in basso
    
    fill(0);
    stroke( map( i, 0, nLines, 110, 10), 150, 150);
    strokeWeight(3);
    rect(i*x+marginLeft-12+offsetAniTop, (barHeight + marginTop - 5) - fftAvgAmp,25,12);      //rett sfasato alto x animazione beat
    stroke( map( i, 0, nLines, 10, 110), 150, 150);    
    rect(i*x+marginLeft-12+offsetAniBot, (barHeight + marginTop + 13) - fftAvgAmp,25,12);     //rett sfasato basso x animazione beat
    strokeWeight(1);        
    fill(beatKeyCol,200,200);    
    stroke(80);
    rect(i*x+marginLeft, (barHeight + marginTop + 3) - fftAvgAmp,barWidth,barWidth);          //rett centrale che segnala animazione
    fill(30); 
    rect(i*x+marginLeft+7, (barHeight + marginTop + 6) - fftAvgAmp,barWidth/3,barWidth/3);    //rett per riflesso su rett centrale
    strokeWeight(1);       
    
     //Animazione Beat
    if ( beat.isOnset() && beatEnable ) {                                                     //rett sfasati in posizione invertita
        offsetAniTop = 11;
        offsetAniBot = 2;
        beatKeyCol = 85;                                                                      //accendo segnale animazione beat in corso
    } else { 
         
        if ( offsetAniTop <= 2 ) {                                                            //rett sfasati: sono in pos iniziale 
           offsetAniTop = 2;
           offsetAniBot = 11;
           beatKeyCol = 26;                                                                   //spengo segnale animazione beat
        } else {                                                                              //rett sfasati: rientro graduale
           offsetAniTop = offsetAniTop - 0.02;
           offsetAniBot = offsetAniBot + 0.02;
        }
    }
  }
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

void mousePressed()
{  
  if (mouseX > 205 && mouseX < 345 && mouseY > 48 && mouseY < 86)  //BEAT
  {
    if (KeyColor[0] == 200) {
      KeyColor[0]=90;
      beatEnable = false;
    } else {
      beatEnable = true;
      KeyColor[0]=200; 
    }
  }
 
  if (mouseX > 358 && mouseX < 498 && mouseY > 48 && mouseY < 86)  //HF-AMP
  {
    if (KeyColor[1] == 200) {
      KeyColor[1]=90;
      amp = 6;
      hfAmpEnable = false;
    } else {
      hfAmpEnable = true;
      KeyColor[1]=200; 
    }
  }

  if (mouseX > 511 && mouseX < 651 && mouseY > 48 && mouseY < 86)   //HIGHPASS
  {
    if (KeyColor[2] == 200) {
      KeyColor[2]=90;
      highPass.setFreq(1);
    } else {
      KeyColor[2]=200; 
      highPass.setFreq(6000);   //Taglia le frequenze < 2000hz
    }
  }
  
  if (mouseX > 664 && mouseX < 804 && mouseY > 48 && mouseY < 86)  //LOWPASS
  {
    if (KeyColor[3] == 200) {
      KeyColor[3]=90;
      lowPass.setFreq(20000);
    } else {
      KeyColor[3]=200; 
      lowPass.setFreq(500);   //TAGLIA le frequenza > 500hz
    }
  }
}




