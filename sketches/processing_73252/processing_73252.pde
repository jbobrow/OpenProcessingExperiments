
PFont Bradley;

int x=0, y=0, x1=0, y1=0, x2=0, y2=0, x3=0, y3=0, x4=0, y4=0, x5=0, y5=0, x6=0, y6=0;

char[] Rodrigo = {'R', 'o', 'd', 'r', 'i', 'g', 'o'};

void setup()

{
  
size(800,400);
frameRate(100);
smooth();

Bradley = loadFont("BradleyHandITC-48.vlw");

////////////////////////////////////////////////////////////////////////////////////////

//Introducing MINIM Audio Library

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim Soundwave;
 
AudioPlayer My_Music_Player;
 
Soundwave = new Minim(this);
 
My_Music_Player = Soundwave.loadFile("Chocolate.mp3");
 
My_Music_Player.play();
 
Soundwave.stop();

//Closes Introducing MINIM Audio Library

////////////////////////////////////////////////////////////////////////////////////////

}

void draw()

{

background(0);
textFont(Bradley, 86);
  
//R

fill(random(255), random(255), random(255));

if( (x != 200) && (y != 200) )

{
  x = int(random(799));
  y = int(random(399));
  
  text (Rodrigo[0], x, y);
}

else

{
  text(Rodrigo[0], 255, 200);
}

//o

fill(random(255), random(255), random(255));
 
if( (x1 != 200) && (y1 != 200) )

{
  x1 = int(random(799));
  y1 = int(random(399));
  
  text (Rodrigo[1], x1, y1);
}

else

{
  text(Rodrigo[1], 325, 200);
}

//d

fill(random(255), random(255), random(255));
 
if( (x2 != 200) && (y2 != 200) )

{
  x2 = int(random(799));
  y2 = int(random(399));
  
  text (Rodrigo[2], x2, y2);
}

else

{
  text(Rodrigo[2], 360, 200);
}

//r

fill(random(255), random(255), random(255));
 
if( (x3 != 200) && (y3 != 200) )

{
  x3 = int(random(799));
  y3 = int(random(399));
  
  text (Rodrigo[3], x3, y3);
}

else

{
  text(Rodrigo[3], 410, 200);
}

//i

fill(random(255), random(255), random(255));
 
if( (x4 != 200) && (y4 != 200) )

{
  x4 = int(random(799));
  y4 = int(random(399));
  
  text (Rodrigo[4], x4, y4);
}

else

{
  text(Rodrigo[4], 450, 200);
}

//g

fill(random(255), random(255), random(255));
 
if( (x5 != 200) && (y5 != 200) )

{
  x5 = int(random(799));
  y5 = int(random(399));
  
  text (Rodrigo[5], x5, y5);
}

else

{
  text(Rodrigo[5], 480, 200);
}

//o

fill(random(255), random(255), random(255));
 
if( (x6 != 200) && (y6 != 200) )

{
  x6 = int(random(799));
  y6 = int(random(399));
  
  text (Rodrigo[6], x6, y6);
}

else

{
  text(Rodrigo[6], 530, 200);
}


} // Cierra Draw



