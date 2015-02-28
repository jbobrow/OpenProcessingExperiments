
import gifAnimation.*;

/**
* Trabalho 1:
* Tema: Halloween
* Autora: Mylla Chizu Sasaki
* Versão: 12/11/13
*/


PImage background;
PImage cat;
PImage grave;
Gif spook;
Gif bat;


void setup() 
{
  background = loadImage("background4.png");
  cat = loadImage("cat.gif");
  grave = loadImage("grave.gif");
  
  size(700,600); //size of the window, (width, height)
  frameRate(24); //frames per second
  smooth(); //improves the image quality
  
  spook = new Gif(this, "ghost.gif"); //creates a new object gif
  bat = new Gif(this, "bat.gif"); //same here

}
void draw() 
{
  //image(PIimage, x-coord, y-coord, width, height)
  image(background, 0, 0, 700, 600);
  image(cat, 33, 470, 30, 40); 
  image(grave, 250, 500, 100, 80);
  image(bat, mouseX, mouseY, 70, 70); //bat will "follow" cursor
  image(spook, 180, 430, 80, 80);

  noCursor();

  fill(255);
  ellipse(620, 60, 90, 90);

  bat.play();
  
  if(mousePressed) //spook will dance whenever mouse is pressed
  {
    spook.play();
  }
  else
  {
    spook.pause();
  }

}



