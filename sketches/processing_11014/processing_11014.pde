
import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;
float angle = 0;

void setup() {
  size(600,600);
  frameRate(60);
  background(255);
  //noStroke();
  //noFill ();



  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(0.9);
  myfft.equalizer(true);
  myfft.limits(.05,.05);
}

void draw() {
  background(0);
  strokeWeight(random(10));
  //stroke(235,35,78,15);

  //stroke(100,20);

  ///fill(random(255),random(255),random(255));
  for (int i=0; i<bufferSize;i++) 
  {
    fill(0,50); 
    //rect(0,0,width,height);
    angle = angle + 0.5;

    float sinval = sin(angle);
    float cosval = cos(angle);

    float x = width/2 + cos (angle*0.1)*myfft.spectrum[i]*500;
    float y = height/2 + sin (angle*0.07)*myfft.spectrum[i]*500;

    //fill(255,58,90,150);
    stroke(255,0,0,20);
    ellipse (x,y,10,10);
    
    stroke(255,0,0,15);
    ellipse (x,y,random(10),random(10));

    


    //rect(i+500,100,myfft.spectrum[i]*-500,30);
    //rect(i+100,500,myfft.spectrum[i]*-300,-30);
    //rect(i,600,5,myfft.spectrum[i]*-600);
    //ellipseMode(CENTER);
    //ellipse(i, 250,myfft.spectrum[i]*random(900),myfft.spectrum[i]*random(900));
    //ellipse(i, 250,myfft.spectrum[i]*random(500),myfft.spectrum[i]*random(500));

  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}





