
/* @pjs preload="grass.png, grass_tint.png, moon.png, sky.png, sky_tint.png, sun.png"; 
 */

PFont myFont;  // font data

PImage grass;
PImage grass_tint;
PImage sky;
PImage sky_tint;
PImage sunshine;
PImage moon;

float HALF_WIDTH;
float HALF_HEIGHT;

boolean user_edit_mode = false; // allows the user to wind the clock backwards and forwards
int adjuster = 1; // selects whether the hours, minutes or seconds can be adjusted

// declare objects
Time sunrise;
Time sunset;
Time time;

void setup() {
  size(1024, 600);
  // load images required
  grass = loadImage("grass.png");
  grass_tint = loadImage("grass_tint.png");
  sky = loadImage("sky.png");
  sky_tint = loadImage("sky_tint.png");
  sunshine = loadImage("sun.png");
  moon = loadImage("moon.png");
  // load and set the font
  myFont = loadFont("Frutiger65-Bold-200.vlw");
  textFont(myFont);
  // set global variables
  HALF_WIDTH = width*.5;
  HALF_HEIGHT = height*.5;
  // initialise objects
  sunrise = new Time(6, 0, 0);
  sunset = new Time(18, 0, 0);
  time = new Time();
} // end void setup()


void draw() {
  // display sky image
  image(sky, 0, 0);
  // darken sky between sunset and sunrise
  DarkenSky();
  // display sun and moon
  DisplaySunAndMoon();
  // display grass image
  image(grass, 0, height-grass.height);
  // darken grass between sunset and sunrise
  DarkenGrass();
  // if user has not selected edit mode
  if (!user_edit_mode) {
    time.UpdateNow();
  }
  time.DisplayNumbers();
  time.DisplayArcs();
  time.DisplayAdjuster();
} // end void draw()


void DarkenSky() {
  // tint sky by alpha value
  tint( 255, DayNightAlpha() );
  image(sky_tint, 0, 0);
  tint(255, 255);
} // end void DarkenSky()


void DarkenGrass() {
  // tint sky by alpha value
  tint( 255, DayNightAlpha() );
  image(grass_tint, 0, height-grass_tint.height);
  tint(255, 255);
} // end void DarkenGrass()


float DayNightAlpha() {
  float alpha_value=0;
  // darken tint from 1 hour before and up to sunset
  if (time.hours>sunset.hours-2 && time.hours<sunset.hours) {
    alpha_value = map( time.minutes, 0, 60, 0, 115 );
  }
  // darken tint from sunset until 1 hour later
  if (time.hours>sunset.hours-1 && time.hours<sunset.hours+1) {
    alpha_value = map( time.minutes, 0, 60, 115, 230 );
  }
  // keep tint dark between 1 hour after sunset and 1 hour before sunrise
  if (time.hours>sunset.hours || time.hours<sunrise.hours) {
    alpha_value = 230;
  }
  // lighten tint from 1 hour before and up to sunrise
  if (time.hours>sunrise.hours-2 && time.hours<sunrise.hours) {
    alpha_value = map( time.minutes, 0, 60, 230, 115 );
  }
  // lighten tint from sunset until 1 hour later
  if (time.hours>sunrise.hours-1 && time.hours<sunrise.hours+1) {
    alpha_value = map( time.minutes, 0, 60, 115, 0 );
  }
  return alpha_value;
} // end DayNight Alpha


void DisplaySunAndMoon() {
  // map number of seconds passed to an angle
  // angle+HALF_PI maps 6am to left hand side
  float a = map( seconds_since_midnight(), 0, 86399, 0, TWO_PI );
  float sun_x = HALF_WIDTH + (cos(a+HALF_PI) * (HALF_WIDTH-40));
  float sun_y = HALF_HEIGHT + 100 + (sin(a+HALF_PI) * (HALF_HEIGHT+40));
  float moon_x = HALF_WIDTH + (cos(a+PI+HALF_PI) * (HALF_WIDTH-40));
  float moon_y = HALF_HEIGHT + 100 + (sin(a+PI+HALF_PI) * (HALF_HEIGHT+40));
  // display sun
  image(sunshine, sun_x-(sunshine.width/2), sun_y-(sunshine.height/2));
  // display moon glow
  noStroke();
  for (int i=moon.width; i<moon.width*8; i+= moon.width/8) {
    fill(255, 1);
    ellipse( moon_x, moon_y, i, i);
  }
  // display moon
  image(moon, moon_x-(moon.width/2), moon_y-(moon.height/2));
} // end void DisplaySunAndMoon()


int seconds_since_midnight() {
  // calculate number of seconds passed since midnight
  int m = time.hours * 60;
  m += time.minutes;
  int s = m * 60;
  s += time.seconds;
  return s;
} // end seconds_since_midnight


