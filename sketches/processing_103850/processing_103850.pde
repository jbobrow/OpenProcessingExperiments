
// Timer for Time control
int cTimer = 0;
// Time
int hours = 12, minutes = 0, seconds = 0;
// Framerate
int fRate = 20;


void setup() {
  // Canvas setup
  size(600, 600);
  smooth(8);
  noFill();
  ellipseMode(CENTER);
  colorMode(HSB);
  frameRate(fRate);

  // Set current time
  seconds = second();
  minutes = minute();
  if (hour() > 12) hours = hour()-12;
  else hours = hour();
}


void draw() {
  float temp;
  
  // Time control
  if (cTimer%fRate == 0) {
    if (seconds == 59) {
      if (minutes == 59) {
        if (hours == 12) hours = 1;
        else hours++;
        minutes = 0;
      }
      else minutes++;
      seconds = 0;
    }
    else seconds++;
    //cTimer = 0;
  }

  // Canvas operations
  background(60, 100, 50);
  translate(width*0.5, height*0.5);

  // Main sphere
  strokeWeight(8);
  stroke(170, 120, 190);
  ellipse(0, 0, 500, 500);
  ellipse(0, 0, 30, 30);

  temp = (hours-1) * (TWO_PI/12);
  temp += (TWO_PI/12);
  pushMatrix();
  rotate(temp);
  
  // Number of hours on circle
  stroke(77, 140, 290);
  fill(77, 140, 290);
  strokeWeight(5);
  ellipse(0, -125, 40, 40);
  fill(360, 360, 360);
  textAlign(CENTER);
  textSize(30);
  text(hours, 0, -116);
  // Hours line
  strokeWeight(26);
  line(0, 0, 0, -100);
  
  popMatrix();

  // Move minutes line
  temp = (minutes-1) * (TWO_PI/60);
  temp += (TWO_PI/60);
  pushMatrix();
  rotate(temp);

  // Number of minutes on circle
  stroke(20, 190, 250);
  fill(20, 190, 250);
  strokeWeight(5);
  ellipse(0, -210, 40, 40);
  fill(360, 360, 360);
  textAlign(CENTER);
  textSize(26);
  text(minutes, 0, -202);
  // Minutes line
  noFill();
  strokeWeight(16);
  line(0, 0, 0, -190);
  
  popMatrix();

  // Move seconds line
  temp = (seconds - 1) * (TWO_PI/60);
  temp += (TWO_PI/60);
  pushMatrix();
  rotate(temp);
  
  // Number of seconds on circle
  stroke(0, 100, 100);
  fill(0, 100, 100);
  strokeWeight(4);
  ellipse(0, -170, 30, 30);
  fill(360, 360, 360);
  textAlign(CENTER);
  textSize(16);
  text(seconds, 0, -165);
  // Seconds line
  noFill();
  strokeWeight(5);
  line(0, 0, 0, -155);
  
  popMatrix();

  cTimer++;
}

