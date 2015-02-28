

int hours;
int minutes;
int seconds;


void setup() {
  size(500, 500);
  colorMode(HSB, 60);
  background(0, 0,90);
  smooth();
}

void draw() {
 
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
 
 background(0, 0, 90);
 
    // center sketch
  translate(250,250);
  rotate(radians(90));
  noFill();
  
  //hour circle
  fill (hours * 5, 42, 40);
  ellipse (0,0, 405, 405);
  
  //minute circle
  fill ( minutes, 42, 40);
  ellipse (0,0, 290, 290);
  pushMatrix ();
  popMatrix ();

// second cirle
 fill (seconds, 42, 40);
  ellipse (0,0, 180, 180);
  pushMatrix ();
  popMatrix ();
  
    // hour hand
  strokeWeight(8);
  stroke(15);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(0,0, -200,0);
  popMatrix();
  
  
    // minute hand
  strokeWeight(6);
  stroke(30);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,0, -144,0);
  popMatrix();
  
    // second hand
  strokeWeight(4);
  stroke(40);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -90,0);
  popMatrix();
  
}

