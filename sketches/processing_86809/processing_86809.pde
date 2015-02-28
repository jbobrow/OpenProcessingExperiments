
//Homework 3 (version 2)
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)

//variable
float x, y, wd, ht;

void setup ( )
{
  size (400, 400);
  x = 1;
  y = height * .5;
  wd = width * 20;
  ht = height * 20;

  frameRate (20);
  background (0);
  smooth ( );
}

void draw ( )
{
  fill (0, 2);
  rect (0, 0, width, height);
  noStroke ( );
  
  fill (random(255), random(30), random (40), 150);
  ellipse (mouseX, mouseY, (mouseX - pmouseX), (mouseY - pmouseY));
 
}

//if (keyPressed)saveFrame("hw3.jpg");

