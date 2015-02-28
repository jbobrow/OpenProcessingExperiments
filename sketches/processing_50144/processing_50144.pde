
//Homework 3
//Tyler Porten (tporten) copyright 2012





float a, b;

void setup( )
{
  size( 800, 500 );
  textSize( 48 );
  textAlign( CENTER, CENTER );
  background( 255 );
  smooth( );
  noStroke( );
  a = 0;
  b = -42;
  rectMode( CENTER );
  
}

void draw( )
{
  //background( 0, 0, 255 );
  noStroke( );
  fill( random(mouseY), random(255), random(255) );
  //rect( 0, 0, width, height );
  //fill( 255, 0, 0 );
  //rect( a, 100, 54, 45);
  //a = a + 5;
  //text( frameRate, width/2, 200 );
  //text( frameCount, width/2, 300 );
  frameRate(100);
}
void mouseDragged()
  {
  
  stroke( 0, 255, 0);
  strokeWeight(30);
  //line (0, 0, mouseX, mouseY );
  stroke (random(mouseY, mouseY), random(255), random(255), 100 );
  //line( mouseX, mouseY, pmouseX, pmouseY );
  rect( mouseX, mouseY, random(0, 100), random(0, 100) );
  //quad( mouseX, mouseY, random(100, 200), random(100, 200), random(100, 200), random(100, 200), random(100, 200), random(100, 200) );
  //point(mouseX, mouseY);
  }
  
void mousePressed()
  {
  
  stroke( 0, 255, 0);
  strokeWeight(30);
  //line (0, 0, mouseX, mouseY );
  stroke (random(mouseY, mouseY), random(0, 255), random(255), 25 );
  //line( mouseX, mouseY, pmouseX, pmouseY );
  rect( mouseX, mouseY, random(0, 100), random(0, 100) );
  //quad( mouseX, mouseY, random(100, 200), random(100, 200), random(100, 200), random(100, 200), random(100, 200), random(100, 200) );
  //point(mouseX, mouseY);
  println(frameRate);
  }

