
void setup() {
   size(320,320); 
   frameRate(1);
   
}

void draw() {
 background(255);
 
  int mySecond = second();  // Values from 0 - 59
  int myMinute = minute();  // Values from 0 - 59
  int myHour = hour();    // Values from 0 - 23
 
  noStroke();
  fill(0, 204, 0, 80);
  triangle(30, 75, 58, 20, myHour*7, myHour*7);
 
  noStroke();
  fill(255, 0, 0, 80);
  ellipse(164, 165, myMinute*5, myMinute*5);
 
  noStroke();
  fill(random(255), random(255), random(255), 95);
  rect(0, 0, 320, mySecond*5);
 

  
}

