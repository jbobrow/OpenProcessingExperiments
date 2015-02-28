
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer daSound;
AudioOutput out;
SineWave sine;

 PImage photo;
 PImage photo2;

boolean chanel = true ; 
boolean Dolce = true ;


void setup (){
  size (600,500);
  photo = loadImage ("chanel.jpg");
  photo2 = loadImage ("Dolce.jpg");
  minim = new Minim(this);
  daSound = minim.loadFile("Silbar piropo.mp3");
   out = minim.getLineOut(Minim.STEREO, 2048);
   sine = new SineWave(440, 0.2, out.sampleRate());
   out.addSignal(sine);

}

  void draw () {
    
    if (chanel) {
      image (photo,0,0,width,height);
       daSound.cue(200);
    daSound.play();
    }else{
      image(photo2,0,0,width,height);
   
      }
  }

void mousePressed (){
      chanel = !chanel ;
      
   
    }
    
    
void stop()

{
  daSound.close();
  minim.stop();
  super.stop();
}



