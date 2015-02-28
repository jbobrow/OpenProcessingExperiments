
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;       
//AudioPlayer mySound;
AudioInput inputsound;
 
void setup(){
size(1440,900, P3D);
 
 minim = new Minim(this);
 //mySound = minim.loadFile("song.mp3");
 //mySound.play();   
 // get a line in from Minim, default bit depth is 16
  inputsound = minim.getLineIn(Minim.STEREO, 512); 
 smooth();
 background(255);
 colorMode(RGB, 50);
}
 
void draw()
{
 
  lights();
  camera(-200, 200, 500,width/2+50,height/2+50,0,0,1,0);
 
  translate(width/3 + random(1,200), height/2 + random(1,200), -50);
 
  for(int i = 0; i < inputsound.bufferSize() - 1; i++)
  {
    fill((inputsound.mix.get(i)*(100)),(inputsound.left.get (i)*(100)),(inputsound.right.get(i)*(100)),10);
    noStroke();
 
 //eyeball
 sphere( inputsound.mix.get(i)*950);
 //iris
 sphere( inputsound.left.get(i)*400);
 //pupil
 sphere( inputsound.right.get(i)*120);


}
}
 

 
void stop()
{
 // mySound.close();
   inputsound.close();
  minim.stop();
 
  super.stop();
}

