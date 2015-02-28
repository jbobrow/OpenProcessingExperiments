
float circle;
float hours;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(255,255,255,80);
  noStroke();
  translate(width/2,height/2);
  
  //Minutes & Hours
  circle = map(minInSec(), 0, 60, 0, TWO_PI);
  fill(0);
  
  if(hour() > 12) hours = hour()-12;
  else hours = hour();
  
  float ellipseSize = map(hours,0,12,200,500);
  arc(0,0,ellipseSize,ellipseSize,-HALF_PI,circle-HALF_PI);
  fill(255);
  ellipse(0,0,175,175);
  
  //Seconds
  float secondAlpha = map(second(),0,60,0,255);
  if(second()%2 == 0) fill(0,0,0,secondAlpha);
  else fill(0);
  ellipse(0,0,176,176);
  
  //Hour Markers
   noFill();
   for(int i=0; i<12; i++){
   stroke(0,130-i*10);
   ellipse(0,0,200+i*25,200+i*25);
   }
}

float minInSec() {
  //float minutes = minute() + second()/60 gefällt Processing nicht  
  float minutes = minute();
  float seconds = second();
  seconds = seconds/60;
  minutes += seconds;
  return minutes;
}
