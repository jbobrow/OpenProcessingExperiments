
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Template for iOS devices (javascript mode) and the accelerometer
//Here we'll be using Accelerometer.js for the accelerometers
//For iOS devices 

PFont arial;
boolean playit = false;

float pos_x = 10;
float pos_y = 10;
float pos_z = 10;
void setup ()
{
  size(640, 1136);

  arial = loadFont("arial.vlw");
  textFont(arial, 48);
}
void draw ()
{

  int r, g, b;
  r = (int) (pos_x + 10) * 10;
  g = (int) (pos_y + 10) * 10;
  b = (int) (pos_z + 10) * 10;
  background(r, g, b);


  // display the accelerometer values
  // on the screen using the text function
  fill(255);
  text(pos_x, 100, 100);
  text(pos_y, 100, 200);
  text(pos_z, 100, 300);
}

void setBallPos ( float posX, float posY, float posZ, int modechoice)
{
  pos_x = posX;
  pos_y = posY;
  pos_z = posZ;
  mode = modechoice;
}



