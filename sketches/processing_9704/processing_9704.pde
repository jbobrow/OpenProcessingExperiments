
/*
int cx, cy;
 float secondsRadius;
 float minutesRadius;
 float hoursRadius;
 float clockDiameter;
 */

boolean showHelp = false;

int barheight = 10;
int barmargin = 20;
int step = barheight + barmargin;
int i = 0;
int ms_lastframe = 0;
int ms_actual = 0;
int ms_cframe = 0;  
int s_lastframe = 0;

void setup() {
  ms_lastframe = millis();
  size(550, 250);
  //smooth();
  barheight = height/4;
  barmargin = 0;
  step = barheight + barmargin;
  
  noStroke();
  /*  
   int radius = min(width, height) / 2;
   secondsRadius = radius * 0.72;
   minutesRadius = radius * 0.60;
   hoursRadius = radius * 0.50;
   clockDiameter = radius * 1.8;
   */
  frameRate(50);  
}

void draw() {  
  colorMode(RGB, 360);

  ms_cframe = millis();
  background(255);  
  i = 0;

  if (s_lastframe != second()) {
    //println((s_lastframe != second()));
    ms_actual = ms_cframe - ms_lastframe;
  } 
  else {
    ms_actual += ms_cframe - ms_lastframe;
  }
  //  println (ms_actual);

  colorMode(HSB, 360, 100, 100);
  float cm; // colour map
  color c1; // color reference
  
  // sekund
  cm = map(ms_actual, 0, 1000, 0, 60);
  c1 = color(cm,100,100);
  fill(c1);
  rect(0,step*i,width,barheight);
  i++;

  // minut
  cm = map(second()*1000 + ms_actual, 0, 1000*60, 60, 120);
  c1 = color(cm,100,100);
  fill(c1);
  rect(0,step*i,width,barheight);
  i++;

  // time
  cm = map(second()*1000 + minute()*60*1000 + ms_actual, 0, 60*60*1000, 120, 240);
  c1 = color(cm,100,100);
  fill(c1);
 rect(0,step*i,width,barheight);
  i++;

  // døgn
  cm = map(second()*1000 + minute()*60*1000 + hour()*60*60*1000 + ms_actual, 0, 24*60*60*1000, 240, 360);
  c1 = color(cm,100,100);
  fill(c1);
  rect(0,step*i,width,barheight);
  i++;

  ms_lastframe = ms_cframe;
  s_lastframe = second();
  
  if (showHelp) {
    int w = 180;
    int h = 100;
    int x = width/2 - w/2;
    int y = height/2 - h/2;
    colorMode(RGB, 255);
    stroke(255);
    fill(0, 175);
    rect(x, y, w, h);
    String helptext = "Sekund: Rød-gul\nMinut: Gul-grøn\nTime: Grøn-Blå\nDøgn: Blå-rød";
    fill(255);
    text(helptext, x+10, y+10, w-10, h-10);
    noStroke();
  }
  
  /*
  background(0);
   
   // Draw the clock background
   fill(80);
   noStroke();
   ellipse(cx, cy, clockDiameter, clockDiameter);
   
   // Angles for sin() and cos() start at 3 o'clock;
   // subtract HALF_PI to make them start at the top
   float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
   float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
   float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
   
   // Draw the hands of the clock
   stroke(255);
   strokeWeight(1);
   line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
   strokeWeight(2);
   line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
   strokeWeight(4);
   line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
   
   // Draw the minute ticks
   strokeWeight(2);
   beginShape(POINTS);
   for (int a = 0; a < 360; a+=6) {
   float x = cx + cos(radians(a)) * secondsRadius;
   float y = cy + sin(radians(a)) * secondsRadius;
   vertex(x, y);
   }
   endShape();
   */

}

void mouseReleased() {
  if(showHelp == false) {
    showHelp = true;
  }
  else if (showHelp == true) {
    showHelp = false;  
  }
}


