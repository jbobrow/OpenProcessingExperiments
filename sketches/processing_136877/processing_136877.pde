
//Clock
//By Joe Brennan
float seconds, minutes, hours;

void setup() {
  size(360, 360);
  smooth(16);
}

void draw() {
  background(144, 157, 87);
  seconds = second();
  minutes = minute();
  hours = hour();

  float secondRot = map(seconds, 0, 59, 0, 360);
  float hourRot = map(hours, 0, 23, 0, 360);
  float minuteRot = map(minutes, 0, 59, 0, 360);
  
  //SECONDS//

  pushMatrix(); // Left second circle
  noFill();
  stroke(87, 134, 157);
  ellipse(120, height/2, secondRot, secondRot);
  //stroke(0);
  strokeWeight(5);
  popMatrix();
  
  pushMatrix(); // Right Second circle
  noFill();
  strokeWeight(1);
  ellipse(240, height/2, secondRot, secondRot);
  popMatrix();
  
  pushMatrix(); // Center second circle
  strokeWeight(1);
  noFill();
  ellipse(width/2, height/2, secondRot, secondRot);
  popMatrix();
  
  //Minutes//
  
  pushMatrix();
  noFill();
  stroke(203, 78, 78);
  strokeWeight(1);
  ellipse(120, secondRot, minuteRot, minuteRot);
  noStroke();
  popMatrix();
  
  //HOURS//
  
  pushMatrix();
  noFill();
  stroke(255, 104, 15);
  strokeWeight(1);
  ellipse(240, secondRot, hourRot, hourRot);
  popMatrix();

  println("The current time is:" + (int)hours + ":" + (int)minutes + ":" + (int)seconds);
}



