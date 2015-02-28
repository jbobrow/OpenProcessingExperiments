
// This sketch builds on a prior work, "Project 2 (Clock 3)", created by Casey Reas
// http://ucla.sketchpad.cc/sp/pad/view/ro.4Kf$L3A64ciwk1/rev.2

int bgColor = 253;

void setup() {
  size(640, 480);
  smooth();
  strokeCap(SQUARE);
}

void drawClock(int x, int y, int diam, int alph, float h, float m, float s, float ms) {

  int clock_diameter = diam;
  int alpha_val= alph;

  // line proportions
  float hour_width = .3;
  float minute_width = .15;
  float second_width = .05;
  float milli_width = .01;


  // Move to the center of the screen
  pushMatrix();
  translate(x, y);

  // Draw the hour arc
  pushMatrix();
  stroke(0,alpha_val);
  fill(bgColor);
  rotate(radians(-90));
  strokeWeight(hour_width*clock_diameter);
  float arc_radius = clock_diameter;
  arc(0, 0,  arc_radius, arc_radius, 0,(h*2*PI));
  popMatrix();

  // Draw the minute arc
  pushMatrix();
  stroke(60,alpha_val);
  fill(bgColor);
  strokeWeight(minute_width*clock_diameter);
  rotate(radians(-90));
  arc_radius -= (hour_width*clock_diameter + minute_width*clock_diameter);
  arc(0, 0, arc_radius, arc_radius, 0,(m*2*PI));
  popMatrix();

  // Draw the second arc
  pushMatrix();
  strokeWeight(second_width*clock_diameter);
  rotate(radians(-90));
  fill(bgColor);
  stroke(110,alpha_val);
  arc_radius -= minute_width*clock_diameter + second_width*clock_diameter;
  arc(0, 0, arc_radius, arc_radius, 0,(s*2*PI));
  popMatrix();

  // Draw the milli arc
  pushMatrix();
  strokeWeight(milli_width*clock_diameter);
  rotate(radians(-90));
  fill(bgColor);
  stroke(255,0,0,alpha_val);
  arc_radius -= second_width*clock_diameter + milli_width*clock_diameter;
  arc(0, 0, arc_radius, arc_radius, 0,(ms*2*PI));
  popMatrix();

  // pop circle translation
  popMatrix();
}

void draw() {

  background(bgColor);

  import java.text.DateFormat;
  import java.text.SimpleDateFormat;
  import java.util.Calendar;

  DateFormat formatter = new SimpleDateFormat("SSS");
  // Get date and time information in milliseconds
  long now = System.currentTimeMillis();
  // Create a calendar object that will convert the date and time value
  // in milliseconds to date. We use the setTimeInMillis() method of the
  // Calendar object.
  Calendar calendar = Calendar.getInstance();
  calendar.setTimeInMillis(now);


  // Get values from the system clock
  float h = hour();
  float m = minute();
  float s = second();

  //GET A MILLI A MILLI A MILLI (seconds)
  float ms = Float.parseFloat(formatter.format(calendar.getTime()));

  // Map time elements to fractions
  h = map(h, 0, 24, 0, 1);
  m = map(m, 0, 60, 0, 1);
  ms = map(ms%1000, 0, 1000, 0, 1);
  s = map(s, 0, 60, 0, 1);

  //void drawClock(int x, int y, int diam, int alph, float h, float m, float s, float ms)
    drawClock(width/2,height/2,250,150,h,m,s,ms);

}

