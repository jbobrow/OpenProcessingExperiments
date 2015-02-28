
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
boolean playSound = true;
 
void setup()
{
  size(200, 200);
 
  minim = new Minim(this);
  song = minim.loadFile("water.wav");
}

 int watervalue = 190;

void draw(){
  
    background (225,225,225);  
   fill(0,100,225);
  int water = (watervalue);
  rect(0,watervalue,width,height); 
    }
    
 void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && watervalue!=10) {
      watervalue = watervalue -10 ;
    } else if (keyCode == DOWN && watervalue!=190) {
      watervalue = watervalue+10;
    } 
  }
  if (mouseY>=watervalue && playSound==true && song.isPlaying()==false) {
     playSound =false;
     song.rewind();
     song.play();
   } 
   
   if (song.isPlaying() == false && mouseY>watervalue) {
     playSound=true;
     
   }
 }

