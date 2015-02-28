
import ddf.minim.*;
import ddf.minim.signals.*;
PImage img;

Minim minim;         
AudioPlayer mySound;    // create an output object



//******************************//


void setup(){
  size(400,400);
  img = loadImage("notorious.jpg");
  background(img);
  minim = new Minim(this);
  mySound = minim.loadFile("theme.mp3");   //  load your sound into Minum
  mySound.play();
}



void draw()
{
  loadPixels();
  //background(0); //animating, so we need a background
  
  //bufferSize = the number of samples we're displaying at once
  for(int i = 0; i < mySound.bufferSize() - 1; i+=20)  
  {
    stroke(214,72,36,50);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    line(i, 150 + mySound.left.get(i)*200, i+1, 150 + mySound.left.get(i+1)*200);
  }
  for(int i = 5; i < mySound.bufferSize() - 1; i+=20)
  {
    stroke(0,150,0,50);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    line(i, 150 + mySound.right.get(i)*200, i+1, 150 + mySound.right.get(i+1)*200);
}
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  
    {
    stroke(251,251,251,5);
    //pull the samples from the mix channel, multiply by 50 to make them visible
    line(i, 150 + mySound.left.get(i)*200, i+1, 150 + mySound.left.get(i+1)*200);
  }
  /*for(int i = 0; i < width; i+=20){
    noFill();
    stroke(214,72,36,5);
    ellipse(i,350,mySound.left.get(i+1)*50,mySound.left.get(i+1)*20);
}*/
}
// here we provide a way to mute out
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( mySound.isMuted() )
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


