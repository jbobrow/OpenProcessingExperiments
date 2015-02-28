

int hours;
int minutes;
int seconds;



void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(344, 11, 13);
  strokeCap(SQUARE);
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
 // back ground black
 background(344, 42, 0);
 
    // center sketch
  translate(300,300);
  rotate(radians(90)); // movng the grid to make the radian vertical
  noFill();
  
 // white hour circle
  noStroke();
  fill(0, 0, 90);
  ellipse(0,0, -180,180);
 
 // hour hand black
  strokeWeight(8);
  stroke(344, 41, 0);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees  , **360degrees/12hours=30 degrees ( so its the incriment)
  line(0,0, -91,0);
  popMatrix();
 
   
//minute hand white
  strokeWeight(6);
  stroke(0, 0, 90);
  pushMatrix();
  line(-100,0, -50,0);
  popMatrix();
  
// second hand white
  strokeWeight(2);
  stroke(0, 0, 90);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-100,0, -140,0);
  popMatrix();
  
}

  
 

