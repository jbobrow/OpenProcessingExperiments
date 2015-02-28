
int hours;
int minutes;
int seconds;
  
void setup() {
  size(600, 600);
  background(0);

}

void draw() {
 
 hours = hour(); 
 minutes = minute();
 seconds = second();
    
  if(hours > 12) {
   hours -= 12; 
  }
 
 //clock face 
 fill(255, 255, 95);
 ellipse(300, 300, 360, 360);
 translate(300,300);
 rotate(radians(90));

 //pulsing seconds
 for (int seconds=0; seconds < 59; seconds++);
    fill(255, 0, 0, 3*seconds);
    noStroke();
    ellipse(0, 0, 6*seconds, 6*seconds);
  
  //hour hand
  strokeWeight(9);
  stroke(0);
  pushMatrix();
  rotate(radians(30*hours));  
  line(0,0, -100,0);
  popMatrix();
  
  //minute hand
  strokeWeight(7);
  stroke(0);
  pushMatrix();
  rotate(radians(6*minutes));
  line(0,0, -180,0);
  popMatrix();
 
  
}

