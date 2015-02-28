
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound;    // create an output object




void setup(){

  size(300,300,P3D);
  minim = new Minim(this);
 mySound = minim.loadFile("LastNight.mp3");    
  mySound.play();                        
  }

  int x=0;

void draw(){

  camera(-600, 300,300,width,height/2+200,0,1,1,0);
 background(0);

 translate(width,height);
  noStroke();
for(int i=0; i<mySound.bufferSize(); i++){
  
fill(100,random(20-250),200,60);
     rect(i+200,400, mySound.left.get(i)*2000,mySound.left.get(i)*2000);
      rect(i+200,400, mySound.right.get(i)*2000,mySound.right.get(i)*2000);
}
  x++;

    
  
    //rect(120+out.mix.get(i)*100, i, 75 + out.mix.get(i+1)*100, i+5);//left buffer
  }



// here we provide a way to mute out
void keyPressed(){
  if ( key == 'm' ){
    if (mySound.isMuted() )
     {
      mySound.unmute();
    } else{
     mySound.mute();
    }
  }
}

void stop()
{
  mySound.close();
  minim.stop();
   super.stop();
}


