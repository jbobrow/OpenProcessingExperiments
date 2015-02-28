
int centerOrbitx = 600; // planet mars
int centerOrbity = 200;
float centerPlanetx;
float centerPlanety;
int radiusOrbit = 180;
int numPoints = 360;
float degreesPlanet = 360.0;
float speedPlanet = 1.0;

int centerOrbit2x = 600; // planet mercury
int centerOrbit2y = 200;
float centerPlanet2x;
float centerPlanet2y;
int radiusOrbit2 = 160;
int numPoints2 = 360;
float degreesPlanet2 = 360.0;
float speedPlanet2 = 1.5;

int misslePath = 230; // other gamepieces 
int sunEdge = 565;
int cannonEdge = 135;
int sunSize = 50;


void setup()
{
  size (800,400);
  smooth ();
  noStroke ();
}

void draw()
{
  background (0);

  // GAME OBJECTS

  fill (250,sunSize*1.25,0); // draw sun, yellow increases as size increases
  ellipse (600+((centerPlanet2x/20)-(radiusOrbit/10)),200+((centerPlanety/20)-(radiusOrbit/10)),sunSize,sunSize);
  // sun position is affected slightly by x of planet 2 and y of planet 1

  fill (255,200,0); // draw missle
  rectMode (CENTER);
  rect (misslePath,200,80,10);

  fill (150,150,150); // draw cannon
  rect (cannonEdge,200,40,20);

  fill (0,100,200); // draw earth
  ellipse (-200,200,660,660);
  fill (0,200,0);
  quad (100,70,30,80,50,100,30,40);
  quad (90,150,60,40,10,50,90,50);
  quad (60,300,90,350,80,320,70,270);
  quad (-100,150,-50,350,100,200,80,300);
  quad (-50,100,-80,250,60,250,80,170);

  // MISSLE AND SUN INTERACTION

  if ( misslePath > 120 ) {
    misslePath = misslePath + 5; // move missle
  }

  if (misslePath == sunEdge) { // relaunch missle
    misslePath = 120;
    sunEdge = sunEdge - 10; // change missle sun collision point
    sunSize = sunSize + 20; // expand sun
    speedPlanet = speedPlanet + 0.25; // increase planet mars speed
    speedPlanet2 = speedPlanet2 + 0.5; // increase planet mercury speed
    if (sunEdge < 465 ) { // reset everything after victory
      sunEdge = 565;
      sunSize = 50;
      speedPlanet = 1.0;
      speedPlanet2 = 1.5;
      delay(1000);
    }
  }

  // MARS

  if (misslePath < centerPlanetx + 40 && misslePath > centerPlanetx - 40 ) { // reset everything after missle hits planet mars
    if (200 < centerPlanety + 5 && 200 > centerPlanety - 5 ) {
      sunEdge = 565;
      sunSize = 50;
      speedPlanet = 1.0;
      speedPlanet2 = 1.5;
      misslePath = 230;  
      delay(1000);   
    }
  }

  float A = 2*PI/numPoints*degreesPlanet; // orbit math for mars
  centerPlanetx = cos(A)*radiusOrbit;
  centerPlanety = sin(A)*radiusOrbit;
  centerPlanetx = centerPlanetx + centerOrbitx;
  centerPlanety = centerPlanety + centerOrbity;

  fill (150,0,50); // draw planet mars
  ellipse (centerPlanetx,centerPlanety,25,25);

  degreesPlanet = degreesPlanet + speedPlanet; // move planet mars

  if(degreesPlanet==0.0) { // reset planet mars
    degreesPlanet = 360.0;
  }

  // MERCURY

  if (misslePath < centerPlanet2x + 40 && misslePath > centerPlanet2x - 40 ) { // reset everything after missle hits planet mercury
    if (200 < centerPlanet2y + 5 && 200 > centerPlanet2y - 5 ) {
      sunEdge = 565;
      sunSize = 50;
      speedPlanet = 1.0;
      speedPlanet2 = 1.5;
      misslePath = 230;     
      delay(1000);
    }
  }

  float B = 2*PI/numPoints2*degreesPlanet2; // orbit math for mercury
  centerPlanet2x = cos(B)*radiusOrbit2;
  centerPlanet2y = sin(B)*radiusOrbit2;
  centerPlanet2x = centerPlanet2x + centerOrbit2x;
  centerPlanet2y = centerPlanet2y + centerOrbit2y;

  fill (100,100,100); // draw planet mercury
  ellipse (centerPlanet2x,centerPlanet2y,15,15);

  degreesPlanet2 = degreesPlanet2 + speedPlanet2; // move planet mercury

  if(degreesPlanet2==0.0) { // reset planet mercury
    degreesPlanet2 = 360.0;
  }

  // FIRE MISSLE

  if(keyPressed) { 
    if (misslePath == 120) { // prevents interupt of missle trajectory
      misslePath = cannonEdge;  
    }
  }  
}


