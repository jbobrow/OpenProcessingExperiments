
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
int spazio = 50;
int value;

void setup()
{
 size(750,400);
 minim = new Minim(this); 
}

void draw()
{
 background(0);
 stroke(0);
 for (int x = 0; x <= width; x = x + spazio )
 {
   fill(255);
   rect(x - 50,0,x,height);
  }
fill(0);
rect(35, 0, 30, 250);
rect(85, 0, 30, 250);
rect(185, 0, 30, 250);
rect(235, 0, 30, 250);
rect(285, 0, 30, 250);
rect(385, 0, 30, 250);
rect(435, 0, 30, 250);
rect(535, 0, 30, 250);
rect(585, 0, 30, 250);
rect(635, 0, 30, 250);
}

void keyPressed()
{
  if (key == 'q')
  {
    song = minim.loadFile("C3.wav");
    song.play();
  }
  
  if (key == 'w')
  {
    song = minim.loadFile("Csharp4.wav");
    song.play();
  }
  
  if (key == 'e')
  {
    song = minim.loadFile("D4.wav");
    song.play();
  }
  
  if (key == 'r')
  {
    song = minim.loadFile("Dsharp4.wav");
    song.play();
  }
  
  if (key == 't')
  {
    song = minim.loadFile("E4.wav");
    song.play();
  }
  
  if (key == 'y')
  {
    song = minim.loadFile("F4.wav");
    song.play();
  }
  
  if (key == 'a')
  {
    song = minim.loadFile("Fsharp4.wav");
    song.play();
  }
  
  if (key == 's')
  {
    song = minim.loadFile("G4.wav");
    song.play();
  }
  
  if (key == 'd')
  {
    song = minim.loadFile("Gsharp4.wav");
    song.play();
  }
   
   if (key == 'f')
  {
    song = minim.loadFile("A4.wav");
    song.play();
  }
  
   if (key == 'g')
  {
    song = minim.loadFile("Asharp4.wav");
    song.play();
  }
  
   if (key == 'h')
  {
    song = minim.loadFile("B4.wav");
    song.play();
  }
  
  //To raise an octave, press the caps lock//
  
  if (key == 'Q')
  {
    song = minim.loadFile("C4.wav");
    song.play();
  }
  
  if (key == 'W')
  {
    song = minim.loadFile("Csharp4.wav");
    song.play();
  }
  
  if (key == 'E')
  {
    song = minim.loadFile("D5.wav");
    song.play();
  }
  
  if (key == 'R')
  {
    song = minim.loadFile("Dsharp5.wav");
    song.play();
  }
  
  if (key == 'T')
  {
    song = minim.loadFile("E5.wav");
    song.play();
  }
  
  if (key == 'Y')
  {
    song = minim.loadFile("F5.wav");
    song.play();
  }
  
  if (key == 'A')
  {
    song = minim.loadFile("Fsharp5.wav");
    song.play();
  }
  
  if (key == 'S')
  {
    song = minim.loadFile("G5.wav");
    song.play();
  }
  
  if (key == 'D')
  {
    song = minim.loadFile("Gsharp5.wav");
    song.play();
  }
   
   if (key == 'F')
  {
    song = minim.loadFile("A5.wav");
    song.play();
  }
  
   if (key == 'G')
  {
    song = minim.loadFile("Asharp5.wav");
    song.play();
  }
  
   if (key == 'H')
  {
    song = minim.loadFile("B5.wav");
    song.play();
  }
  
  if (key == 'J')
  {
    song = minim.loadFile("C6.wav");
    song.play();
  }
}


  

