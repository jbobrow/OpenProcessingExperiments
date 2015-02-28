
//HW 5 Cristina Shin cshin1 Copyright 1/31/2013 cshin1@andrew.cmu.edu
//Press a and s for the eyes to blink
//Click the mouse anywhere to move the fish and change its size.

float x1, y1, wd, ht;

void setup ( )
{
  size( 400, 400 );
  wd = 150;
  ht = 150;
  

}

void draw ( )
{
  x1= mouseX;
  y1= mouseY;
  
  smooth( );
  
  water( );
  ears( );
  body( );
  eyes( );
  mouth( );
  spikes( );
  bubbles( );
  
  keyPressed1( );
  keyPressed2( );
 
  mouseClicked( );


}

void water( )
{
  background( 50, 130, 183 );
}



void body( )
{
  stroke(0,0,0);
  strokeWeight(0.25);
  fill( 183, 165, 142 );

  ellipse( x1, y1, wd, ht ); 
}

void ears( )
{
  stroke(0,0,0);
  strokeWeight(0.25);
  fill( 227, 212, 195 );
  triangle( x1 + .4*wd, y1 - 0.25*ht, x1+0.05*wd + 0.6*wd, y1 - .25*ht, x1 + .4*wd, y1 - .5*ht ); 
  triangle( x1 - .4*wd, y1 - 0.25*ht, x1-0.05*wd - 0.6*wd, y1 - .25*ht, x1 - .4*wd, y1 - .5*ht ); 
}

void eyes( )
{
  fill(255,255,255);
  ellipse( x1 + 34 , y1 - 25, wd/8, ht/8 );
  ellipse( x1 - 34, y1 - 25, wd/8, ht/8 );
  
  fill( 0, 0, 0 );
  ellipse( x1 - 34, y1 - 25, wd/17, ht/17 );
  ellipse( x1 + 34, y1 - 25, wd/17, ht/17 );
}

void mouth( )
{
  fill( 0, 0, 0 );
  ellipse( x1, y1-12, wd/5, ht/5 );
  
  noStroke( );
  fill( 183, 165, 142 );
  rectMode( CENTER );
  rect( x1, y1+9.5, wd/5, ht/5 );
}

void spikes( )
{
  stroke(0,0,0);
  strokeWeight(0.25);
  fill( 175, 150, 130 );
  triangle( x1 + .2*wd, y1 - 0.45*ht, x1 + 0.3*wd, y1 - .38*ht, x1 + .34*wd, y1 - .55*ht ); 
  triangle( x1 - .2*wd, y1 - 0.45*ht, x1 - 0.3*wd, y1 - .38*ht, x1 - .34*wd, y1 - .55*ht );
  
  triangle( x1 + .46*wd, y1 - 0.15*ht, x1 + 0.48*wd, y1 - .04*ht, x1 + .62*wd, y1 - .14*ht ); 
  triangle( x1 - .46*wd, y1 - 0.15*ht, x1 - 0.48*wd, y1 - .04*ht, x1 - .62*wd, y1 - .14*ht );
  
  triangle( x1 + .41*wd, y1 + 0.26*ht, x1 + 0.455*wd, y1 + .16*ht, x1 + .59*wd, y1 + .27*ht ); 
  triangle( x1 - .41*wd, y1 + 0.26*ht, x1 - 0.455*wd, y1 + .16*ht, x1 - .59*wd, y1 + .27*ht );
  
  triangle( x1 + .17*wd, y1 + 0.45*ht, x1 + 0.28*wd, y1 + .395*ht, x1 + .31*wd, y1 + .57*ht ); 
  triangle( x1 - .17*wd, y1 + 0.45*ht, x1 - 0.28*wd, y1 + .395*ht, x1 - .31*wd, y1 + .57*ht );
}


void bubbles( )
{
  fill(255,255,255, 50);
  ellipse( x1-65, y1-40, wd/5, ht/5 );

  ellipse( x1-85, y1-65, wd/6, ht/6 );
  ellipse( x1-90, y1-95, wd/8, ht/8 );
}

void mousePressed( )
{

 // wd = wd + 34;
//  ht = ht + 34;
  
   if (wd == 150) {
    wd = wd + 34;
    ht = ht + 34;
    x1= mouseX+1;
    y1= mouseY+5;
  } else {
    wd = wd - 34;
    ht = ht - 34;
    x1= mouseX-1;
    y1= mouseY-5;
  }
  
}

void keyPressed1( )
{
  if (key == 'a') {
    noStroke( );
  fill( 183, 165, 142);
    rect( x1-35, y1-25, wd/6, ht/6 );
    rect( x1+35, y1-25, wd/6, ht/6 );
    
    stroke(0,0,0);
    strokeWeight(2);
    line( x1-30, y1-30, x1-40, y1-20  );
    line( x1+30, y1-30, x1+40, y1-20  );
  }}
  
  void keyPressed2( )
{
  if (key == 's') {
   noStroke( );
  fill( 183, 165, 142 );
    rect( x1-35, y1-25, wd/6, ht/6 );
    rect( x1+35, y1-25, wd/6, ht/6 );

  fill(255,255,255);
  ellipse( x1 + 34 , y1 - 25, wd/8, ht/8 );
  ellipse( x1 - 34, y1 - 25, wd/8, ht/8 );
  
  fill( 0, 0, 0 );
  ellipse( x1 - 34, y1 - 25, wd/17, ht/17 );
  ellipse( x1 + 34, y1 - 25, wd/17, ht/17 );
  }}


