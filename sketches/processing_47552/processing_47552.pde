
int a;
PImage nada;

import ddf.minim.*;
import ddf.minim.*;
 
Minim minim;
AudioSample cello1;
AudioSample violin1;

    
int nadax;
int naday;
int nadaselected;
    
int pageheight;
int pagewidth;
    

        
void setup()
{
  pageheight=700;
  pagewidth=700;
      
  size(700,700);
  frameRate(40);
     
background (0);
  nada= loadImage("nada.gif");
 nadax= pagewidth+300;
naday= pageheight-300;
nadaselected=0;

  
  minim = new Minim (this);
  cello1= minim.loadSample ("cello gaby.mp3",2048);
  
  minim = new Minim (this);
  violin1= minim.loadSample ("vivaldi gaby (forever).mp3",2048);
}
    
void mousePressed() {
 if (nadaselected==1) {
  nadaselected=0;
 }
 else if (mouseX >= nadax & mouseX <= nadax + 146 & mouseY >= naday & mouseY <=naday+84)
  {nadaselected=0;
  }
}
      
void draw()
    {
  background (0);

    
  a = (a + 1)%(width+32);
  stroke(226, 204, 0);
     
  if (nadaselected ==1) {
  nadax=mouseX;naday=mouseY;
  }
 
  
  image (nada, nadax, naday);

 }

void keyPressed()
{
  if ( key == 'c' ) cello1.trigger();
  if( key == 'v' ) violin1.trigger();
}

 
void stop()
{
  // always close Minim audio classes when you are done with them
 cello1.close();
 violin1.close ();
 minim.stop();
   
  super.stop();
}

