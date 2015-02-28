
// Homework 3
// copyright John Mailley September 2011 Pittsburgh, PA 15289


color col;

PFont font;

  

void setup( )
{
  size( 600, 400);
  background(0, 0, 0);
  smooth();
  noCursor();
//  col = color( random( 256), random( 256), random(256), 200);
  noStroke();
  frameRate(90);
  fill( 9, 79, 90);


}

void draw( )
{
//Background
  background(0, 0, 0);
  fill(83, 114, 234, 90);
  rect( 0, 325, 600, 75);
  fill(255, 255, 255);
  ellipse( 25, 35, 1, 1);
  ellipse( 187.5, 25, 2, 2);
  ellipse( 450, 100, 1.5, 1.5);
  ellipse( 250, 170, 1, 1);
  ellipse( 325, 85, 1, 1);
  ellipse( 100, 150, 1, 1);
  ellipse( 500, 40, 1, 1);
  fill( 216, 200, 44);
  ellipse( 150, 75, 50, 50);
  fill( 0, 0, 0);
  ellipse( 160, 70, 50, 50);

//Instructions
  fill( 216, 200, 44);
  text("PRESS ANY KEY", 470, 25);

//House
  fill( 83, 114, 234, 50);
  rect( 400, 225, 150, 100);
  strokeWeight(1);
  stroke( 0, 0, 0);
  triangle( 390, 225, 475, 175, 560, 225);
  noStroke();
  stroke(41.5, 57, 117, 25);
  fill( 245, 230, 99, 110);
  rect( 425, 250, 15, 22.5);
  rect( 515, 250, 15, 22.5);
  fill( 83, 114, 234, 15);
  stroke(0, 0, 0);
  strokeWeight(1);
  rect( 470, 300, 10, 24);
  noStroke();

//UFO
  fill( 63, 135, 209, 80);
  ellipse( mouseX, mouseY - 5.25, 22.5, 18.75);
  fill(77, 77, 77);
  ellipse( mouseX, mouseY, 56.25, 11.25);
  fill( 250, 217, 30);
  ellipse( mouseX + 15, mouseY + .75, 3.75, 3.75);
  ellipse( mouseX, mouseY + .75, 3.75, 3.75);
  ellipse( mouseX - 15, mouseY + .75, 3.75, 3.75);
  
  if(keyPressed)
  {fill( 118, 255, 0, 70);
   triangle( mouseX, mouseY + 6, mouseX + 20, mouseY + 225, mouseX - 20, mouseY + 225);
  }
}

void mouseMoved() 
{
  col = color( random( 256), random( 256), random(256), 200);
  fill(col);
  ellipse( mouseX, mouseY + 20, random(17.5), random (17.5));
}


