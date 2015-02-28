
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioOutput out;
HighPassSP hpf;  //ハイパスフィルター用の変数

FFT fft;
float DEPTH = 0.002;
float FREQUENCY = 2.0;
float FS = 44100.0;


float X;
float Y;

float Angle, Cx,Cy,R;

float cutoff;    //削除する周波数のしきい値

SineWave sine1;

void setup(){
 
 X = 200;
 Y = 200;
  size(400,400);
  background(0);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  //vibrato = new VibratoClass(FS, DEPTH, FREQUENCY);
  //out.addEffect(vibrato);
   fft = new FFT(out.bufferSize(), out.sampleRate());
  sine1 = new SineWave(523, 0.5, out.sampleRate());
  sine1.portamento(100);
 out.addSignal(sine1);
  //hpf = new HighPassSP(100, out.sampleRate());
  //out.addEffect(hpf);    //エフェクトを設定
smooth();

Cx=width/2;
Cy =height/2;
Angle = 0;

}

void draw(){
  fadeToWhite();
  background(0);
  strokeWeight(1);
   // FFT 実行
  fft.forward(out.mix);

  // maruの描画
  for (int i = 0; i < fft.specSize(); i++)
  {
    noStroke();
    fill(0,255,255);
    float x = map(i, 0, fft.specSize(), 0, width);
    fill(random(100,200),34,201,121);
    Angle += 10-x;
    R = 50+x;
  X= Cx+(R*cos(radians(Angle)));
  Y= Cy+(R*sin(radians(Angle)));
   ellipse(X,Y,10,10)  ;
    }
  }

  



void keyPressed(){
  
   if(key == 'q'){
 float freq = map(466, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
    if(key == 'w'){
    float freq = map(554, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'e'){
      float freq = map(622, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'r'){
     float freq = map(739, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 't'){
     float freq = map(830, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'y'){
      float freq = map(920, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'u'){
      float freq = map(523, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'i'){
      float freq = map(523, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'o'){
     float freq = map(523, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
    if(key == 'p'){
      float freq = map(523, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
  if(key == 'a'){
    float freq = map(523, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
  if(key == 's'){
      float freq = map(587, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
   if(key == 'd'){
      float freq = map(659, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
    out.unmute();
  }
  
  if(key == 'f'){
      float freq = map(698, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
  }
  
  if(key == 'g'){
      float freq = map(783, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
  }
  
  if(key == 'h'){
      float freq = map(880, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
  }
  
  if(key == 'j'){
      float freq = map(992, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
  }
  
  if(key == 'k'){
      float freq = map(1046, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
  }
  
          if(key == 'z'){
    
      float freq = map(261, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
   }
   
        if(key == 'x'){
    
       float freq = map(293, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
   }
   
        if(key == 'c'){
    
       float freq = map(329, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
      
   }
   
        if(key == 'v'){
     float freq = map(349, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
 
   }
   
        if(key == 'b'){
    float freq = map(391, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
     
   }
   
        if(key == 'n'){
      float freq = map(440, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
      
   }
   
        if(key == 'm'){
      float freq = map(493, 0, width, 0, 1100);
  //周波数を設定
  sine1.setFreq(freq);
  
    out.unmute();
        
   }
}

void keyReleased(){
  if(key == 'q'){
     out.mute();
  }
    if(key == 'w'){
     out.mute();
  }
  
    if(key == 'e'){
     out.mute();
  }
  
    if(key == 'r'){
     out.mute();
  }
  
    if(key == 't'){
     out.mute();
  }
  
    if(key == 'y'){
     out.mute();
  }
  
    if(key == 'u'){
     out.mute();
  }
  
    if(key == 'i'){
     out.mute();
  }
  
    if(key == 'o'){
     out.mute();
  }
  
    if(key == 'p'){
     out.mute();
  }
  
  if(key == 'a'){
 
    out.mute();
  }
  
  if(key == 's'){
    
    out.mute();
  }
  
  if(key == 'd'){
    
    out.mute();
  }
   if(key == 'f'){
    
    out.mute();
   }
   
     if(key == 'g'){
    
    out.mute();
   }
   
     if(key == 'h'){
    
    out.mute();
   }
   
     if(key == 'j'){
    
    out.mute();
   }
   
     if(key == 'k'){
    
    out.mute();
   }
   
        if(key == 'z'){
    
    out.mute();
   }
   
        if(key == 'x'){
    
    out.mute();
   }
   
        if(key == 'c'){
    
    out.mute();
   }
   
        if(key == 'v'){
    
    out.mute();
   }
   
        if(key == 'b'){
    
    out.mute();
   }
   
        if(key == 'n'){
    
    out.mute();
   }
   
        if(key == 'm'){
    
    out.mute();
   }
}

void fadeToWhite(){
 noStroke();
fill(0,60);
rect(0,0,width,height);
}



void stop(){
  
  out.close();
  minim.stop();
  super.stop();

}
