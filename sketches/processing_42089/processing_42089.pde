
// Homework 7
// copyright John Mailley, September 2011, Pittsburgh, PA 15289

//----VARIABLES------------------------------------------

float x, y, wd, ht, s, diameter, a, b, deltaX, deltaY, dia, maxSpeed, minSpeed;

color col;

//----SETUP-----------------------------------------------

void setup()
{
  size( 400, 400);
  smooth();
  background( 43, 5, 77);
  frameRate( 100);
  ellipseMode( CORNER);
  colorMode(HSB, 100, 100, 100);
 
 
  x = width/2;
  y = height/2;
  wd = 400;
  ht = 400;
  s = .5;
  diameter = 30;
  a = 100;
  b = 100;
  
  maxSpeed = 10;
  minSpeed = -10;
  dia = 100;
  
  deltaX = 0;
  deltaY = 0;

  
}

//----DRAW-------------------------------------------------

void draw()
{
  prepScreen();
  moveInitials();
  changeSpeed();
  reset();
  colorMode(RGB, 100, 100, 100);
  initials( x, y, dia, dia);
  displaySpeed();
}

//----------defineFunction---

void prepScreen()
{
//  col =  color( random(255), random(255), random(255), 50);
//  col =  color( frameCount%256, 255 - frameCount%256, 100 - frameCount%256, 50);
  colorMode( HSB, 100, 100, 100);
  col =  color( 360-frameCount%360, 100, 100, 25);
  fill(col);
  rect( 0, 0, width, height);
}


void displaySpeed()
{
  text( "Horizontal Speed:",10,40);
  text( "Vertical Speed:",10,20);
  text( deltaX, 125, 40);
  text( deltaY, 100, 20);
}


void changeSpeed()
{
  deltaX = map( mouseX, 0, width, minSpeed, maxSpeed);
  deltaY = map( mouseY, 0, height, minSpeed, maxSpeed);
}




void reset()
{
  if (keyPressed == true)
  {
    x = width/2.75;
    y = width/2.75;
    deltaX = 0;
    deltaY = 0;
//    initials( x, y, dia, dia);
    noLoop();
  }
}

void mouseMoved()
{
 loop(); 
}

void moveInitials()
{
  x = x + deltaX; 
  if( x > width + dia/2)
  { 
    x = - dia/2;
  }
    
    if( x < -dia/2)
    {
      x = width + dia/2;
    }
  y = y + deltaY; 
  if( y > height + dia/2)
  {
    y = - dia/2;
  }
    if( y < - dia/2)
    {
      y = height + dia/2;
    }

}


void initials(float x, float y, float wd, float ht)
{
  fill( 255, 255, 255);
  strokeWeight( 3*s);
  stroke(74, 161, 252);
//  quad(250, 0, 500, 250, 250, 500, 0, 250);

  stroke(255, 150, 13);
  strokeWeight(2*s);
  fill(74, 161, 252);
  ellipse(x, y, wd, ht);

  strokeWeight(s);
  stroke(43, 5, 77);
  fill(255, 150, 13);
  
    //'J'
  beginShape();
    curveVertex(x + .0625*wd, y + .25*ht);
    curveVertex(x + .25*wd, y + .0625*ht);
    curveVertex(x + .4375*wd, y + .01*ht);
    curveVertex(x + .4375*wd, y + .05*ht);
    curveVertex(x + .3125*wd, y + .125*ht);
    curveVertex(x + .3125*wd, y + .625*ht);
    curveVertex(x + .1875*wd, y + .8125*ht);
    curveVertex(x + .0625*wd, y + .6875*ht);
    curveVertex(x, y + .5625*ht);
    curveVertex(x + .0625*wd, y + .4375*ht);
    curveVertex(x + .1875*wd, y + .4375*ht);
    curveVertex(x + .1875*wd, y + .5*ht);
    curveVertex(x + .0625*wd, y + .5625*ht);
    curveVertex(x + .1875*wd, y + .6875*ht);
    curveVertex(x + .25*wd, y + .1875*ht);
    curveVertex(x + .125*wd, y + .3125*ht);
    curveVertex(x + .0625*wd, y + .25*ht);
    curveVertex(x + .25*wd, y + .0625*ht);
    curveVertex(x + .4375*wd, y + .01*ht);
    curveVertex(x + .4375*wd, y + .05*ht);
  endShape();

  //'J' (2)
  beginShape();
    curveVertex(x + .25*wd, y + .8125*ht);
    curveVertex(x + .3125*wd, y + .75*ht);
    curveVertex(x + .375*wd, y + .875*ht);
    curveVertex(x + .41*wd, y + .25*ht);
    curveVertex(x + .32*wd, y + .25*ht);
    curveVertex(x + .36*wd, y + .08*ht);
    curveVertex(x + .6*wd, y + .0625*ht);
    curveVertex(x + .58*wd, y + .2*ht);
    curveVertex(x + .47*wd, y + .25*ht);
    curveVertex(x + .4375*wd, y + .9375*ht);
    curveVertex(x + .3125*wd, y + .9375*ht);
    curveVertex(x + .25*wd, y + .8125*ht);
    curveVertex(x + .3125*wd, y + .75*ht);
    curveVertex(x + .375*wd, y + .875*ht);
  endShape();

  //'M'
  beginShape();
    curveVertex(x + .9375*wd, y + .625*ht);
    curveVertex(x + .875*wd, y + .4375*ht);
    curveVertex(x + .8125*wd, y + .625*ht);
    curveVertex(x + .6875*wd, y + .3125*ht);
    curveVertex(x + .625*wd, y + .9375*ht);
    curveVertex(x + .5*wd, y + .95*ht);
    curveVertex(x + .5*wd, y + .75*ht);
    curveVertex(x + .5625*wd, y + .875*ht);
    curveVertex(x + .625*wd, y + .125*ht);
    curveVertex(x + .6875*wd, y + .125*ht);
    curveVertex(x + .8125*wd, y + .375*ht);
    curveVertex(x + .875*wd, y + .1875*ht);
    curveVertex(x + .99*wd, y + .4375*ht);
    curveVertex(x + .9375*wd, y + .625*ht);
    curveVertex(x + .875*wd, y + .4375*ht);
    curveVertex(x + .8125*wd, y + .625*ht);
  endShape();
}


