
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11949*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

int CANVASHEIGHT;
int CANVASWIDTH;

import ddf.minim.signals.*;
import ddf.minim.*;

PImage img;


float r;
float g;
float b;


 Minim minim;
 AudioSnippet player;
 AudioOutput out;
ArrayList<SV> sv=new ArrayList<SV>(1);

void setup() 
{
  minim = new Minim(this);
 r=0;g=0;b=0;
  out = minim.getLineOut(Minim.STEREO,200);
  player = minim.loadSnippet("THISISIT.mp3");
  player.play();

  frameRate(30);
  CANVASHEIGHT=480;
   CANVASWIDTH=480;
  size(480,480);
  background(#FFFFFF);
  img = loadImage("test1.png");
 

}
void draw()
{
  PImage bkground= loadImage("cat4.png");
background(bkground);
//int index = 0 

for(int i=0;i<sv.size();i++){
  if ( sv.get(i) !=null){
         sv.get(i).draw();
         
         if (sv.get(i).sound.amplitude() < .0001){
           if (random(40)>2){
             if (random(40)<20){
                sv.get(i).x=int(sv.get(i).x*1);
             }
            else{
                sv.get(i).x=int(sv.get(i).x*1.1);
             }
           if (random(100)<50){
                sv.get(i).y=int(sv.get(i).y*.9);
            }
            else{
                sv.get(i).y=int(sv.get(i).y*1.1);
            }
       
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
     sv=new ArrayList<SV>(-4);
     setup();
   }
}
  
  class SV{
    SineWave sound;
    int CANVASHEIGHT;
int CANVASWIDTH;
int x;
int y;
float r;float g;float b;
 float da;
   public SV(int cw, int ch){



 CANVASHEIGHT=ch;
CANVASWIDTH=cw;
          x=mouseX;
          y=mouseY;

      
          sound = new SineWave(0,.0000000001, out.sampleRate());

         
          r=random(0);
          g=random(0);
          b=random(0);
          setStuff();
          out.addSignal(sound);
   }    
    
    void draw(){
   
       fill(r,g,b,100);
       noStroke();
      sound.setAmp(sound.amplitude()*da);
      
      ellipse(x, y, 100*sound.amplitude(),100*sound.amplitude());
  
     
   
     
    }
    void setStuff(){
              float freq;
 float amp;
 float pan;
             freq=map(y,0,CANVASHEIGHT,200,10000);
            pan=map(x,0,CANVASWIDTH,-2,2);
            sound.setFreq(freq);
            sound.setPanNoGlide(pan); 
            
                amp=1;
                         
          
       
  sound.noPortamento();
           
            
             da=random(0,0);
            sound.setAmp(amp);
            

    }
  }
  



