
//The Anywhere Piano Keyboard Project by Jillian Wu.
//Program can be run on a computer key board or use of Makey Makey.
//Download of Notes A-G flat from freesound.com and renaming of notes to names mentioned in code are necessary for program to run

import ddf.minim.*;
Minim minim;
AudioPlayer song;
void setup()
{
  minim = new Minim(this);
}

void draw()
{
}

void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    song = minim.loadFile("A.wav");
    song.play();
    println("a");
  }
  
  if (key == 'w' || key == 'W')
  {
    song = minim.loadFile("B_Flat.wav");
    song.play();
  }
  
  if (key == 's' || key == 'S')
  {
    song = minim.loadFile("B.wav");
    song.play();
  }
  
  if (key == 'd' || key == 'D')
  {
    song = minim.loadFile("C.wav");
    song.play();
  }
  
  if (key == ' ')
  {
    song = minim.loadFile("C_Sharp.wav");
    song.play();
  }
  
  if (key == 'f' || key == 'F')
  {
    song = minim.loadFile("D.wav");
    song.play();
  }
  
  if (key == 'g' || key == 'G')
  {
    song = minim.loadFile("E_Flat.wav");
    song.play();
  }
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      song = minim.loadFile("E.wav");
      song.play();
    }
    
    if (keyCode == UP)
    {
      song = minim.loadFile("F_Sharp.wav");
      song.play();
    }
    
    if (keyCode == DOWN)
    {
      song = minim.loadFile("F.wav");
      song.play();
    }
    
    if (keyCode == RIGHT)
    {
      song = minim.loadFile("G_Sharp.wav");
      song.play();
    }  
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    song = minim.loadFile("G.wav");
    song.play();
  }
}
