
int hours;
int minutes;
int seconds;

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
   background(0);
  strokeCap(ROUND);
  smooth();
}

void draw() {
 
 hours = hour();
 minutes = minute();
 seconds = second();
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12;
  }
 
 background(0);
 
 // center sketch
  translate(250,250);
  rotate(radians(90));
  noStroke();
 ellipse(0,0,seconds*8,seconds*8); // ellipse center expanding sketch
 fill(seconds, 100, 100);
  
   // hour hand
  strokeWeight(10);
  stroke(seconds, 100, 100);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  stroke(seconds, 100, 80);
  line(0,0, -75,0);
  popMatrix();
  
   // minute hand
  strokeWeight(6);
  stroke(seconds, 100, 50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,0, -125,0);
 stroke(seconds, 50, 50);
  popMatrix();
  
   // second hand
  strokeWeight(4);
  stroke(seconds, 50, 30);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -160,0);
 stroke(seconds, 100, 80);
  popMatrix();
   
  noStroke(); 
  if( seconds ==30) {
  ellipse(200,0,20,20); // 30 seconds sign
 fill(seconds, 100, 100);
  }
  else if (seconds ==15) {      
  ellipse(0,-200,20,20); // 15 seconds sign
  fill(seconds, 100, 100);
  } 
  else if (seconds ==45) {
  ellipse(0,200,20,20); // 45 seconds sign
  fill(seconds, 100, 100);
  }
  else if (seconds ==0) {
  ellipse(-200,0,20,20); // 60 seconds sign
  fill(seconds, 100, 100);
  }
 
}
  

