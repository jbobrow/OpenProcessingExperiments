
//By Ellen Wang
/*
press q,w,e,r,t,y to play a sound loop
press a,s,d,f,g,h to pause the loop
q->a,w->s and so on

*for some reason this does not seem to load on open processing
even though I made sure the file sizes aren't too large and I've included them

*/

import ddf.minim.*;
 
Minim minim;
AudioPlayer bass,bass2,bass3,drum,guitar,guitar2;
 
float value,mode;

 
 
void setup()
{
  size(100, 100);
 
  minim = new Minim(this);
 
  bass = minim.loadFile("bass.mp3");
  bass2 = minim.loadFile("bass2.mp3");
  bass3 = minim.loadFile("bass3.mp3");
  drum = minim.loadFile("drum.mp3");
  guitar = minim.loadFile("guitar.mp3");
  guitar2 = minim.loadFile("guitar2.mp3");
  
}
 
void draw(){
  background(0);

  if(keyPressed) {
    
    if (key == 'q' || key == 'Q') {
    bass.play();
    text("bass", 5, 15);
    bass.loop();   
    }
  
  
   if (key == 'w' || key == 'W') {
    bass2.play();
    text("bass", 5, 15);
    bass2.loop();   
    }
  
  
   if (key == 'e' || key == 'E') {
    bass3.play();
    text("bass", 5, 15);
    bass3.loop();   
    }
    
    
    if (key == 'r' || key == 'R') {
    drum.play();
    text("DRUM", 5, 15);
    drum.loop();   
    }
    
    
    if (key == 't' || key == 'T') {
    guitar.play();
    text("guitar", 5, 15);
    guitar.loop();   
    }
    
    
    if (key == 'y' || key == 'Y') {
    guitar2.play();
    text("guitar", 5, 15);
    guitar2.loop();   
    }
    
    
    
    
    if (key == 'a' || key == 'A') {
    bass.pause();
    }
    
    if (key == 's' || key == 'S') {
    bass2.pause();
    }
    
    if (key == 'd' || key == 'D') {
    bass3.pause();
    }
    
    if (key == 'f' || key == 'F') {
    drum.pause();
    }
    
    if (key == 'g' || key == 'G') {
    guitar.pause();
    }
    
    if (key == 'h' || key == 'H') {
    guitar2.pause();
    }
    
   
    
  }
}

 
 

void stop()
{
  bass.close();
  bass2.close();
  bass3.close();
  drum.close();
  guitar.close();
  guitar2.close();
  minim.stop();
 
  super.stop();
}
  



 
 
 



/*
void keyPressed(){
  mode = keyCode;
  println(mode);
}
*/



