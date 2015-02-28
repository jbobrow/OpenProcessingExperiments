
// Analogue Clock
// Adpation from the processsing Demo clock
// By Colin Bacon Dec 2011


int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
float s = second();  // Values from 0 - 59
float m = minute();  // Values from 0 - 59
float h = hour();    // Values from 0 - 23

void setup() {
size(400, 400);
stroke(255);
int radius = min(width, height) / 2;
secondsRadius = radius * 0.72;
minutesRadius = radius * 0.60;
hoursRadius = radius * 0.50;
clockDiameter = radius * 1.8;
  
}
void draw() {
  
//Setup background and rotate hands  
  background (100,50,100);
  strokeWeight(1);
  translate(width/2, height/2);
  
  //Remap the position of all hands  
  s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  println (second()  ); 
  
 
  //Re-Draw the clock background
  fill(55,0,100);
  ellipse(cx, cy, clockDiameter, clockDiameter);
    
  // Re-Draw the minute ticks
  strokeWeight(1);
    
 beginShape(POINTS);
    for (int z = 0; z < 360; z+=6) {
     float u = cx + cos(radians(z)) * secondsRadius;
     float v = cy + sin(radians(z)) * secondsRadius;
     stroke(155,100,100);
     strokeWeight(1);
     vertex(u, v);
     } 
   endShape(); 
  
  // Re-Draw the hands of the clock
  stroke(155);
  strokeWeight(1);
  line(cx, cy, cx + cos(s ) * secondsRadius, cy + sin(s ) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  }




