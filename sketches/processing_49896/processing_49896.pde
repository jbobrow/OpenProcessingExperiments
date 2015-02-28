
//Homework 2
//Vishal Agrawal
//vishala@andrew.cmu.edu
//Copyright 2012

void setup()
{
  //seting the size of the graphics window
  size( 500, 500 );

  //setting the background of the window to black
  background( #F75F00 ); 

  //smooths out the roughness of curved and slanted lines
  smooth( );
  
  frameRate(2);
  
  print("initials: VA");
}

void draw()
{
  //variables to store the values
  float x = width/2;
  float y = height/2;
  float dia = width/2;

  //set stroke weight
  strokeWeight(10);
  stroke(random(0,255), random(0,255), random(0,255));
  
  //draw circle
  ellipse(x, y, dia, dia);
  fill(#F7D9C8);
  
  beginShape();
  vertex(x-(dia/2), y);
  vertex(x-(dia/2), y);
  vertex(x, y+(dia/2));
  vertex(x, y+(dia/2));
  endShape();
  
  beginShape();
  vertex(x, y+(dia/2));
  vertex(x, y+(dia/2));
  vertex(x, y-(dia/2));
  vertex(x, y-(dia/2));
  endShape();
  
  beginShape();
  vertex(x, y-(dia/2));
  vertex(x, y-(dia/2));
  vertex(x+(dia/2), y);
  vertex(x+(dia/2), y);
  endShape();
  
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x+(dia/3), y-(dia/6));
  curveVertex(x+(dia/3), y-(dia/6));
  endShape();
  
  saveFrame("hw2.jpg");
}

                                                
