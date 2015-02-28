
// A 24 hour clock
// Inspired from http://blog.pixelbreaker.com/polarclock/

Ring millisecondsRing;
Ring secondsRing;
Ring minutesRing;
Ring hoursRing;

boolean showMilliseconds = false;

PFont f;
SimpleDateFormat sdf;

void setup() {
  size(500, 500);
  
  int x = width/2;
  int y = height/2;
  
  float w = width/4.0;
  float h = height/4.0;
  float o = ((float)min(h,w)/100.0)*5.0;

  float irw = 0;
  float orw = w;  
  millisecondsRing = new Ring(x, y, irw+o, orw-o, TWO_PI, color(255, 0, 255, 255));

  irw = w;
  orw = 2*w;
  secondsRing = new Ring(x, y, irw+o, orw-o, TWO_PI, color(255, 0, 0, 255));
  
  irw = orw;
  orw = 3*w;
  minutesRing = new Ring(x, y, irw+o, orw-o, TWO_PI, color(0, 255, 0, 255));

  irw = orw;
  orw = 4*w;
  hoursRing = new Ring(x, y, irw+o, orw-o, TWO_PI, color(0, 0, 255, 255));

  f = loadFont("!CRASSROOTSOFL-48.vlw");
  textFont(f);
  textAlign(CENTER, CENTER);
  
  sdf = new SimpleDateFormat("EEEE");
  noStroke();
  background(0);
}

void draw() {
  fade();
  Calendar c = Calendar.getInstance();
  if (showMilliseconds) {
    updateMilliseconds(c);
  }
  updateSeconds(c);
  updateMinutes(c);
  updateHours(c);

  if (showMilliseconds)
  {
    millisecondsRing.draw();
  }
  secondsRing.draw();
  minutesRing.draw();  
  hoursRing.draw();
}

void updateMilliseconds(Calendar c) {
  int ms = c.get(Calendar.MILLISECOND);
  float t = float(ms);
  millisecondsRing.angle = (t)*(2.0*PI/1000.0);
}

void updateSeconds(Calendar c) {
  int ms = c.get(Calendar.MILLISECOND);
  int s = c.get(Calendar.SECOND);
  float t = float(ms)/1000.0 + s;
  secondsRing.angle = (t)*(2.0*PI/60.0);
}

void updateMinutes(Calendar c) {
  int m = c.get(Calendar.MINUTE);
  int s = c.get(Calendar.SECOND);
  float t = float(s)/60.0 + m;
  minutesRing.angle = (t)*(2.0*PI/60.0);
}

void updateHours(Calendar c) {
  int h = c.get(Calendar.HOUR_OF_DAY);
  int m = c.get(Calendar.MINUTE);
  float t = float(m)/60.0 + h;
  hoursRing.angle = (t)*(2.0*PI/24.0);
}

void fade() {
  noStroke();
  rectMode(CORNER);
  fill(0, 10);
  rect(0,0,width,height);
}

void keyPressed()
{
  if (key == ' ')
  {
    showMilliseconds = !showMilliseconds;
  }
}

