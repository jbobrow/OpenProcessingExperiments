
/*
 * reverseTimer
 * created by @nomadiccreature (/twitter)
 * Reverse minute timer with minimalist design
 * Exploring processing #Sketch1
 * 
 */


float s = 200;
float x = 300;
float y = 300;
int savedTime;
//totalTime before reset (1 min= 60sec = 60000 millis)
int totalTime = 60000;

void setup(){
  size(600,600);
  savedTime = millis();
}

void draw(){
  background(0);
  timer();
}

void timer(){
  //totalTime before reset (1 min= 60sec = 60000 millis)
  int passedTime = millis() - savedTime;
  background(25, 22, 21);
  
  fill(81, 69, 68);
  noStroke();
  ellipse(x,y,s,s);
  
  float m = passedTime;
  float angle = (m/9570);
  float tempX= x+(s/2)*sin(angle);
  float tempY= y+(s/2)*cos(angle);
  stroke(255);
  line(x,y,tempX,tempY);
  
  fill(255);
  String countdownMsg = "" + int(passedTime/1000);
  textSize(20);
  text(countdownMsg, 350, 290, 90, 90);
  if (passedTime > totalTime) {
    savedTime = millis(); // Save the current time to restart the timer!
  }
}
