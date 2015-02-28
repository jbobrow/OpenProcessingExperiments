

int CANVASHEIGHT;
int CANVASWIDTH;

import ddf.minim.signals.*;
import ddf.minim.*;


float r;
float g;
float b;


 Minim minim;
 AudioOutput out;
ArrayList<SV> sv=new ArrayList<SV>(1);

void setup() 
{
  minim = new Minim(this);
 r=0;g=0;b=0;
  out = minim.getLineOut(Minim.STEREO,512);

  frameRate(30);
  CANVASHEIGHT=480;
   CANVASWIDTH=480;
  size(CANVASWIDTH,CANVASHEIGHT);
  background(0,0,0);

}
void draw()
{
background(0,0,0);

for(int i=0;i<sv.size();i++){
  if ( sv.get(i) !=null){
         sv.get(i).draw();
         
         if (sv.get(i).sound.amplitude() < .01){
  if (random(100)>2){
                sv.get(i).x=int(sv.get(i).x*sv.get(i).dx);
                sv.get(i).y=int(sv.get(i).y*sv.get(i).dy);
         
       
            sv.get(i).setStuff();
          }
      
  
          else{
             out.removeSignal(sv.get(i).sound);
            sv.remove(i);
          }
       }
       
     }
      
  }

}


void mousePressed(){
   sv.add(new SV(CANVASWIDTH, CANVASHEIGHT));
   
   
           
}
void keyPressed(){
   if (key=='r'){
     out.clearSignals();
     out=null;
     sv=null;
     sv=new ArrayList<SV>(1);
     setup();
   }
}
  public void stop() {
    out.clearSignals();
     out=null;
     sv=null;
  super.stop();
} 

  class SV{
    SineWave sound;
    int CANVASHEIGHT;
int CANVASWIDTH;
int x;
int y;
float r;float g;float b;
 float da;
 float dx;
 float dy;
   public SV(int cw, int ch){



 CANVASHEIGHT=ch;
CANVASWIDTH=cw;
          x=mouseX;
          y=mouseY;

      dx=random(.9,1.1);
      dy=random(.9,1.1);
          sound = new SineWave(0,1, out.sampleRate());

         
          r=random(256);
          g=random(256);
          b=random(256);
          setStuff();
          out.addSignal(sound);
   }    
    
    void draw(){
   
       fill(r,g,b,100);
       noStroke();
      sound.setAmp(sound.amplitude()*da);
      
      ellipse(x, y, 2*CANVASWIDTH*sound.amplitude(),2*CANVASHEIGHT*sound.amplitude());
  
     
   
     
    }
    void setStuff(){
              float freq;
 float amp;
 float pan;
             freq=map(y,0,CANVASHEIGHT,220,1100);
            pan=map(x,0,CANVASWIDTH,-1,1);
            sound.setFreq(freq);
            sound.setPanNoGlide(pan); 
            
                amp=1;
                         
          
       
  sound.noPortamento();
           
            
             da=random(.5,.8);
            sound.setAmp(amp);
            

    }
  }
  


