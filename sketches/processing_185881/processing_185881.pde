
/* @pjs preload="bg.png,john_plane.gif"; */

// DEPENDENCIES
import gifAnimation.*;


//background
PImage bg;
PImage bg2;
//character sprites
Gif plane;

//item to drop

//droppable item sprites 
PImage cashRegister; 
PImage moneyRoll; 

//movement control booleans
boolean wPressed, sPressed; //WASD


int charX = 400;
int charY = 160;
int bgX = 0;
int bgX2 = 1200; 

void setup()
{
  size(1200,600);
  frameRate(60);
  loadImages();
  plane.play();
}

void draw()
{
  image(bg, bgX, -350);
  image(bg2, bgX2, -350);
  bgX -= 5;
  bgX2 -= 5;
  if(bgX < -1919){
    bgX = 1200;
  }
  if(bgX2 < -1919){
    bgX2 = 1200;
  }
  //user input parsing for character movement 
  if (wPressed && (charY > 0)){
   rotate(-0.05); 
   charY -= 10; 
  }
  if (sPressed && (charY + 150 < height)){
   rotate(0.05); 
   charY += 10;
  }
  image(plane, 10,charY, plane.width/1.5, plane.height/1.5);
  //image(plane, 10,charY);
}

void keyPressed()
{
  if (key == 'w' || key == 'W' || keyCode == UP)
  {
    wPressed = true;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN)
  {
    sPressed = true;
  }
}


void keyReleased()
{

  if (key == 'w' || key == 'W' || keyCode == UP)
  {
    wPressed = false;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN)
  {
    sPressed = false;
  }
}

void loadImages()
{
  bg = loadImage("images/bg.png");
  bg2 = loadImage("images/bg.png");
  plane = new Gif(this, "images/john_plane.gif");
}

