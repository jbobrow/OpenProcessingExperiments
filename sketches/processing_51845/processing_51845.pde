
// Homework #6 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright February 2012

float tx, ty, td, bx, by, bd, txSpeed, tySpeed, bxSpeed, bySpeed;

void setup()
{
  size(400, 400 );
  tx = random( width );
  ty = random( height );
  td = 60;
  bx = random( width );
  by = random( height );
  bd = 60;
  txSpeed = 2;
  tySpeed = 2;
  bxSpeed = 2;
  bySpeed = 2;
}

void draw()
{
  prepWindow();
  wrapInitial();
  drawInitial( tx, ty, td );
  bounceInitial();
  drawInitial( bx, by, bd );
}

void prepWindow()
{
  fill( 0, 10 );
  rect( 0, 0, width, height );
}

void wrapInitial()
{
  tx = tx + txSpeed;
  ty = ty + tySpeed/3.0;
  if( tx > width + td/2.0 )
  {
    tx = -td/2.0;
  }
  if( ty > height + td/2.0 )
  {
    ty = -td/2.0;
  }
}

void bounceInitial()
{
  bx = bx + bxSpeed;
  by = by + bySpeed;
  if( bx > width - bd/2.0 )
  {
    bxSpeed = -bxSpeed;
  }
  if( by > height - bd/2.0 )
  {
    bySpeed = -bySpeed;
  }
  if( bx < bd/2.0 )
  {
    bxSpeed = -bxSpeed;
  }
  if( by < bd/2.0 )
  {
    bySpeed = -bySpeed;
  }
}

void drawInitial( float tx, float ty, float td )
{
// C
  noStroke();
  fill( 200, 200, 80 );
  arc( tx, ty, td, td, PI/5, TWO_PI-PI/5);
  fill( 170, 170, 80 );
  arc( tx, ty, td*.9, td*.9, PI/5, TWO_PI-PI/5);
  fill( 140, 140, 80 );
  arc( tx, ty, td*.8, td*.8, PI/5, TWO_PI-PI/5);
  fill( 110, 110, 80 );
  arc( tx, ty, td*.7, td*.7, PI/5, TWO_PI-PI/5);
  fill( 0 );
  ellipse( tx, ty, td*.6, td*.6 );
// P
  fill( 70, 100, 80, 200 );
  beginShape();
    vertex( tx, ty - td/2 );
    vertex( tx, ty + td/2 );
    vertex( tx - td/17, ty + td/2 );
    vertex( tx - td/17, ty - td/2.02 );
  endShape();
  fill( 70, 130, 80, 200 );
  beginShape();
    vertex( tx, ty - td/2 );
    vertex( tx, ty + td/2 );
    vertex( tx + td/17, ty + td/2 );
    vertex( tx + td/17, ty - td/2.02 );
  endShape();
  noFill();
  strokeWeight( td/19 );
  stroke( 80, 160, 80, 200);
    arc( tx + td/20, ty - td/4.3, td/2, td/2.1, TWO_PI-PI/2, TWO_PI+PI/2 );
// L
  noStroke();
  fill( 0, 40, 50, 180 );
  beginShape();
    vertex( tx - td/2.8, ty - td/2.8 );
    vertex( tx - td/2.8, ty + td/2.8 );
    vertex( tx + td/2.8, ty + td/2.8 );
    vertex( tx + td/2.45, ty + td/3.4 );
    vertex( tx - td/3.4, ty + td/3.3 );
    vertex( tx - td/3.4, ty - td/2.45 );
  endShape();
  fill( 0, 60, 50, 180 );
  beginShape();
    vertex( tx - td/2.8, ty - td/2.8 );
    vertex( tx - td/2.8, ty + td/2.8 );
    vertex( tx + td/2.8, ty + td/2.8 );
    vertex( tx + td/3.4, ty + td/2.45 );
    vertex( tx - td/3.4, ty + td/2.45 );
    vertex( tx - td/2.8, ty + td/2.8 );
    vertex( tx - td/2.45, ty + td/3.4 );
    vertex( tx - td/2.45, ty - td/3.45 );
  endShape();
// W
  noFill();
  stroke( 80, 80, 50, 180 );
  strokeWeight( td/60.0 );
  beginShape();
    curveVertex( tx, ty - td/2 );
    curveVertex( tx - td*.355, ty - td*.355 );
    curveVertex( tx - td*.43, ty );
    curveVertex( tx - td*.225, ty + td*.445 );
    curveVertex( tx, ty + td/50 );
    curveVertex( tx + td*.225, ty + td*.445 );
    curveVertex( tx + td*.43, ty );
    curveVertex( tx + td*.355, ty - td*.355 );
    curveVertex( tx, ty - td/2 );
  endShape();
  stroke( 80, 110, 80, 180 );
  beginShape();
    curveVertex( tx, ty - td/2 );
    curveVertex( tx - td*.355, ty - td*.355 );
    curveVertex( tx - td*.425, ty );
    curveVertex( tx - td*.225, ty + td*.42 );
    curveVertex( tx, ty + td/100 );
    curveVertex( tx + td*.225, ty + td*.42 );
    curveVertex( tx + td*.425, ty );
    curveVertex( tx + td*.355, ty - td*.355 );
    curveVertex( tx, ty - td/2 );
  endShape();
  stroke( 80, 140, 110, 180 );
  beginShape();
    curveVertex( tx, ty - td/2 );
    curveVertex( tx - td*.355, ty - td*.355 );
    curveVertex( tx - td*.42, ty );
    curveVertex( tx - td*.225, ty + td*.39 );
    curveVertex( tx, ty );
    curveVertex( tx + td*.225, ty + td*.39 );
    curveVertex( tx + td*.42, ty );
    curveVertex( tx + td*.355, ty - td*.355 );
    curveVertex( tx, ty - td/2 );
  endShape();
  stroke( 80, 170, 140, 180 );
  beginShape();
    curveVertex( tx, ty - td/2 );
    curveVertex( tx - td*.355, ty - td*.355 );
    curveVertex( tx - td*.415, ty );
    curveVertex( tx - td*.225, ty + td*.36 );
    curveVertex( tx, ty - td/100 );
    curveVertex( tx + td*.225, ty + td*.36 );
    curveVertex( tx + td*.415, ty );
    curveVertex( tx + td*.355, ty - td*.355 );
    curveVertex( tx, ty - td/2 );
  endShape();
  stroke( 80, 200, 170, 180 );
  beginShape();
    curveVertex( tx, ty - td/2 );
    curveVertex( tx - td*.355, ty - td*.355 );
    curveVertex( tx - td*.41, ty );
    curveVertex( tx - td*.225, ty + td*.33 );
    curveVertex( tx, ty - td/50 );
    curveVertex( tx + td*.225, ty + td*.33 );
    curveVertex( tx + td*.41, ty );
    curveVertex( tx + td*.355, ty - td*.355 );
    curveVertex( tx, ty - td/2 );
  endShape();
}
