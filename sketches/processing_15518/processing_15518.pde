
import gifAnimation.*;
Gif myAnimation;
Gif myAnimation2;
Gif myAnimation3;


import ddf.minim.*; 
Minim bob; 
AudioPlayer sue; 
AudioPlayer sue2;
AudioPlayer sue3;
int n=0;

void setup (){
size (333,500);
bob = new Minim(this); 
sue = bob.loadFile("Bird.mp3"); 
sue2 = bob.loadFile("Rain.mp3"); 
sue3 = bob.loadFile("Jingle.mp3"); 

myAnimation = new Gif(this, "rain.gif");
myAnimation.loop();
myAnimation2 = new Gif(this, "sunny.gif");
myAnimation2.loop();
myAnimation3 = new Gif(this, "snow.gif");
myAnimation3.loop();
  
}

void draw(){

  if (n%3 ==0)
    {
      image(myAnimation2,0,0);
      sue.play();
      sue3.pause();
    }
   
   if (n%3 == 1)
    {
      image(myAnimation,0,0);
      sue2.play();
      sue.pause();
    }
    
    if (n%3 == 2)
    {
      image(myAnimation3,0,0);
      sue3.play();
      sue2.pause();
    }


}

void mousePressed()
  {
    if (mousePressed==true)
      {
        ++n;
       }
  }
  
  
  


