
//Inspired by the Dream Machine by Brian Gysin, 195-whenever
//Written by Chris Parsell, 4/1/2012    chris.p.parsell@gmail.com
//I'm interested to hear reports of results
//If any tweaks to the code enhance results, let me know. 

//Oh and beware that these patterns can cause epileptic seizures
//in anyone who's succeptible. Estimated 1 in 10,000 have it.

int interval = 125;
int state = 0;
int on = 0;

void setup() {
  size(1920, 1080);
  frameRate(35);
}

void draw() {
  if (on ==1) {
    if (state == 0) {  
      fill(0);
      rect(0, 0, width, height);
      delay(interval);
      state = 1;
    }
    else if (state == 1) {
      fill(255, 220, 200);
      rect(0, 0, width, height);
      delay(interval);
      state = 0;
    }
    fill(0);
  }
  text ("Hit 'enter' to begin. Turn all other lights off and close eyes while viewing.", 10, 100);
  text("Interval: " + interval, 10, 200);
  text(on, 10, 250);
}

void keyPressed()
{
  switch(keyCode)
  {
  case UP:
    if (interval < 500) {
      interval+= 10;
    }
    break;
  case DOWN:
    if (interval > 10) {
      interval-= 10;
    }
    break;
  case ENTER:
      on = 1;
    break;
  }
}


