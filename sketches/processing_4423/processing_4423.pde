
int centerOrbitx = 600; // blocker 1
int centerOrbity = 200;
float middleBlockerx;
float middleBlockery;
int radiusOrbit = 180;
int numPoints = 360;
float degreesBlocker = 360.0;
float speedBlocker = 1.0;

int centerOrbit2x = 600; // blocker 2
int centerOrbit2y = 200;
float middleBlocker2x;
float middleBlocker2y;
int radiusOrbit2 = 160;
int numPoints2 = 360;
float degreesBlocker2 = 360.0;
float speedBlocker2 = 1.5;
float r = 5;

int migrantPath = 230; // other gamepieces 
int sydEdge = 565;
int cannonEdge = 135;
int sydSize = 50;




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

  fill (random(50,255),sydSize*1.25,random(50)); // draw sun, yellow increases as size increases
  ellipse (600+((middleBlocker2x/20)-(radiusOrbit/10)),200+((middleBlockery/20)-(radiusOrbit/10)),sydSize,sydSize);
  
  
  // sun position is affected slightly by x of Blocker 2 and y of Blocker 1

  fill (255,200,0); // draw migrant
  rectMode (CENTER);
  rect (migrantPath,random(199,201),80,10);

  fill (150,150,150); // draw airport
  rect (cannonEdge,200,40,20);

  fill (0,100,200); // draw depart
  ellipse (-200,200,660,660);
  fill (0,200,0);
    if (r<660) {
      ellipse (-200,200, r, r);
      r+=(random(8));
    }
    else {r=2;}

  // MISSLE AND SUN INTERACTION

  if ( migrantPath > 120 ) {
    migrantPath = migrantPath + 5; // move missle
  }

  if (migrantPath == sydEdge) { // relaunch missle
    migrantPath = 120;
    sydEdge = sydEdge - 10; // change missle sun collision point
    sydSize = sydSize + 20; // expand syd
    speedBlocker = speedBlocker + 0.25; // increase Blocker 1 speed
    speedBlocker2 = speedBlocker2 + 0.5; // increase Blocker 2 speed
    if (sydEdge < 465 ) { // reset everything after victory
      sydEdge = 565;
      sydSize = 50;
      speedBlocker = 1.0;
      speedBlocker2 = 1.5;
      delay(1000);
    }
  }

  // MARS

  if (migrantPath < middleBlockerx + 40 && migrantPath > middleBlockerx - 40 ) { // reset everything after missle hits Blocker mars
    if (200 < middleBlockery + 5 && 200 > middleBlockery - 5 ) {
      sydEdge = 565;
      sydSize = 50;
      speedBlocker = 1.0;
      speedBlocker2 = 1.5;
      migrantPath = 230;  
      delay(1000);   
    }
  }

  float A = 2*PI/numPoints*degreesBlocker; // orbit math for mars
  middleBlockerx = cos(A)*radiusOrbit;
  middleBlockery = sin(A)*radiusOrbit;
  middleBlockerx = middleBlockerx + centerOrbitx;
  middleBlockery = middleBlockery + centerOrbity;

  fill (150,0,50); // draw Blocker mars
  ellipse (middleBlockerx,middleBlockery,25,25);

  degreesBlocker = degreesBlocker + speedBlocker; // move Blocker mars

  if(degreesBlocker==0.0) { // reset Blocker mars
    degreesBlocker = 360.0;
  }

  // MERCURY

  if (migrantPath < middleBlocker2x + 40 && migrantPath > middleBlocker2x - 40 ) { // reset everything after missle hits Blocker mercury
    if (200 < middleBlocker2y + 5 && 200 > middleBlocker2y - 5 ) {
      sydEdge = 565;
      sydSize = 50;
      speedBlocker = 1.0;
      speedBlocker2 = 1.5;
      migrantPath = 230;     
      delay(1000);
    }
  }

  float B = 2*PI/numPoints2*degreesBlocker2; // orbit math for mercury
  middleBlocker2x = cos(B)*radiusOrbit2;
  middleBlocker2y = sin(B)*radiusOrbit2;
  middleBlocker2x = middleBlocker2x + centerOrbit2x;
  middleBlocker2y = middleBlocker2y + centerOrbit2y;

  fill (100,100,100); // draw Blocker mercury
  ellipse (middleBlocker2x,middleBlocker2y,15,15);

  degreesBlocker2 = degreesBlocker2 + speedBlocker2; // move Blocker mercury

  if(degreesBlocker2==0.0) { // reset Blocker mercury
    degreesBlocker2 = 360.0;
  }

  // FIRE MISSLE

  if(keyPressed) { 
    if (migrantPath == 120) { // prevents interupt of missle trajectory
      migrantPath = cannonEdge;  
    }
  }  
}



