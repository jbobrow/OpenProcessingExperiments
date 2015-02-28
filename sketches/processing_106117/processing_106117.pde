
/*

HOW TO READ THIS CLOCK?
OBVIOUSLY, THE OUSIDE MOVING ROUND IS FOR SECOND;
SO HOW TO FIGURE OUT WHICH LINE IS HOUR AND WHICH IS MINUTE?
OKAY, TRY TO DRAW A CLOCKWISE CIRCLE INSIDE THE BLACK ARC
THE END OF CLOCKWISE POINTS TO HOUR
THE START OF CLOCKWISE POINTS TO MINUTE
*/

float Asecond;
float GoSecond;
float Aminute;
float Ahour;


void setup() {
  size(500, 500);
  background(255);
  smooth();

  frameRate(30);
  GoSecond=Asecond;
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  Aminute = map(minute(), 0, 60, 0, TWO_PI);
  if (hour()>12) {
    Ahour = map(hour()-12, 0, 12, 0, TWO_PI);
  }
  if (hour()<12) {
    Ahour = map(hour(), 0, 12, 0, TWO_PI);
  }
  if (Aminute<Ahour) {
    arc(width/2, height/2, width/4, width/4, Aminute-HALF_PI, Ahour-HALF_PI);
  }
  if (Aminute>Ahour) {
    fill(0);
    ellipse(width/2, height/2, width/4-3, width/4-3);
    fill(255);
    arc(width/2, height/2, width/4, width/4, Ahour-HALF_PI, Aminute-HALF_PI);
  }
 //hour hand and minute hand; the order of last two parameters in arc is vital! 
 //when hour hand and minute hand meets, the fill part of arc goes to wrong way
 //so i fill in white color inside the arc, and draw another black ellipse under the arc
  Asecond = map(second(), 0, 60, 0, TWO_PI);
  GoSecond=GoSecond+PI/15;
  noFill();
  stroke(0);
  strokeWeight(4);
  arc(width/2, height/2, width/1.5, width/1.5, Asecond, GoSecond);
  if (GoSecond-Asecond>TWO_PI) {
    GoSecond=GoSecond-TWO_PI;
  } 
  println(Aminute);
  println(Ahour);
  // second hand
}







//  if(second()>0&&second()<15){
//  Xminute=map(second(),0,15,0,width);
//   line(width/2,height/2,Xminute,0);
//  }
//  if(second()>15&&second()<30){
//  Yminute=map(second()-15,0,15,0,width);
//   line(width/2,height/2,width,Yminute);
//  }
//   if(second()>30&&second()<45){
//  Xminute=map(second()-30,0,15,0,width);
//   line(width/2,height/2,Xminute,height);
//  }
//    if(second()>45&&second()<60){
//  Yminute=map(second()-45,0,15,0,width);
//   line(width/2,height/2,0,Yminute);
//  }



