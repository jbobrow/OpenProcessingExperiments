
//<p id="adam"  onclick="insertVideo('adam','C09');">adam</p>
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine;
boolean works=true;
int larbin;
int w=250;                          
int nbrCarre = 5;
int tcarre= w / nbrCarre;                              
int cycle=0;
int voix=0;
int cycleMax=int(random(5))+3;
color[] cool= new color[3];
  int[] freq= new int[cycleMax];
  int[] col= new int[cycleMax*nbrCarre*nbrCarre];

void setup(){
  for (int x=0;x<cycleMax;x++){
    freq[x]=50+int(random(500));
  }  
  cool[0]=color(int(random(255)),int(random(255)),0);
  cool[1]=color(0,150,int(random(255)));
  cool[2]=color(int(random(255)),int(random(255)),int(random(255)));
  noStroke();
  size(250,250);  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(freq[0], 0.2, out.sampleRate());
  sine.portamento(10);
  out.addSignal(sine);
  for (int x=0;x<cycleMax;x++){
    freq[x]=50+int(random(800));
  }  
  for (int x=0;x<cycleMax*sq(nbrCarre);x++){
    col[x]=int(random(3));
  }    
frameRate(2);
}

void draw(){

   if(works==true){
   sine.setFreq(freq[cycle]);
    cycle++;
    if(cycle==cycleMax)cycle=0;
      for(int y=0;y<nbrCarre;y++){
        for(int x=0;x<nbrCarre;x++){
          larbin=col[x+(y*nbrCarre)+(cycle*25)];
          fill(cool[larbin]);
          rect(x*tcarre,y*tcarre,tcarre,tcarre);
        }
      }
  }
}
void mousePressed(){
 if(works==true){
   works=false;
   sine.setAmp(0);
 }else{
   works=true;
   sine.setAmp(0.2);
 } 
}
void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}