void keyPressed() {
  // toggle user_edit_mode
  if (key==' ') {
    if (!user_edit_mode) {
      user_edit_mode = true;
    } else {
      user_edit_mode = false;
    }
  }

  // if user has selected edit mode then adjust the time
  if (user_edit_mode) {
    if (key==CODED) {
      // select which component to adjust when LEFT or RIGHT are pressed
      if (keyCode==LEFT) {
        time.adjuster--;
        if (time.adjuster<0) { 
          time.adjuster=2;
        }
      }
      if (keyCode==RIGHT) {
        time.adjuster++;
        if (time.adjuster>2) { 
          time.adjuster=0;
        }
      }
      // adjust time when UP or DOWN keys are pressed
      if (keyCode==UP) {
        time.Adjust(1);
      }
      if (keyCode==DOWN) {
        time.Adjust(-1);
      }
    }
  }
} // end void keyPressd()



class Time {
  // instance variables
  int hours;
  int minutes;
  int seconds;
  int adjuster;

  // constructor with passed variables
  Time( int h_, int m_, int s_ ) {
    // store supplied values in the instance variables
    hours = h_;
    minutes = m_;
    seconds = s_;
    adjuster = 1;
  } // end of constructor

  // constructor without passed variables
  Time() {
    hours = hour();
    minutes = minute();
    seconds = second();
    adjuster = 1;
  } // end of constructor

  void UpdateNow() {
    this.hours = hour();
    this.minutes = minute();
    this.seconds = second();
  } // end void UpdateNow()

  void DisplayNumbers() {
    fill(255);
    noStroke();
    textSize(32);
    // convert numbers to two character strings
    String theHour = nf(this.hours, 2);
    String theMinute = nf(this.minutes, 2);
    String theSecond = nf(this.seconds, 2);
    float hw = textWidth(theHour) * 0.5;
    float mw = textWidth(theMinute) * 0.5;
    float sw = textWidth(theSecond) * 0.5;
    float ta = textAscent() * 0.45;
    // draw text offset from the centre of the screen
    text(theHour, width/2 - hw -300, height/2 + ta);
    text(theMinute, width/2 - mw, height/2 + ta);
    text(theSecond, width/2 - sw +300, height/2 + ta);
  } // end void DisplayNumbers()

  void DisplayArcs() {
    stroke(255, 96);
    strokeWeight(20);
    noFill();
    int x = width/2 - 300;
    int y = height/2;
    float arc_start = PI+HALF_PI;
    float hour_arc_stop = arc_start + map( this.hours, 0, 23, 0, TWO_PI );
    float minute_arc_stop = arc_start + map( this.minutes, 0, 59, 0, TWO_PI );
    float second_arc_stop = arc_start + map( this.seconds, 0, 59, 0, TWO_PI );
    // hour arc
    arc(HALF_WIDTH-300, HALF_HEIGHT, 100, 100, arc_start, hour_arc_stop);
    // minute arc
    arc(HALF_WIDTH, HALF_HEIGHT, 100, 100, arc_start, minute_arc_stop);
    // second arc
    arc(HALF_WIDTH+300, HALF_HEIGHT, 100, 100, arc_start, second_arc_stop);
  } // end void DisplayArcs()

  void DisplayAdjuster() {
    // only display the adjuster if user edit mode is on
    if (user_edit_mode) {
      noStroke();
      fill(255, 128);
      switch(adjuster) {
      case 0:
        ellipse(HALF_WIDTH-300, HALF_HEIGHT, 50, 50);
        break;
      case 1:
        ellipse(HALF_WIDTH, HALF_HEIGHT, 50, 50);
        break;
      case 2:
        ellipse(HALF_WIDTH+300, HALF_HEIGHT, 50, 50);
        break;
      }
    }
  } // end void DisplayAdjuster()

  void Adjust( int amount ) {
    if (adjuster==0) {
      this.hours+=amount;
    }
    if (adjuster==1) {
      this.minutes+=amount;
    }
    if (adjuster==2) {
      this.seconds+=amount;
    }

    // keep components in bounds
    if (this.seconds>59) {
      this.minutes++;
      this.seconds=0;
    }
    if (this.seconds<0) {
      this.minutes--;
      this.seconds=59;
    }
    if (this.minutes>59) {
      this.hours++;
      this.minutes=0;
    }
    if (this.minutes<0) {
      this.hours--;
      this.minutes=59;
    }
    if (this.hours>23) {
      this.hours=0;
    }
    if (this.hours<0) {
      this.hours=23;
    }
  } // end void Adjust();
} // end class Time

