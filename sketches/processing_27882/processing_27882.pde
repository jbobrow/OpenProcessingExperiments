
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer song;
AudioPlayer song2;
int dia =10;

void setup(){
size (500,500);
background(0);
smooth();
minim= new Minim (this);
song2=minim.loadFile ("decreasing scale.mp3");
minim= new Minim (this);
song=minim.loadFile ("growing scale.mp3");
}
void draw(){
  background(0);
  noStroke();
  fill(255);
  if(mouseY>56){
    fill(255,252,196);
  }
  if (mouseY>90){
    fill(246,255,129);
  }
  if (mouseY>145){
    fill(252,245,8);
  }
  if (mouseY>250){
    fill(252,212,8);
  }
  if(mouseY>260){
    fill(252,175,8);
  }
  if(mouseY>300){
    fill(252,130,8);
  }
  if(mouseY>325){
    fill(252,102,8);
  }
  if(mouseY>350){
    fill(250,54,0);
  }
  if(mouseY>380){
    fill(250,54,0);
  }
  if(mouseY>430){
    fill(211,11,0);
  }
  ellipse(mouseX,mouseY,dia,dia);
  if(mousePressed == true){
    if(mouseButton == RIGHT){
    song.play();
      dia= dia+1;
      
      
    }
    else if (mouseButton == LEFT)
    {
      song2.play();
   
    
      dia = dia - 1;
     
     
      }
  }
}
   
  
    
   
   

void keyPressed(){
   if(key=='r'){
    song = null;
    setup();
 
  }
}


