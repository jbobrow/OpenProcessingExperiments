
// *TJ Bel* December 15,2013


import ddf.minim.*;

// PImage variable type
PImage fractal;

//Global variables
Minim minim;
AudioPlayer audio;
 
void setup( )
{
  size(800, 600);
  fractal = loadImage("project3art.jpg");
  minim = new Minim(this);
  audio = minim.loadFile("Audio3.mp3");
  audio.loop();
}
  
void draw( )
{
  image(fractal, 0, 0, 800, 600);
  // sound wave parameters
  stroke(255);
  strokeWeight(3);
  noFill();
  //sound wave input from audio file
  for(int i = 0; i < audio.bufferSize() - 1; i++)
  {
    line(i, 50 + audio.left.get(i)*180, i+1, 50 + audio.left.get(i+1)*180);
    line(i, 500 + audio.right.get(i)*50, i+1, 500 + audio.right.get(i+1)*350);
  }
  
  // draw random ellipses 
  fill( random(255), random(0),random(0));
  ellipse( mouseX, mouseY, 275, 275 );
  fill( random(255), random(0), random(150,255) );
  ellipse( mouseX + random(300), mouseY + random(100), random(30,80), random(30,80) );
  fill( random(255), random(0), random(150,255) );
  ellipse( mouseX - random(300), mouseY - random(100), random(30,80), random(30,80) );
  fill( random(255), random(0), random(255) );
  ellipse( mouseX + random(500), mouseY - random(300), random(20,60), random(20,60) );
  fill( random(255), random(0), random(255) );
  ellipse( mouseX - random(500), mouseY + random(300), random(20,60), random(20,60) );
}


