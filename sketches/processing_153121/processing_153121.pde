
/* @pjs preload="grass.png, grass_tint.png, moon.png, sky.png, sky_tint.png, sun.png"; 
 */

PFont myFont;    // font data
int   gap;       // gap between digits

PImage grass;
PImage grass_tint;
PImage sky;
PImage sky_tint;
PImage sunshine;
PImage moon;


void setup() {
  size(1024, 600);

  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  gap = 300;

  // load images required
  grass = loadImage("grass.png");
  grass_tint = loadImage("grass_tint.png");
  sky = loadImage("sky.png");
  sky_tint = loadImage("sky_tint.png");
  sunshine = loadImage("sun.png");
  moon = loadImage("moon.png");
}


void draw() {
  background(0);

  // display sky image
  image(sky, 0, 0);
  // darken sky between sunset and sunrise
  nightSky();

  // display moon after sunset
  if ((hour()>17 && hour()<=24) || hour()<9) { 
    displayMoon();
  }
  // display sun after sunrise
  if (hour()>5 && hour()<18) { 
    displaySun();
  }

  // display grass image
  image(grass, 0, height-grass.height);
  // darken grass between sunset and sunrise
  nightGrass();

  // draw h, m, s
  drawNumber(hour(), -gap);
  drawNumber(minute(), 0);
  drawNumber(second(), gap);

  displayHourArc();
  displayMinuteArc();
  displaySecondArc();

}


void nightSky() {
  noStroke();
  // calculate how many minutes have passed since sunset
  int h;
  if (hour()>17) { 
    h = (hour()-18)*60;
    h += minute();
  } else {
    h = 360+(hour()*60);
    h += minute();
  }
  // map num of minutes to alpha value
  float t;
  if (h<60) {
    t = map( h, 0, 60, 0, 230 );
  } else {
    t = 230;
  }
  if (h>660) {
    t = map( h, 660, 720, 230, 0 );
  }
  // darken sky by alpha value
  tint(255, t);
  image(sky_tint, 0, 0);
  tint(255, 255);
}


void nightGrass() {
  noStroke();
  // calculate how many minutes have passed since sunset
  int h;
  if (hour()>17) { 
    h = (hour()-18)*60;
    h += minute();
  } else {
    h = 360+(hour()*60);
    h += minute();
  }
  // map num of minutes to alpha value
  float t;
  if (h<60) {
    t = map( h, 0, 60, 0, 230 );
  } else {
    t = 230;
  }
  if (h>660) {
    t = map( h, 660, 720, 230, 0 );
  }
  // darken grass by alpha value
  tint(255, t);
  image(grass_tint, 0, height-grass_tint.height);
  tint(255, 255);
}


void displayMoon() {

  // calculate how many seconds have passed since 9pm (sunset)
  int h;
  if (hour()>17) { 
    h = (hour()-18)*60;
    h += minute();
  } else {
    h = 360+(hour()*60); // convert hours into minutes
    h += minute();
    h *= 60; // convert minutes into seconds
    h += second();
  }
  // map number of seconds passed to an angle
  float a = map( h, 0, 43200, PI-(PI/6), TWO_PI+(PI/6.2) ); // 43200 is num of secsonds in 12 hours
  float x = (width*.5) + cos(a) * 500;
  float y = (height*.5) + sin(a) * 250;
  // display moon glow
  for (int i=moon.width; i<moon.width*8; i+= moon.width/8) {
    fill(255, 1);
    ellipse( x, y, i, i);
  }
  // display moon
  image(moon, x-(moon.width/2), y-(moon.height/2));
}


void displaySun() {
  // calculate how many seconds have passed since 9am (sunrise)
  int h;
  h = (hour()-6)*60; // convert hours into minutes
  h += minute();
  h *= 60; // convert minutes into seconds
  h += second();
  // map number of seconds passed to an angle
  float a = map( h, 0, 43200, PI-(PI/7.5), TWO_PI+(PI/7.4) );
  float x = (width*.5) + cos(a) * 500;
  float y = (height*.5) + sin(a) * 250;
  // display sun
  image(sunshine, x-(sunshine.width/2), y-(sunshine.height/2));
}


void displayHourArc() {
  int x = width/2 - 300;
  int y = height/2;
  float arc_start = PI+HALF_PI;
  float arc_stop = arc_start + map( hour()/2, 0, 12, 0, TWO_PI );
  stroke(255, 0, 0, 128);
  strokeWeight(10);
  noFill();
  arc(x, y, 100, 100, arc_start, arc_stop);
}


void displayMinuteArc() {
  int x = width/2;
  int y = height/2;
  float arc_start = PI+HALF_PI;
  float arc_stop = arc_start + map( minute(), 0, 60, 0, TWO_PI );
  stroke(0, 255, 0, 128);
  strokeWeight(10);
  noFill();
  arc(x, y, 100, 100, arc_start, arc_stop);
}


void displaySecondArc() {
  int x = width/2 + 300;
  int y = height/2;
  float arc_start = PI+HALF_PI;
  float arc_stop = arc_start + map( second(), 0, 60, 0, TWO_PI );
  stroke(0, 0, 255, 128);
  strokeWeight(10);
  noFill();
  arc(x, y, 100, 100, arc_start, arc_stop);
}


void drawNumber(int anumber, float offsetX) {
  fill(255);
  noStroke();
  String theText = str(anumber); // convert number to string
  textSize(20);  // normal font size
  float tw = textWidth(theText) * 0.5;
  float ta = 10; //textAscent() * 0.375;

  // draw text offset from the centre of the screen
  text(theText, width/2 - tw + offsetX, height/2 + ta);
}

