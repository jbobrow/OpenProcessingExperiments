
//ICE 10
//Copyright Miranda Jacoby 2014 All Rights Reserved
PImage pidgey;
//Image rotates on X axis

void setup()
{
  size (600, 600, P3D);
  imageMode(CENTER);
  pidgey = loadImage("Casey_Pidgey.png"); //("pidgey_Crystal");
}

void draw()
{
  background(0);
  translate(width/2, height/2, -200); 
  rotateX (radians(frameCount));
  image( pidgey, 0, 0 );
}


