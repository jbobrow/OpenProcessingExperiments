
import krister.Ess.*;

int x = 0; int y = 1000;
int shift =100;
int level = 0;
float theta = 0;
boolean clear = true;
FFT myfft;
AudioInput myinput;
int bufferSize=256;

void setup() 
{
  size(1000, 1000);
  noStroke();
  smooth();
  background(255);
  
    
  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005, .05);
}

void draw() 
{    
  if(clear == true){
  background(255);
  }
  //println(shift);
  recurse(x, y, 1000,level);
   level = 0;
   theta += PI/200;
   x = int(750*sin(theta))+500;
//   x = (x+10)%1000;
   y = 1000-x;
}

void mousePressed(){
 clear = !clear; 
}

void recurse(int x, int y, int diameter, int level){

  if(diameter > 10){
    fill(x/2-100,y/2-100,100,5.0);
    ellipse(shift+x,shift+y,diameter*(0.5+myfft.spectrum[level%256]),diameter*(0.5+myfft.spectrum[level%256]));
    recurse(x/2,y/2,diameter/2,level+1);
    recurse(x/2,y,diameter/2,level+2);
    recurse(x,y/2,diameter/2,level+3);

  }
}
  
  
  public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}

  
 

