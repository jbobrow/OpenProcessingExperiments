

  import ddf.minim.*;
  import ddf.minim.signals.*;
  import ddf.minim.analysis.*;
  import ddf.minim.effects.*;
  
int i = 25; 
int Salto = 0;

 
void setup()
{
  size(800,400);
  smooth();
  fill(71, 23, 113);
  
}
 
   void draw()
 {

  background(#EDD3EC);
  if(Salto == 0)
  {
    ellipse(i, 200, 50, 50);
    i += 5;
     
            if(i == 775)
            {
               Minim Soundwave;
               AudioPlayer My_Music_Player;
               Soundwave = new Minim(this);               
               My_Music_Player = Soundwave.loadFile("DOG.mp3");
               My_Music_Player.play();
               Soundwave.stop();
               Salto = 1;
                 
            }
     
  }
  else
  {
    fill(random(255), random(255), random(255));
    ellipse(i, 200, 50, 50);
    i-=5;
     
            if(i == 25)
            {
               
                Minim Soundwave;
                AudioPlayer My_Music_Player;
                Soundwave = new Minim(this);               
                My_Music_Player = Soundwave.loadFile("CAT.mp3");
                My_Music_Player.play();
                Soundwave.stop();
                Salto = 0;
               
            }
     
  }
   
} 

