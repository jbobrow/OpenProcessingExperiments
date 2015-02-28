
// Digital Stop watch by Charles Cave
// 2nd September 2010

// T/t - start(restart after pause) timing
// S/s - stop (pause) timing 
// C/c - reset (clear) to zero

// each time the start timing is selected, store the millis() value as startTime
// so the total ellapsed time is accumTime + (millis() - startTime)
// when the clock is started set StartTime = millis()
// when the clock is stopped set accumTime = millis() - startTime
// the millis() function returns the milliseconds elapsed since the applet has been running

int accumTime;   // total time accumulated in previous intervals
int startTime;   // time when this interval started
boolean running = false;
int displayTime;   // value to display on the clock face

PFont smallfont;

void draw() {
  background(36, 19, 25);
  int thisTime = millis();
  int dHours, dMins, dSecs, dDecimal;
  
  if (keyPressed) {
      if ((key == 'c') || (key == 'C')) { 
        // clear the time and stop the clock
        accumTime= 0;
        displayTime = 0;
      }
      if ((key == 't') || (key == 'T')) { 
        // start timing (but only if running == false)
        if (running == false) {
            startTime = millis();
            running = true;
        }
      }
      if ((key == 's') || (key == 'S')) {
          // stop timing, but do not clear
          if (running == true) {
            println ("Stopped at " + thisTime);
            running = false;
            accumTime = accumTime + millis() - startTime;
          }
      }
    }
    if (running == true) {
          displayTime = accumTime + millis() - startTime;
    }
  
   dSecs = (displayTime / 1000) % 60;
   dMins = (displayTime / 1000 / 60) % 60;
   dHours = (displayTime / 1000 / 60/ 60);
    
    text(nf(dHours,2) + ":" + nf(dMins, 2) + ":" + nf(dSecs, 2), 
      width/2, height/2 + 40);
}

void setup() {
  size(550,220);
  smooth();
  frameRate(20);
  smallfont = loadFont("LiquidCrystal-128.vlw");
  textFont(smallfont);   
  textSize(128);
  textAlign(CENTER);
  fill(202, 35, 55);
  
}

