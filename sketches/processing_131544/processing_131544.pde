
//copyright Laura Contero 2014
//Homework Assignment 4

size( 400, 400);
background( 237, 255, 251, 191);
fill( 0, 10);
  
float x = 0;
float y = 0;
float w = 400;
float h = 400;

//head
fill( 250, 243, 204);
strokeWeight(2.5);
ellipseMode(CORNER);
ellipse( x+.20*w, y+.125*h, .625*w, .75*h);
     
//glasses
fill( 255, 255, 255);
strokeWeight(5);
rectMode(CORNER);
rect( x+.26*w, y+.40*h, .50*w, .125*h);
line( x+.51*w, y+.40*h, x+.51*w, y+.52*h);

//pupils
fill( 0, 0, 0);
ellipseMode(CENTER);
ellipse( x+.38*w, y+.42*h, .050*w, .075*h);
ellipse( x+.62*w, y+.42*h, .050*w, .075*h);
     
//mouth
fill( 255, 255, 255);
strokeWeight(5);
beginShape();
  curveVertex( x+.50*w, y+.75*h);
  curveVertex( x+.625*w, y+.75*h);
  curveVertex( x+.375*w, y+.75*h);
  curveVertex( x+.50*w, y+.8125*h);
  curveVertex( x+.625*w, y+.75*h);
  curveVertex( x+.375*w, y+.75*h);
  curveVertex( x+.625*w, y+.75*h);
  curveVertex( x+.375*w, y+.75*h);
endShape(CLOSE);
     
//hair
fill( 196, 194, 192, 191);
strokeWeight(1);
beginShape();
  curveVertex( x+.35*w, y+.07*h);
  curveVertex( x+.35*w, y+.19*h);
  curveVertex( x+.22*w, y+.25*h);
  curveVertex( x+.21*w, y+.40*h);
  curveVertex( x+.25*w, y+.42*h);
endShape(CLOSE);
     
fill( 196, 194, 192, 191);
strokeWeight(1);
beginShape();
  curveVertex( x+.675*w, y+.07*h);
  curveVertex( x+.675*w, y+.19*h);
  curveVertex( x+.80*w, y+.25*h);
  curveVertex( x+.83*w, y+.40*h);
  curveVertex( x+.78*w, y+.42*h);
endShape(CLOSE);
     
//L initial
stroke( 252, 150, 100);
strokeWeight(7);
line( x+.26*w, y+.25*h, x+.26*w, y+.525*h);
line( x+.26*w, y+.525*h, x+.38*w, y+.525*h);
     
//nose
noFill();
stroke( 0, 0, 0);
strokeWeight(2.5);
beginShape();
  curveVertex( x+.51*w, y+.52*h);
  curveVertex( x+.51*w, y+.52*h);
  curveVertex( x+.45*w, y+.55*h);
  curveVertex( x+.45*w, y+.58*h);
  curveVertex( x+.51*w, y+.60*h);
  curveVertex( x+.51*w, y+.60*h);
endShape(OPEN);
     
//left ear
fill( 250, 243, 204);
beginShape();
  curveVertex( x+.62*w, y+.42*h);
  curveVertex( x+.22*w, y+.47*h);
  curveVertex( x+.20*w, y+.55*h);
  curveVertex( x+.22*w, y+.57*h);
  curveVertex( x+.27*w, y+.58*h);
endShape(CLOSE);
     
//right ear
fill( 250, 243, 204);
beginShape();
  curveVertex( x+.40*w, y+.42*h);
  curveVertex( x+.80*w, y+.47*h); 
  curveVertex( x+.82*w, y+.55*h);
  curveVertex( x+.80*w, y+.57*h);
  curveVertex( x+.75*w, y+.58*h);
endShape(CLOSE);


