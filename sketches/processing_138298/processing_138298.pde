
/**************************************************
The Solar System
by Sarah Kettell

An interactive sketch of the solar system, with facts 
about each planet and the sun when user hovers over 
them. Although the size and distance ratio is not to 
scale, the speed that each planet orbits is as it
relates to the Earth.

All graphics are originals made using Photoshop.

Controls:

Pause: P, p, or hover over a planet
Resume: ENTER or RETURN
Screencap: S or s

**************************************************/

// colour palettes
color style[] = {#000000, #222222};
color planets[] = {#FFF509, #A64521, #D9814E, #2DBFFF, #D90718, #F8E4AF, #DEB18E, #329DAD, #0A4871};
color highlight[] = {#FFFFC4, #FF4521, #F0B980, #0CFFFF, #FF5500, #FFFFFF, #FFF3A2, #4AE7FF, #1387D4};

// global variables

// variables that track pause state and last planet touched
boolean paused = false;
boolean keyPause = false;
int startPause = 0;
int endPause = 0;
float[] curPlanet = {0, 0, 0};


// determine size of each planet
float baseSize = 8;
float sun = 10 * baseSize;
float mercury = baseSize;
float venus = 1.8 * baseSize;
float earth = 2.0 * baseSize;
float mars = 1.3 * baseSize;
float jupiter = 6 * baseSize;
float saturn = 5 * baseSize;
float uranus = 3 * baseSize;
float neptune = 2.9 * baseSize;

// determine orbit distance from sun
float baseOrbit =  120;
float merOrbit = (0.9 * baseOrbit) / 2;
float venOrbit = (1.2 * baseOrbit) / 2;
float earOrbit = (1.55 * baseOrbit) / 2;
float marOrbit = (1.9 * baseOrbit) / 2;
float jupOrbit = (2.7 * baseOrbit) / 2;
float satOrbit = (3.7 * baseOrbit) / 2;
float uraOrbit = (4.6 * baseOrbit) / 2;
float nepOrbit = (5.3 * baseOrbit) / 2;

// determine orbit speed and planet location
int orbitSpeed;
float orbitDuration = 10;
float ang;
float x;
float y;

// image variables
PImage BG;
PImage merInfo;
PImage venInfo;
PImage earInfo;
PImage marInfo;
PImage jupInfo;
PImage satInfo;
PImage uraInfo;
PImage nepInfo;
PImage sunInfo;


// setup
void setup() {
  size(780,720);
  
  // load image files
  BG = loadImage("SolarSystemBG.png");
  sunInfo = loadImage("sun.png");
  merInfo = loadImage("mercury.png");
  venInfo = loadImage("venus.png");
  earInfo = loadImage("earth.png");
  marInfo = loadImage("mars.png");
  jupInfo = loadImage("jupiter.png");
  satInfo = loadImage("saturn.png");
  uraInfo = loadImage("uranus.png");
  nepInfo = loadImage("neptune.png");
}

// draw
void draw() {
  // bg must be redrawn so planet shapes do not repeat
  background(style[0]);
  image(BG,0,0);
  
  // set grid to be centered
  pushMatrix();
  translate(width/2, height/2);
  
  // function that calculates the orbit
  calcSpeed();
  
  // draw the sun
  // this does not use drawPlanet because orbit is not required
  fill(planets[0]);
  // checks if sun is being hovered over
  if (touchPlanet(0, 0, sun)) {
    stroke(highlight[0]);
    strokeWeight(2);
    ellipse(0, 0, sun, sun);
      
    // draw info
    image(sunInfo, (width - 30)/2 - 165, 10 - height/2);
    
    // pause orbit while hovered
    pauseOrbit();
  }
  else {
    stroke(style[1]);
    strokeWeight(1);
    ellipse(0, 0, sun, sun);
  }
  
  // draw Mercury and it's orbit
  drawPlanet(merOrbit, 88, mercury, 1, merInfo);
  
  // draw Venus and it's orbit
  drawPlanet(venOrbit, 225, venus, 2, venInfo);

  // draw Earth and it's orbit
  drawPlanet(earOrbit, 365, earth, 3, earInfo);
  
  // draw Mars and it's orbit
  drawPlanet(marOrbit, 687, mars, 4, marInfo);
  
  // draw Jupiter and it's orbit
  drawPlanet(jupOrbit, (12 * 365), jupiter, 5, jupInfo);
  
  // draw Saturn and it's orbit
  drawPlanet(satOrbit, (29 * 365), saturn, 6, satInfo);
  
  // draw Uranus and it's orbit
  drawPlanet(uraOrbit, (84 * 365), uranus, 7, uraInfo);
  
  // draw Neptune and it's orbit
  drawPlanet(nepOrbit, (165 * 365), neptune, 8, nepInfo);
    
    
  // check if hovering over any planet
  isTouching();
  
  // sets grid back to normal
  popMatrix();
}

/*******************************************************
  Function that checks for keys released. Specifically
  'S'/'s', 'p'/'P', and ENTER/RETURN. Keyboard input
  allows user to save a screencap, pause the orbit, and
  resume the orbit.
********************************************************/
void keyReleased() {
  // saves screencap
  if (key == 's' || key == 'S') saveFrame("solarsystem.png");
  
  // toggle planet orbit rotation on/off with 'p' and enter/return
  if (key == 'p' || key == 'P') {
    keyPause = true;
    pauseOrbit();
  }
  if (keyCode == ENTER || keyCode == RETURN) {
    keyPause = false;
    resumeOrbit();
  }
}

/*******************************************************
  Function that keeps track of placement of planets
  so they resume orbits after a pause in the correct
  locations.
********************************************************/
void calcSpeed() {
  if (paused) {
    orbitSpeed = orbitSpeed;
  }
  if (!paused) {
    orbitSpeed = millis() - endPause;
  }
}

/*******************************************************
  Function that returns true when the mouse hovers over
  a planet (or sun), false otherwise. When true, it also
  saves the position of the current planet to track when
  the mouse stops hovering over it using isTouching().
********************************************************/
boolean touchPlanet(float x, float y, float planet) {
 if (dist(mouseX - width/2, mouseY - height/2, x, y) < planet/2) {
   curPlanet[0] = x;
   curPlanet[1] = y;
   curPlanet[2] = planet;
   return true;
 }
 return false;
} 

/*******************************************************
  Function that resumes the orbit when the mouse stops
  touching the planet it last touched.
********************************************************/
// tracks when mouse stops touching a planet
void isTouching() {
  if (!touchPlanet(curPlanet[0], curPlanet[1], curPlanet[2]) && !keyPause) {
    resumeOrbit();
  }
}

/*******************************************************
  Function that pauses the orbit (movement) of all
  planets when called, and saves the current value of
  millis() to calculate current position when they
  resume.
********************************************************/
void pauseOrbit() {
  if (!paused) {
    startPause = millis();
  }
  paused = true;
}

/*******************************************************
  Function that resumes the orbit (movement) of all
  planets when called, and calculates the difference
  in time from pause to resume.
********************************************************/
// resumes orbit of planets
void resumeOrbit() {
  if (paused) {
    endPause = endPause + (millis() - startPause);
  }
  paused = false;
}

/*******************************************************
  Function that sets styles and calculations for each planet and
  orbital ring, then draws them.
********************************************************/
void drawPlanet(float orbit, float days, float planet, int c, PImage filename) {
  // draw the orbital ring
  stroke(style[1]);
  strokeWeight(1);
  noFill();
  ellipse(0, 0, orbit * 2, orbit * 2);
  
  // calculate orbit position and speed
  ang = TWO_PI * orbitSpeed/(days * orbitDuration);
  x = cos(ang) * orbit;
  y = sin(ang) * orbit;
  
  // set style of planet
  stroke(style[1]);
  strokeWeight(1);
  
  // change style if hovering over planet and pauses orbit
  if (touchPlanet(x, y, planet)) {
    stroke(highlight[c]);
    strokeWeight(2);
    fill(planets[c]);
    
    // draw info
    image(filename, (width - 30)/2 - 165, 10 - height/2);
    
    pauseOrbit();
  }
  else {
    fill(planets[c]);
  }
  
  // draw the planet
  ellipse(x, y, planet, planet);
}


