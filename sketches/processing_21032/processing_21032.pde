


int hours;
int minutes;
int seconds;


void setup() {
  size(850, 850);
  colorMode(HSB, 100);
  background(0);
  strokeCap(SQUARE);
  smooth();
}

void draw() {
 
   // variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
 
 background(0);
 
    // center 
  translate(425,425);
  rotate(radians(90));
  noFill();
  
      // circle
  noStroke();
  fill(0, 30, 100);
  ellipse(0,0, -800,800);
  
    // circle 2
  noStroke();
  fill(0);
  ellipse(0,0, -780,780);

    // second hand
  strokeWeight(400);
  stroke(0);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -420,0);
  popMatrix(); 

    // circle 3
  noStroke();
  fill(0, 100, 100);
  ellipse(0,0, -200,200);
  
     // circle 4
  noStroke();
  fill(60, 40, 100);
  ellipse(0,0, -760,760);
  
    // minute hand
  strokeWeight(160);
  stroke(0);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,0, -382,0);
  popMatrix();
  
     // circle 5
  noStroke();
  fill(0);
  ellipse(0,0, -740,740);
  
     // circle 6
  noStroke();
  fill(0, 0, 100);
  ellipse(0,0, -720,720);
 
       // circle 7
  noStroke();
  fill(0);
  ellipse(0,0, -700,700);

    // hour hand
  strokeWeight(100);
  stroke(0);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(0,0, -362,0);
  popMatrix();
}



