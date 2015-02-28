
// Oliver Haimson alhaimso
// Homework 3
// Copyright 2012

// map image and image code from Ben Fry, 
// Visualizing Data, Chapter 3, copyright 2008

// INSTRUCTIONS:
//
// Use this interactive U.S. map to map out your travels!
//
// Click anywhere on the map to add a dot for your first location.
// Click anywhere else on the map to add a second dot for your second location,
// which is connected by a line to your first location.
// Keep clicking to add as many locations as you'd like.
//
// Press the spacebar to make future dots a random color.
// Press the spacebar again to make future dots white.
// Press any other key to erase your map and start over.


float x, y, x1, y1, wd, ht, s; 
boolean firstClick;
boolean randomFill;
PImage mapImage;

void setup()
{
  size(640,400);
  smooth();
  
  //background map
  mapImage = loadImage("map.png");
  image(mapImage, 0, 0);
  
  x = 100;
  y = 100;
  x1 = 100;
  y1 = 100;
  wd = 10;
  ht = 10;
  firstClick = true;
  randomFill = false;
}

void draw()
{
// nothing in the draw function because nothing is drawn unless the mouse is pressed
}  

void keyPressed()
{
  // if the space bar is pressed, the circles will be filled with random colors
  // if the space bar is pressed again, circles go back to white
  if (key == ' ') 
    {randomFill=!randomFill;}
    
  // if any other key is pressed, the map is cleared
  else setup();
}

void mousePressed()
{
  // deal with issue of no line to first dot
  if (firstClick) 
  {
     x = mouseX;
     y = mouseY;
     firstClick = false;
  }
  // connect each dot to the previous dot
  else
  {
    line(x,y, mouseX, mouseY);
    x = mouseX;
    y = mouseY;
  }
  // draw circle
  if (randomFill==true)
    {fill(random(255),random(255),random(255));}
  else {fill(255);}
  ellipse(mouseX,mouseY,wd,ht);
}



