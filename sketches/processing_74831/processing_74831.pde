

  import ddf.minim.*;
  import ddf.minim.signals.*;
  import ddf.minim.analysis.*;
  import ddf.minim.effects.*;
  
PImage a;
PImage s;  
PImage d;
int i = 0; 
int j = 0;
 
void setup()
 
{
  size(800,400);
  
   d = loadImage("3.jpg"); 
   a = loadImage("2.jpg"); 
   s = loadImage("1.jpg");

  
  smooth();
  
}
 
void draw()
 {
   background(0);
  image (d,250,0);
   if(j == 0)
   {
    
    image(a,i,150);
    i+=5;
     
            if(i == 675)
             
            {
               
                Minim Soundwave;
                AudioPlayer My_Music_Player;
                Soundwave = new Minim(this);               
                My_Music_Player = Soundwave.loadFile("DOGSBARK.mp3");
                My_Music_Player.play();
                Soundwave.stop();
                j = 1;
                 
            }
     
  }
   
   
  else
   
  {
     image(s,i,150);
     
    i-=5;
     
            if(i == 25)
            {
               
                Minim Soundwave;
                AudioPlayer My_Music_Player;
                Soundwave = new Minim(this);               
                My_Music_Player = Soundwave.loadFile("CATMEOW.mp3");
                My_Music_Player.play();
                Soundwave.stop();
                j = 0;
               
            }
     
  }
   
} 

