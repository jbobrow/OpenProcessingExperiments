
int X = 25, Desplazamiento = 0;

void setup()

{
  
  size(800,400);
  smooth();
  frameRate(30);
  
  /////////////////////////////////////////////////////
  
  import ddf.minim.*;
  import ddf.minim.signals.*;
  import ddf.minim.analysis.*;
  import ddf.minim.effects.*;
  
  /////////////////////////////////////////////////////
  
}

void draw()

{
  background(0);
  
  if(Desplazamiento == 0)
  
  {
    
    fill(71, 23, 113);
    strokeWeight(10);
    stroke(random(255), random(255), random(255));
    ellipse(X, 200, 50, 50);
    X += 5;
    
            if(X == 775)
            
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
    fill(71, 23, 113);
    strokeWeight(10);
    stroke(random(255), random(255), random(255));
    ellipse(X, 200, 50, 50);
    X-=5;
    
            if(X == 25)
            
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
  
} //Cierra Draw

