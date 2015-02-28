
float w, h;//middle of the screen

void setup() {
  size(300, 300); 
  background(0);//make background black
  frameRate(12);//no need of speed
  smooth();
  strokeWeight(20);
  strokeCap(SQUARE);
  noFill();
  w = width / 2;
  h = height / 2;
}


void draw() { 
  background(0);
  //ellipse(width / 2, height / 2, second(), second());
  
  /*
  * Since 360/60 is 6 multiply the second() function by 6
  * to get 360 for a full circle in 60 seconds
  */
  //second hang
  stroke(#FF1C1C);
  hand(new PVector(w, h), 200, radians(second()*6)); 
  
  /*
  * Since 360/60 is 6 multiply the minute() function by 6
  * to get 360 for a full circle in 60 minutes
  */
  //minute hand
  stroke(#FFEB03);
  hand(new PVector(w, h), 160, radians(minute()*6));
  
  /*
  * Since 360/24 is 15 multiply the hour() function by 6
  * to get 360 for a full circle in 24 hours
  */
  stroke(#00B5D3);
  hand(new PVector(w, h), 120, radians(hour()*15));
  
}

void hand(PVector loc, float radius, float angle){
  
  //start the arc from angle 0 to what the angle
  //variable(parameter) will be
  arc(loc.x, loc.y, radius, radius, 0, angle);
}
