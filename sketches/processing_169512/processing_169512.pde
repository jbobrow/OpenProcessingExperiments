


void setup() {
  textFont( createFont("courier", 240));

  frameRate(40);

  size(800, 300);
}

int timeInSeconds = -1;
int tick = 0;

void draw() {
  background(0);

  if (timeInSeconds>0) {
    fill(0, 225, 0);
    if (tick++ >70) {
      tick=0;  
      timeInSeconds--;
    }
    else {
      tick++;
    }
  }

  if (timeInSeconds == 0 && playsound) {
    fill(255, 0, 0);

  }

  text( getFormattedTime(timeInSeconds), 40, height-100 );
}
void keyPressed() {

  if (key == ' ') {
    fill(255);
    timeInSeconds=-1;
  }

  if ( key == '1') {
    timeInSeconds+=60;
  }
  else if ( key == '2') {
    timeInSeconds+=60*2;
  }
  else if ( key == '3') {
    timeInSeconds+=60*3;
  }
  else if ( key == '4') {
    timeInSeconds+=60*4;
  }
  else if ( key == '5') {
    timeInSeconds+=60*5;
  }
  else if ( key == '6') {
    timeInSeconds+=60*6;
  }
  else if ( key == '7') {
    timeInSeconds+=60*7;
  }
  else if ( key == '8') {
    timeInSeconds+=60*8;
  }
  else if ( key == '9') {
    timeInSeconds+=60*9;
  }
  else if ( key == 't') {
    timeInSeconds+=10;
  }
}



private String getFormattedTime( int timeInSeconds ) {
  if (timeInSeconds == -1) {
    return "--:--";
  }
  int SECONDS_IN_MIN  = 60;
  int numberOfMinutes   = 0;

  boolean done=false;
  while ( !done ) {
    if (timeInSeconds - SECONDS_IN_MIN > 0 ) {
      timeInSeconds -= SECONDS_IN_MIN;
      numberOfMinutes++;
    }
    else {
      done=true;
    }
  }
  String numberOfMinutesStr="";
  if (numberOfMinutes<10) {
    numberOfMinutesStr= "0" + numberOfMinutes;
  }
  else {
    numberOfMinutesStr = ""+numberOfMinutes;
  }
  String timeInSecondsStr="";
  if (timeInSeconds<10) {
    timeInSecondsStr= "0" +timeInSeconds;
  }
  else {
    timeInSecondsStr = ""+timeInSeconds;
  }
  return numberOfMinutesStr+ ":"+timeInSecondsStr;
}

