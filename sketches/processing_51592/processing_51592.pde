
/* I am grabbing code from Paul Grenfell from OpenProcessing, 
especially in regard to sound and the minim library*/

import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer audioPlayer;
FFT fft;
int iNumAverages = 32;
int valueR =255;
int valueG =255;
int valueB =255;


 
void setup()
{
  size(600,600,P3D);
  minim = new Minim(this);
  audioPlayer = minim.loadFile("01 Old Letters.mp3", 512);
  audioPlayer.loop();
  fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
  fft.linAverages(iNumAverages);
  
 
}
 
class FftVar
{
  FftVar(int iFreq)
  {
    m_iFreq = iFreq;
    m_fValue = 0;
  }
   
  void Update()
  {
    m_fValue = m_fValue * 0.8 + fft.getAvg(m_iFreq) * 0.2;
  }
   
  float GetValue()
  {
    return m_fValue;
  }
   
  int m_iFreq;
  float m_fValue;
}

 
 
FftVar fftTotalScale = new FftVar(2);
FftVar fftArms = new FftVar(1);
FftVar fftTwist = new FftVar(5);
FftVar fftLength = new FftVar(20);




 
 
void draw()
{
  fft.forward(audioPlayer.mix);
  fftTotalScale.Update();
  fftArms.Update();
  fftTwist.Update();
  fftLength.Update();

  
 
  int t=int(random(100));

 
  background(0);
 
 


 ellipseMode(CENTER);
  float fTotalScale = constrain(fftTotalScale.GetValue() * 0.75, 0.01, 2);
  int iNumArms = (int)constrain(fftArms.GetValue() * 3, 3, 10);
    if (fTotalScale > .75 && fTotalScale < 1){
  noStroke();
fill(valueR,valueG,valueB,t);
println(valueR + ","+ valueG + "," + valueB);


    }
    
  for (float fTwistDir = -1; fTwistDir <= +1; fTwistDir += 2)
  {
    for (int i = 0; i < iNumArms; i++)
    {
      

      pushMatrix();
      translate(mouseX, mouseY);
      scale(fTotalScale);
      rotateZ((float)i * PI*2.0/(float)iNumArms - PI/2);
      int iLength = (int)constrain(fftLength.GetValue() * mouseX, 3, 20);
      for (int j = 0; j < iLength; j++)
      {
        float fRGBAlpha = (float)j / (float)iLength;
        translate((iLength-j+5)*3,0,0);
        rotateZ(fftTwist.GetValue() * 0.5 * fTwistDir);
        ellipse(0, 0, (iLength-j)*mouseY*.01, (iLength-j)*mouseY*.01);
      }
      popMatrix();
      
    }
  }
}
  void keyPressed() {
      int r=int(random(255));
  int g=int(random(255));
  int b=int(random(255));
  int t=int(random(100));
  
  if (key=='r') {
     valueR = 255;
     valueG =0 ;
     valueB=0;
   }

  else if(key=='g'){

    valueR = 0;
     valueG =255 ;
     valueB=0;}
     else if(key=='b'){

     valueR = 0;
     valueG =0 ;
     valueB=255;}
     
       else if(key=='p'){

     valueR = 255;
     valueG =0 ;
     valueB=255;}
     
       else if(key=='y'){

     valueR = 255;
     valueG =255 ;
     valueB=0;}
       else if(key=='o'){

     valueR = 255;
     valueG =168 ;
     valueB=0;}
}


  




  



