
class SoundCircle{
  
  float x, y, oX, oY, rad;
  AudioPlayer mySound;
  float count = 0;
  float speed = 0;
  
  SoundCircle(float xIn, float yIn, float radIn, AudioPlayer sound){
    
    x = xIn;
    y = yIn;
    oX = xIn;
    oY = yIn;
    rad = radIn;
    mySound = sound;
    
  }
  
  boolean isOver(float xIn, float yIn){
    return dist(x,y,xIn,yIn) < rad/2.;
  }
  
  void play(float gain){
    if(!mySound.isPlaying()){
      speed = gain/5.;
      mySound.setGain((gain/10.)*(gain/10.));
      mySound.loop(0); 
    }
  }
  
  void draw(){
    if(mySound.isPlaying()){
     count+= (0.5*speed)*((1000-count)/1000); 
     x = oX+sin(count)*3;
     fill(0);
     ellipse(x,y,rad,rad); 
     //filter(BLUR, 1);
    }else{
     count = 0; 
     fill(0);
     ellipse(x,y,rad,rad); 
    }
    
  }
  
  
}

