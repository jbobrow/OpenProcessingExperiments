
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound;


void setup(){
  size(400,400);
  minim = new Minim(this);
mySound = minim.loadFile("Starálfur.mp3");   //  load your sound into Minum
  mySound.play();  
background(1);  
smooth();
}



void draw()
{
  fill(1,20);
rect(0,0,width,height);

for(int i = 0; i <  mySound.bufferSize() - 1; i++)  
 {
noFill();
 stroke(254,255,0,60);
ellipse(200,200, 160 +  mySound.mix.get(i)*150, 160 +  mySound.mix.get(i+1)*150);
  fill(255,0,166,60);

ellipse(200,200,120 +  mySound.left.get(i)*150,120 +  mySound.left.get(i+1)*150);

fill(24,0,255,60);
ellipse(200,200,200+mySound.right.get(i)*150, 200 +  mySound.right.get(i+1)*150);
noFill();
 stroke(254,255,0,60);
ellipse(200,200, 160 +  mySound.mix.get(i)*150, 160 +  mySound.mix.get(i+1)*150);
  fill(255,0,166,60);

ellipse(200,100,120 +  mySound.left.get(i)*150,120 +  mySound.left.get(i+1)*150);

fill(24,0,255,60);
ellipse(200,100,200+mySound.right.get(i)*150, 200 +  mySound.right.get(i+1)*150);
noFill();
 stroke(254,255,0,60);
ellipse(200,300, 160 +  mySound.mix.get(i)*150, 160 +  mySound.mix.get(i+1)*150);
  fill(255,0,166,60);

ellipse(200,300,120 +  mySound.left.get(i)*150,120 +  mySound.left.get(i+1)*150);

fill(24,0,255,60);
ellipse(200,300,200+mySound.right.get(i)*150, 200 +  mySound.right.get(i+1)*150);


 }
}

// here we provide a way to mute out
void keyPressed()
{
  if ( key == 'm' )
  {
    if (  mySound.isMuted() )
    {
       mySound.unmute();
    }
    else
    {
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


