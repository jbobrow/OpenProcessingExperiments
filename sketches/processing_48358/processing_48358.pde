
//project 1
//paul bracchitta

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
BeatDetect beat;
//BeatListener bl;

float songPos;
float t = millis()/100;

void setup()
{
  size(512, 300, P3D);
  minim = new Minim(this);
  
  player = minim.loadFile("discovery - osaka loop line.mp3", 2048);
  
  player.play();
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(350);
  //bl = new BeatListener( beat, player);
  background(0, 10);
  fill(0, 200);
//  songPos = map(player.position(), 0, 240000, 0, width);
  
  
}

void draw()
{

 beats();
  
   timer();
  classicLine();
  
  changePos();
  
  
}



void timer()//------
{
   textSize(14);
  if( player.position() > 8206)
   {
   fill(255,0,0,10); 
   }
   else{
     fill(0);
   }
   text("" + int(player.position()/1000), width/2-5, 9.5*height/10);
}

void slider( )
{
  
  line(0, 9*height/10, width, 9*height/10);
  
  
  songPos = map(player.position(), 0, 240000, 0, width);
  stroke(0,10);
  
  rect(songPos, (9*height/10), 5, 1);
   if( player.position() > 8206)
   {
     stroke(255,10);
     
   }
   
 
}

void changePos()
{
  float pos = ((float) mouseX/width)*player.length();
  if(mousePressed && mouseX >= 0 && mouseX <= width
  && mouseY >= (9*height/10)-5 && mouseY <= (9*height/10)+5)
  {
    player.cue((int)pos);
  }
  
}

void beats()
{
    beat.detect(player.mix);
  
  if (player.position() >45406 && player.position () < 58000 ||  player.position() > 101000 && player.position () < 125000)
  {
    if ( beat.isSnare() ){
    
    stroke(random(10,255), random(10,250), random(10, 250));
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
    float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    line(x1, 150 + player.right.get(i)*100, x2, 150 + player.right.get(i+1)*200); 
    }
   }
  }
}
 
 
 void classicLine()
 {

    if( player.position() > 8206)
   {
     stroke(0,10);
     fill(255,10);
     rect( 0, 0, width, height);
   }
   
   else {
     stroke(255);
   }
   strokeWeight(2);
   
   for(int i = 0; i < player.bufferSize() - 1; i++)
  {
   float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    line(x1, 130 + player.right.get(i)*100, x2, 130 + player.right.get(i+1)*200); 
  }
  
  slider();
 }






void stop()
{

  player.close();

  minim.stop();
  
  super.stop();
}

