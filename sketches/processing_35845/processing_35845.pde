
// homework 2
// copyright John Swanson September 2011, Pittsburgh, PA 15221
size( 400,400);
smooth();
float x = 50;
float y = 150;
float wd = 100;
float ht = 100;

background( x+0.5*y, 75, 0.5*wd+0.5*ht);
ellipseMode( CORNER);
noFill();
stroke(250-x, 250-y, x+y);
strokeWeight(.125*wd);
//ellipse( x, y, wd, ht);
//J
arc( x, y+.5*ht, 
    wd, ht, 
    0, PI);
beginShape();
  vertex( x+wd, y+ht);
  vertex( x+wd, y);
  vertex( x+0.5*wd, y+0.25*ht);
endShape();
//T
stroke(250-x+y, 250-x, x+y);
beginShape();
  vertex( x+1.25*wd, y-0.125*ht);
  vertex( x+2.25*wd, y-0.625*ht);
endShape();
beginShape();
  vertex( x+1.75*wd, y-0.375*ht);
  vertex( x+1.75*wd, y+0.875*ht);
endShape();
//S
stroke(250-y, x+y, y);
arc( x+2.5*wd, y-0.75*ht, 
     0.5*wd, 0.625*ht,
     PI/2, TWO_PI);
arc( x+2.5*wd, y-0.125*ht, 
     0.5*wd, 0.625*ht,
     TWO_PI-PI/2, TWO_PI);
arc( x+2.5*wd, y-0.125*ht, 
     0.5*wd, 0.625*ht,
     0, PI);
     
//Background Stuff
noStroke();
fill( wd*250/750, ht*250/150, wd+ht);
triangle( x-0.5*wd, y+2.5*ht, 
          x+3.5*wd, y+2.5*ht,
          x+3.5*wd, y+1.0*ht);
fill( wd, ht*250/150, wd*250/750);
triangle( x-0.5*wd, y, 
          x-0.5*wd, y-1.5*ht,
          x+3.5*wd, y-1.5*ht);
//saveFrame("hw2.jpg");

