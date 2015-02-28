
/*  
 * author: John Philip Schnake
 * september 2012
 * HvA - Computional Design
 */

int centerX;
int centerY;
int radius;
int c1;
int c2;
int c3;
int c4;

void setup() {
  textSize(40); 
  size(360, 360);
  stroke(255);
  frameRate(1);
  
  centerX = width / 2;
  centerY = height / 2;
  radius = min(width, height) / 2;
}

void draw() {
  background(0);
  fill(255);

// Digital Clock
  // Allignment CENTER / RIGHT / LEFT
  textAlign(CENTER); 
  
  text(nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2), (width / 2), height / 1.1);
  
// Analog Clock
  c1 = int(random(255));
  fill(c1);
  // Sorounding of the clock
  ellipse(centerX, centerY, 200, 200);
 
  // Center point of the clock
  if(c1 > 127){
         c2 = int(random(0, 127));
    } else{
         c2 = int(random(128, 255));
    }
  fill(22);
  ellipse(centerX, centerY, 10, 10);
  
  // Draw the clock hands
  // START QUOTE
  // Author: http://processing.org/learning/basics/clock.html

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  strokeWeight(4);
  // Draw the hands of the clock
  line(centerX, centerY, centerX + cos(s) * radius / 2, centerY + sin(s) * radius / 2);
  line(centerX , centerY, centerX + cos(m) * radius / 2.5, centerY + sin(m) * radius / 2.5);
  line(centerX , centerY, centerX + cos(h) * radius / 3, centerY + sin(h) * radius / 3);
  // END QUOTE

    addSecond();
    addMinute();
    addHour();
}

// Add a second conter as a bar on the left side
void addSecond(){
    fill(255);
    rect(0,second() * 6 ,50,5);
}
// Add a minute counter as a bar on the right side
void addMinute(){
    rect(310,minute() * 6 ,50,10);
}
// Add a hour counter on top
void addHour(){
    rect(hour() * 15, 0 ,20,50);
}
