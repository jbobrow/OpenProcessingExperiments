
// This sketch builds on a prior work, "Project 2 (Clock 3)", created by Casey Reas
// http://ucla.sketchpad.cc/sp/pad/view/ro.4Kf$L3A64ciwk1/rev.2

int last_h;
int last_m;
int last_s;
int last_ms;



void setup() {
  size(640, 480);
  smooth();
  strokeCap(SQUARE);
}
void draw() {

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
  //h = map(h, 0, 24, 0, 1);
  //m = map(m, 0, 60, 0, 1);
  //ms = map(ms%1000, 0, 1000, 0, 1);
  //s = map(s, 0, 60, 0, 1);
  ms = ms%1000;
  background(245);
  if(h>12) {
    h -=12;
    background(25);
  }
  /*
  //millis
   int clock_width = (int)(width*ms);
   //centering offset
   int center_loff = int((width - clock_width )/2);
   //noStroke();
   // fill(0,0,210,50);
   fill(255,0);
   ellipse(center_loff + int(clock_width/2),height/2,clock_width,clock_width);
   */
  int clock_width, center_loff = 0;
  int xyscale = 0;
  if (mousePressed != true) {

    if(int(ms)/150 > 3) {
      xyscale = int(ms)/150;
    } 
    else {
      xyscale = 3 - int(ms)/150;
    }
  }

  //hours
  for(int k=0; k <h; k++) {
    clock_width = (int)(width/(h));
    //centering offset
    center_loff = int((width - int(h)*clock_width )/2);
    noStroke();
    fill(50,200);
    ellipse(center_loff + int(clock_width/2+clock_width*k),height/2,clock_width+xyscale,clock_width+xyscale);
  }

  //minutes
  for(int k=0; k <m; k++) {
    clock_width = (int)(width/(m));
    //centering offset
    center_loff = int((width - int(m)*clock_width )/2);
    noStroke();
    fill(150,140);
    ellipse(center_loff + int(clock_width/2+clock_width*k),height/2,clock_width+xyscale,clock_width+xyscale);
  }
  /*
   //seconds
   for(int k=0; k < s; k++) {
   clock_width = (int)(width/(s + ms/1000));
   //centering offset
   center_loff = int((width - int(s + ms/1000)*clock_width )/2);
   noStroke();
   fill(250,50);
   ellipse(center_loff + int(clock_width/2+clock_width*k),height/2,clock_width+xyscale,clock_width+xyscale);
   //println(s + ms/1000);
   }
   */

  //seconds w/o millis
  for(int k=0; k < s; k++) {
    clock_width = (int)(width/(s));
    //centering offset
    center_loff = int((width - int(s)*clock_width )/2);
    noStroke();
    fill(250,100);
    ellipse(center_loff + int(clock_width/2+clock_width*k),height/2,clock_width+xyscale,clock_width+xyscale);
    //println(s + ms/1000);
  }
}


