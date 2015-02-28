
// copyright 2014 Hyun Doug Kim
// Final project #2

//press "b" for black tea, "g" for green tea, 
//"s" for strawberry flavour, "l" for lychee flavor,
//" " to return to empty the cup.

//(if you want to hear the pouring sound, turn up the volume)


// if you want to add bubbles, press the mouse
// you want to add the bubbles later


// enjoy your bubble tea!

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;

PImage pic;
PImage background;
float x, y;
AudioPlayer pour;

void setup ()
{
  size (600, 700);
  background(255, 172, 46);
  pic = loadImage("straw.jpg");
  background = loadImage("strawbk.jpg");
  x= 100;
  y= 100;
  image(background, 0, 0, 600, 700);
  image(pic, 150, 160, 180, 400);
  
  minim = new Minim(this);
  pour = minim.loadFile("pour.mp3");
}

void draw()
{
  noFill();
  strokeWeight (4);
  line(x*1.6, y*2.5, x*2, y*5.5);
  strokeWeight (4);
  line(x*2, y*5.5, x*4, y*5.5);
  strokeWeight (4);
  line(x*4.4, y*2.5, x*4, y*5.5);
}

void keyPressed()
{
  if (key == 'b')//black tea base
  {
    fill (209, 170, 112);
  }
  else if (key == 'g')// green tea base
  {
    fill (184, 203, 150); 
  }
  else if (key == 'l')
  {
    fill (242, 227, 231); // lychee flavour
  }
  else if (key == 's')
  {
    fill (242, 122, 152); // strawberry flavour
  }
  else if (key == ' ')
  {
    fill (255, 172, 46); // empty the cup
  }
      noStroke();
      quad(x*1.7, y*2.9, x*2.05, y*5.45, x*3.95, y*5.45, x*4.3, y*2.9);
      image(pic, 150, 160, 180, 400);
      pour.play();
      pour= minim.loadFile("pour.mp3");
}

void mouseClicked()
{
  showBubble();
}

void showBubble()
{
  fill (95, 83, 64);
  noStroke();
  ellipse(250, 470, 50, 48);
  ellipse(378, 500, 45, 46);
  ellipse(330, 520, 48, 48);
  ellipse(310, 460, 47, 47);
  fill (116, 101, 88);
  noStroke();
  ellipse(300, 510, 47, 47);
  ellipse(340, 480, 48, 48);
  ellipse(230, 510, 50, 50);
  ellipse(370, 520, 50, 50);
  fill(103, 93, 83);
  noStroke();
  ellipse(215, 435, 50, 50);
  ellipse(270, 515, 47, 48);
  ellipse(370, 450, 50, 50);
  ellipse(280, 430, 47, 46);
}




