
/*
 * Clock - by Martin Herbert : 2nd July 2014
 * 
 * Background artwork Â© 2014 by Martin Herbert
 * 
 * Press 'd' for demo mode (reverses day & night)
 * Press 's' for screenshot
 *
 */
 
/* @pjs preload="sun.jpg"; 
 * @pjs preload="moon.jpg";
 */

 
boolean debug = false;
boolean demomode = false;

PFont cfont;
PImage bgimg;

boolean nloaded = false;

float Rsecs = 150 ;        // radius of 'seconds hand'
float Rmins = Rsecs/3*2 ;  // radius of 'minute hand'
float Rhours = Rsecs/3 ;   // hours circle

float trans1 = 140;        // transparency

color seclight = color(250, 214, 68, trans1);  // colours for hands
color secdark = color(232, 89, 0, trans1);
color minlight = color(255, 120, 82, trans1);
color mindark = color(245, 0, 4, trans1);
color hourcol = color(203, 0, 51);
color Nseclight = color(125, 176, 214, trans1); // night colours for hands
color Nsecdark = color(0, 25, 90, trans1);
color Nminlight = color(167, 247, 347, trans1);
color Nmindark = color(17, 50, 62, trans1);
color Nhourcol = color(0, 26, 13);
color fontcol = color(255,255,214);
color Nfontcol = color(229, 255, 253);

float centrex, centrey;    // clock centre
float dx, dy;              // make it float about a bit

void setup() {
  size(500, 500);
  centrex=width/2;
  centrey=height/2;
  dx=random(-0.1,0.1);
  dy=random(-0.1,0.1);
  cfont=loadFont("MyUnderwood-48.vlw");
  textFont(cfont);
  
}

void draw() {
  
  float angle=0;
  float h = hour();
  boolean night = false;
  color dcollsec, dcoldsec, dcollmin, dcoldmin, dcolhour, dcolfont;  // actual drawing colours

  // set up the background and colours depending on TOD
  if ( h >= 20 || h <= 8 ) night = true; else night = false;
  if (demomode) night = !night;
 
  if (night && !nloaded) {
    bgimg = loadImage("moon.jpg");
    nloaded = true;
  } else if (!night && nloaded) {
    bgimg = loadImage("sun.jpg");
    nloaded = false;
  }
  
  if (night) {
    dcollsec = Nseclight;
    dcoldsec = Nsecdark;
    dcollmin = Nminlight;
    dcoldmin = Nmindark;
    dcolhour = Nhourcol;
    dcolfont = Nfontcol;
  } else {
    bgimg = loadImage("sun.jpg");
    nloaded = false;
    dcollsec = seclight;
    dcoldsec = secdark;
    dcollmin = minlight;
    dcoldmin = mindark;
    dcolhour = hourcol;
    dcolfont = fontcol;
  }
  
  background(bgimg);
  noStroke();
  
  // get the new centre, making sure we stay on the screen and float around randomly
  centrex = centrex + dx;
  centrey = centrey + dy;
  if ( centrex < Rsecs || centrex > width-Rsecs ) {
    dx = -dx ; dy = random(-0.1,0.1);
  }
  if (centrey < Rsecs || centrey > height-Rsecs ) {
    dy = -dy ; dx = random(-0.1,0.1);
  }
  
  // draw the 'seconds hand'
  beginShape(QUAD_STRIP);
  for (int i=0 ; i<=60; i++) {
    float s = i + second();
    angle = PI - radians(s*6);
    color colSecs = lerpColor(dcoldsec, dcollsec, (float)i/60);
    noStroke();
    fill(colSecs);
    vertex(centrex+Rsecs*sin(angle), centrey+Rsecs*cos(angle));
    vertex(centrex, centrey);
  }
  endShape(CLOSE);
  
  // add the seconds figure
  fill(dcolfont);
  noStroke();
  textSize(20);
  String seconds = str(second());
  text(seconds, centrex + Rsecs*5/6*sin(angle-PI/16) - textWidth(seconds)/2, centrey + Rsecs*5/6*cos(angle-PI/16) + textAscent()/2 );
  
  // draw the 'minutes hand'
  beginShape(QUAD_STRIP);
  for (int i=0 ; i<=60; i++) {
    float s = i + minute();
    angle = PI - radians(s*6);
    color colMins = lerpColor(dcoldmin, dcollmin, (float)i/60);
    noStroke();
    fill(colMins);
    vertex(centrex+Rmins*sin(angle), centrey+Rmins*cos(angle));
    vertex(centrex, centrey);
  }
  endShape(CLOSE);
  
  // add the minutes figure
  fill(dcolfont);
  noStroke();
  textSize(24);
  String minutes = str(minute());
  text(minutes, centrex + Rsecs/2*sin(angle-PI/9) - textWidth(minutes)/2, centrey + Rsecs/2*cos(angle-PI/9) + + textAscent()/2 );
  
  // add the central hour circle
  fill(dcolhour);
  noStroke();
  ellipse(centrex, centrey, Rhours*2, Rhours*2);
  
  // and the figure
  fill(dcolfont);
  noStroke();
  textSize(36);
  String hours = str(hour());
  text(hours, centrex-textWidth(hours)/2, centrey+textAscent()*0.4);

}

void keyPressed() {
  if ( key == 'd' ) demomode = !demomode;
  else if (key == 's') saveFrame("MHclock.jpg");
}
    


