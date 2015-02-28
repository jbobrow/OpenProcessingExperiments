
// There's probably an easier solution to dealing with ellipses having their 0 degree starting point at the rightmost point of the shape. If you have a solution, please let me know!

int radius = 300;

void setup() {
  size(600, 600);
  frameRate(1); // Clocks don't need more than 1 FPS
  colorMode(HSB, 360, 100, 100);

  textAlign(CENTER);
  textSize(radius/7);
  fill(0, 0, 0);
  text("Kristian's Colour Wheel Clock", width/2, height/6);
  textSize(radius/20);
  text("The handles change hue according to placement in the colour wheel!", width/2, height/(PI+(PI/2)));
}

void draw() {
 
// CLOCK CIRCLE
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 100); // White
  ellipse(width/2, height/2, radius, radius); // Clock circle

// CLOCK NUMBERS
  fill(0, 100, 0); // Black
  for (int i = 0; i<360; i+=360/12) {

// GUI number coordinates
    float hourX = width/2 + cos(radians(i-60))*(radius-175);
    float hourY = height/2 + sin(radians(i-60))*(radius-175);

// Displayed numbers - conversion from 0-360 to 1-12
    textSize(radius/12);
    textAlign(CENTER, CENTER);
    int clockNumber = i/30+1;
    text(clockNumber, hourX, hourY);
  }

// Those small lines in between the numbers
  float coord = 360/60;
    for (int i = 0; i<=360; i+=coord) {
    float lineX = width/2 + cos(radians(i))*145;
    float lineY = height/2 + sin(radians(i))*145;
    int innerRadius = 150;    
    line(width/2+cos(radians(i))*innerRadius, height/2+sin(radians(i))*innerRadius, lineX, lineY);
  }

// SECONDS
  int offset = 90; // Because the circle uses its rightmost part as its 0 degree base.
  float secAngle = map(second(), 0, 60, 0, 360); // Map seconds from 0-60 to 0-360
  stroke(secAngle, 100, 100);
  line(width/2, height/2, width/2+cos(radians(secAngle-offset))*radius/3, height/2+sin(radians(secAngle-offset))*radius/3);

// MINUTES
  float minAngle = map(minute(), 0, 60, 0, 360);
  stroke(minAngle, 100, 100);
  strokeWeight(5);
  line(width/2, height/2, width/2+cos(radians(minAngle-offset))*radius/3.5, height/2+sin(radians(minAngle-offset))*radius/3.5);

// HOURS
  if (hour() <= 12) {
    float hourAngle = map(hour(), 0, 12, 0, 360) + minAngle/12;
    stroke(hourAngle, 100, 100);
    line(width/2, height/2, width/2+cos(radians(hourAngle-offset))*radius/5, height/2+sin(radians(hourAngle-offset))*radius/5);
  }
  else {
    float hourAngle = map(hour(), 12, 24, 0, 360) + minAngle/12;
    stroke(hourAngle, 100, 100);
    line(width/2, height/2, width/2+cos(radians(hourAngle-offset))*radius/5, height/2+sin(radians(hourAngle-offset))*radius/5);
  }
}
