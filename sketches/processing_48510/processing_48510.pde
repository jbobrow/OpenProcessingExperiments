
//project 1
//paul bracchitta

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
BeatDetect beat;
//BeatListener bl;


float songPos, pos;
float t = millis()/100;
PImage ghost;
float fadeWidth, fadeHeight, col;


void setup()
{
  size(512, 300, P3D);
  minim = new Minim(this);
  
  
  player = minim.loadFile("Sean Hayes - Powerful Stuff.mp3", 2048);
  
  player.play();
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(330);
  //bl = new BeatListener( beat, player);
  background(0, 10);
  fill(0, 200);
//  songPos = map(player.position(), 0, 240000, 0, width);
  ghost = get( 0, 0, width, height);
  fadeWidth = width * 0.997;
  fadeHeight = height * 0.997;
  col = 0;
  
}

void draw()
{
 if (key == '1')
{
 smoke();
 slider();
} else if(key =='2')
{
  bars(); 
} else if(key =='3')
{
  electric();
  strokeWeight(1);
 slider(); 
}else{
  classic();
}
 //beats();
  
  // timer();
 // smoke();
 //bars();
 //classic();
  
  changePos();
 // slider();
  
  
}

//void radar()--------------------couldnt get this to work
//{
//  noStroke();
//  fill(0);
//  rect(0,0, width, height);
//  
//  for(int i = 0; i < player.bufferSize() - 1; i++)
//  {
//  //pos = map(i, 0, player.bufferSize(), -360, 360);
//  float x1 = map(i, 0, player.bufferSize(), 0, width);
//    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
//    noFill();
//   stroke(255);
//      rect(x1, height/2, player.right.get(i)*50, height/2 + player.right.get(i+1)*100);
//      //rect(
//     
//  }
//  
//}


void electric()
{
  noStroke();
  fill(0);
  rect(0,0, width, height);
  
  strokeWeight(10);
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
   float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    stroke(abs(player.right.get(i)*780), abs(i/16), 0);
    point( i/4, height/2 + player.right.get(i)*140);
  }
  
}
  
  

void classic()
{
  noStroke();
  fill(0);
  rect(0,0, width, height);
  stroke(0, 255, 50);
  strokeWeight(1);
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
   float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    line(x1, 130 + player.right.get(i)*100, x2, 130 + player.right.get(i+1)*100);
   line(x1, 130 + player.left.get(i)*100, x2, 130 + player.left.get(i+1)*100); 
  }
  slider();
}


void bars()
 {
   noStroke();
   fill(0);
   rect(0,0, width, height);
   stroke(255);
   strokeWeight(10);
   tint(255, 255, 255, 254.9);
  image(ghost, 0,0, fadeWidth, fadeHeight);
  noTint();
  
  colorMode(HSB);
  stroke(col, 255, 255);
  colorMode(RGB);
  
   for(int i = 0; i < player.bufferSize() - 1; i++)
  {
   
    line( i/4, height, i/4, height - player.right.get(i)*210 );
  }
  ghost = get( 0, 0, width, height);
  col += 1;
  if (col >255)
  {
    col = 0;
  }
   
 }



void timer()//------
{
   textSize(14);
   fill(255,0,0); 
   
   
   text("" + int(player.position()/1000), 5, 9.7*height/10);
}

void slider( )
{
  
  stroke(255);
  line(0, 9*height/10, width, 9*height/10);
  fill(0);
  songPos = map(player.position(), 0, 240000, 0, width);
  rect(songPos, (9*height/10), 5, 3);
  
  timer();
   
     
     
   
   
 
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
  
  
    if( beat.isSnare())
   { 
    
    stroke(random(10,255), random(10,250), random(10, 250));
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
    float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    line(x1, 150 + player.right.get(i)*100, x2, 150 + player.right.get(i+1)*200); 
    }
   }
}
  

 
 
 void smoke()
 {

 
     stroke(0,10);
     fill(255,10);
     rect( 0, 0, width, height);
   
   
  
   strokeWeight(2);
   
   for(int i = 0; i < player.bufferSize() - 1; i++)
  {
   float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    line(x1, 130 + player.right.get(i)*90, x2, 130 + player.right.get(i+1)*170); 
  }
  beats();
  //slider();
 }
 
 






void stop()
{

  player.close();

  minim.stop();
  
  super.stop();
}

