

 import ddf.minim.*;
  import ddf.minim.signals.*;
  import ddf.minim.analysis.*;
  import ddf.minim.effects.*;
  
int x = 25, Desplazamiento = 0;

void setup()
  {
    size(800,400);
    smooth();
    frameRate(30);
  }

void draw()
  {
    background(0);
  
    if(Desplazamiento == 0)
      {
        fill(random(255), random(255), random(255));
        ellipse(x, 200, 50, 50);
        x += 5;
        
        if(x == 780)
          {
             Minim Soundwave;
             AudioPlayer My_Music_Player;
             Soundwave = new Minim(this);                
             My_Music_Player = Soundwave.loadFile("Dog.mp3");
             My_Music_Player.play();
             Soundwave.stop();
             Desplazamiento = 1;
           }
      }
    else
     {
        fill(random(255), random(255), random(255));
        ellipse(x, 200, 50, 50);
        x -= 5;
        
        if(x == 25)
          {
            Minim Soundwave;
            AudioPlayer My_Music_Player;
            Soundwave = new Minim(this);                
            My_Music_Player = Soundwave.loadFile("Cat.mp3");
            My_Music_Player.play();
            Soundwave.stop();
            Desplazamiento = 0;
          }
      }
   } 


