
// Homework #5 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright February 2012

//INSTRUCTIONS
//Move Mouse to create Initials
//Up and Down Keys change color tones, hold down for crazy effects

float r, g, b;
void setup()
{
  size( 400, 400 );
  smooth();
  background( 255 );
  r = 50;
  g = 100;
  b = 100;
}

void draw()
{
  drawInitial( mouseX, mouseY, (abs( mouseX - pmouseX + 40 ) )*2 );
}

void keyPressed()
{
  if( keyCode == UP )
  {
    r = (r + 10)%255;
    g = 255 - (g + 10);
    b = (b + 5)%255;
  }
  if( keyCode == DOWN )
  {
    r = (r - 3)%255;
    g = (g - 6)%255;
    b = 255 - (b - 9);
  }
}

void drawInitial( float x, float y, float dia )
{
  // C
noStroke();
fill( r + 150, g + 100, b - 20 );
arc( x, y, dia, dia, PI/5, TWO_PI-PI/5);
fill( r + 120, g + 70, b - 20 );
arc( x, y, dia*.9, dia*.9, PI/5, TWO_PI-PI/5);
fill( r + 90, g + 40, b - 20 );
arc( x, y, dia*.8, dia*.8, PI/5, TWO_PI-PI/5);
fill( r + 60, g + 10, b - 20 );
arc( x, y, dia*.7, dia*.7, PI/5, TWO_PI-PI/5);
fill( 255 );
arc( x, y, dia*.6, dia*.6, PI/6, TWO_PI-PI/6);
 
 
// P
fill( r + 30, g, b - 20, 200 );
beginShape();
  vertex( x, y - dia/2 );
  vertex( x, y + dia/2 );
  vertex( x - dia/17, y + dia/2 );
  vertex( x - dia/17, y - dia/2.02 );
endShape();
fill( r + 30, g + 30, b - 20, 200 );
beginShape();
  vertex( x, y - dia/2 );
  vertex( x, y + dia/2 );
  vertex( x + dia/17, y + dia/2 );
  vertex( x + dia/17, y - dia/2.02 );
endShape();
noFill();
strokeWeight( abs( dia/19 ) );
stroke( r + 30, g + 60, b - 20, 200);
  arc( x + dia/20, y - dia/4.3, dia/2, dia/2.1, TWO_PI-PI/2, TWO_PI+PI/2 );
 
 
// L
noStroke();
fill( r*0, g - 20, b/2, 180 );
beginShape();
  vertex( x - dia/2.8, y - dia/2.8 );
  vertex( x - dia/2.8, y + dia/2.8 );
  vertex( x + dia/2.8, y + dia/2.8 );
  vertex( x + dia/2.45, y + dia/3.4 );
  vertex( x - dia/3.4, y + dia/3.3 );
  vertex( x - dia/3.4, y - dia/2.45 );
endShape();
fill( r*0, g - 40, b/2, 180 );
beginShape();
  vertex( x - dia/2.8, y - dia/2.8 );
  vertex( x - dia/2.8, y + dia/2.8 );
  vertex( x + dia/2.8, y + dia/2.8 );
  vertex( x + dia/3.4, y + dia/2.45 );
  vertex( x - dia/3.4, y + dia/2.45 );
  vertex( x - dia/2.8, y + dia/2.8 );
  vertex( x - dia/2.45, y + dia/3.4 );
  vertex( x - dia/2.45, y - dia/3.45 );
endShape();
 
 
// W
noFill();
stroke( 80, 80, 50, 180 );
strokeWeight( abs ( dia/60.0 ) );
beginShape();
  curveVertex( x, y - dia/2 );
  curveVertex( x - dia*.355, y - dia*.355 );
  curveVertex( x - dia*.43, y );
  curveVertex( x - dia*.225, y + dia*.445 );
  curveVertex( x, y + dia/50 );
  curveVertex( x + dia*.225, y + dia*.445 );
  curveVertex( x + dia*.43, y );
  curveVertex( x + dia*.355, y - dia*.355 );
  curveVertex( x, y - dia/2 );
endShape();
stroke( 80, 110, 80, 180 );
beginShape();
  curveVertex( x, y - dia/2 );
  curveVertex( x - dia*.355, y - dia*.355 );
  curveVertex( x - dia*.425, y );
  curveVertex( x - dia*.225, y + dia*.42 );
  curveVertex( x, y + dia/100 );
  curveVertex( x + dia*.225, y + dia*.42 );
  curveVertex( x + dia*.425, y );
  curveVertex( x + dia*.355, y - dia*.355 );
  curveVertex( x, y - dia/2 );
endShape();
stroke( 80, 140, 110, 180 );
beginShape();
  curveVertex( x, y - dia/2 );
  curveVertex( x - dia*.355, y - dia*.355 );
  curveVertex( x - dia*.42, y );
  curveVertex( x - dia*.225, y + dia*.39 );
  curveVertex( x, y );
  curveVertex( x + dia*.225, y + dia*.39 );
  curveVertex( x + dia*.42, y );
  curveVertex( x + dia*.355, y - dia*.355 );
  curveVertex( x, y - dia/2 );
endShape();
stroke( 80, 170, 140, 180 );
beginShape();
  curveVertex( x, y - dia/2 );
  curveVertex( x - dia*.355, y - dia*.355 );
  curveVertex( x - dia*.415, y );
  curveVertex( x - dia*.225, y + dia*.36 );
  curveVertex( x, y - dia/100 );
  curveVertex( x + dia*.225, y + dia*.36 );
  curveVertex( x + dia*.415, y );
  curveVertex( x + dia*.355, y - dia*.355 );
  curveVertex( x, y - dia/2 );
endShape();
stroke( 80, 200, 170, 180 );
beginShape();
  curveVertex( x, y - dia/2 );
  curveVertex( x - dia*.355, y - dia*.355 );
  curveVertex( x - dia*.41, y );
  curveVertex( x - dia*.225, y + dia*.33 );
  curveVertex( x, y - dia/50 );
  curveVertex( x + dia*.225, y + dia*.33 );
  curveVertex( x + dia*.41, y );
  curveVertex( x + dia*.355, y - dia*.355 );
  curveVertex( x, y - dia/2 );
endShape();
}                
