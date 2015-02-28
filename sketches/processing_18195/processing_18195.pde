
void setup() {
  size(400,400);
  frameRate(30);
  background(255);

}
void draw() { 

 drawClock();
}
void drawClock() {
   float myHour = hour();
 float myMinute = minute();
 float mySecond = second();
  
  float myMinRad = (TWO_PI*myMinute)/60;
  float myHourRad = (TWO_PI*myHour)/24;
  float mySecRad = (TWO_PI*mySecond)/60;

  noStroke();
  fill(50);
  arc(200, 200, 350, 350, 0, myHourRad);
  fill(255);  
  ellipse(200, 200, 300, 300);
  fill(100);
  arc(200, 200, 250, 250, 0, myMinRad); 
  fill(255);
  ellipse(200, 200, 200, 200);
  fill(150);
  arc(200, 200, 150, 150, 0, mySecRad); 
  fill(255);
  ellipse(200, 200, 100, 100);
}

