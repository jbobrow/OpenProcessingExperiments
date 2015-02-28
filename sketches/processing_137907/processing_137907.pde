
/* In this sketch, I was inspired by the sunset.
I tried to make this look like a sunset in a more dynamic way.
At first I wanted it to look like a pine but I couldn't find a silhouette
of this tree with a licensed so that anyone is allowed to share, use and
modify. So I settled with a palm. */

import ddf.minim.*;


//declaring global variables
PImage flare;
PImage cubesflow;
PImage tree;

//audio
Minim minimw;
AudioPlayer wave;
Minim minimr;
AudioPlayer rain;
Minim minimf;
AudioPlayer fire;

// Declaring the palettes

color[] paletteh={#2C1F36, #502C3E, #9D0E30, #DB1032,#DD5F22,#CFE9FF, #89BAD9, #5693DD, #1B3FA1,#030D33, #DA2D39,#0E6AA4, #12B3D6,#F2B059,#D85035};

//transparency

  float alpha=30;
  
//setup()
void setup()
{ 
  frameRate(3);
  background(0);
  smooth();
size (800, 600);

//loading pictures
cubesflow= loadImage ("cubesflow.jpg");
tree = loadImage ("caribbean-152990_640.png");

//loading audio
minimw= new Minim (this);
wave= minimw.loadFile("ocean-wave-2.mp3");
minimf= new Minim (this);
fire = minimf.loadFile("fire-1.mp3");
minimr= new Minim (this);
rain= minimr.loadFile("rain-07.mp3");

}

//draw()

void draw()
{
 float X= map(mouseX, 0, width, 0, 255);
  float Y= map (mouseY, 0, height, 0, 255);
  float dist= map( mouseY, 0, height, 20, 100);
 image (cubesflow, 0,0, 800,600);
 
 
 for (int i=mouseX; i>0; i-=dist)
 { 
   
   noStroke();
 
  fill(paletteh[(int)random(15)], alpha);
  ellipse(mouseX, mouseY, i*1.8, i*1.8);
  
 }
 
 image (tree, 10, 213, 494, 390);
  
}



void keyReleased ()
{
switch (key)
{
 // audio

 //rain
case 'r':
 rain.play();
 break;
 
// stopping rain

case 'R':
minimr.stop();
break;
 
//wave 
 case 'w':
 wave.play();
 break;

//stopping wave sound 
  case'W':
minimw.stop();
  break;
 
 //fire
 case 'f':
 fire.play();
 break;
 
 // stopping fire
  case 'F':
 minimf.stop();
  break;

//screenshot
 case 's': 
 case 'S':
  saveFrame ("screenshot.png");
  break;

// making circles darker
case 'd': 
alpha+=20;
break;

//making circles lighter
case 'l':
alpha-=20;
break;
}

}


