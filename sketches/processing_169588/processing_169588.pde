
float mainX;
float mainY;
int d;//size
float c1;//colors
float c2;//colors

float s;//second
float m;//minute
float h;//hour
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
//from the processing "clock" example
float bkColor;//background Color

//positions
PVector hourPos;
PVector minPos;
PVector secPos;

//count system
float previousTime;
float threshold = 1000;
Boolean count = false;
int counting = 0;
float a;
float b;
float c;

void setup(){
  smooth();
  size(500, 500);
  
  mainX = width/2;
  mainY = height/2;
  
  d = min(width, height)/2;
  secondsRadius = d * 0.60;
  minutesRadius = d * 0.20;
  hoursRadius = d * 0.50;
  //from the processing "clock" example
  clockDiameter = d * 1.3;
  
  hourPos = new PVector(0,0);
  minPos = new PVector(0,0);
  secPos = new PVector(0,0);
}

void draw(){
  background(0);
  float min = norm(minute(), 0, 60);
  float hou = hour()+min;
  if (hou<=6 && hou>0){
    bkColor = map(hou, 0, 6, 0, 255);
    background(bkColor, 0, 0);
  }else if (hou>6 && hou<=11){
    bkColor = map(hou, 5, 11, 0, 255);
    background(255, bkColor, 0);
  }else if (hou>11 && hou<=15){
    bkColor = map(hou, 10, 15, 0, 255);
    background(255, 255, bkColor);
  }else if (hou>15 && hou<=19){
    bkColor = map(hou, 14, 19, 0, 255);
    background(abs(255-bkColor), abs(255-bkColor), 255);
  }else if (hou>19 && hou<=22){
    bkColor = map(hou, 18, 22, 0, 255);
    background(0, 0, abs(255-bkColor));
  }else{
    background(0);
  }
drawClock();
countColor();
  println(hour() + "|" + hou);

}


void countColor(){
  if (millis()>previousTime + threshold){
    count = !count;
    previousTime = millis();
  }
  //count
  if (count){
    fill(0,0,255);
  }else{
    fill(255,0,0);
  }
  noStroke();
  rectMode(CENTER);
  ellipse(mainX, mainY, 20, 20);
}

void drawClock(){
  c1 = map(second(),0, 60, 0, 510);
  c2 = map(second(),0, 60, 0, 255);
  
  //body of the clock
  fill(0,0,0,0);
  rectMode(CENTER);
  strokeWeight(40);
  stroke(abs(255-c1),100, 200, 230);
  //transparency allows background color to influence the clock color
  //ellipse(mainX, mainY, clockDiameter, clockDiameter);
  
  s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;//second
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;//minute
  h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;//hour
  //from the "clock" example from processing.org
  
  //hour pin
  int newHour;
  hourPos.x = mainX + cos(h) * hoursRadius;
  hourPos.y = mainY + sin(h) * hoursRadius;
  if (hour()>12){
    newHour = hour()-12;
  }else{
    newHour = hour();
  }
  noStroke();
  fill(255,c2,255,150);
  rectMode(CENTER);
  arc(mainX, mainY, hoursRadius*2, hoursRadius*2,HALF_PI*3+HALF_PI/3*newHour, HALF_PI*3+HALF_PI/3*(newHour+1));
  stroke(200,100,c2);
  strokeWeight(5);
  noFill();
  ellipse(mainX, mainY,hoursRadius*2, hoursRadius*2);
  fill(200, 100, c2);
  noStroke();
  rectMode(CENTER);
  ellipse(hourPos.x, hourPos.y, 40, 40);
  
  //minute pin
  minPos.x = hourPos.x+cos(m)*minutesRadius;
  minPos.y = hourPos.y+sin(m)*minutesRadius;
  stroke(200);
  strokeWeight(2);
  noFill();
  stroke(100,255 , abs(510-c1));
  strokeWeight(5);
  rectMode(CENTER);
  ellipse(hourPos.x, hourPos.y, minutesRadius*2, minutesRadius*2);
  fill(100,255,abs(510-c1));
  rectMode(CENTER);
  ellipse(minPos.x, minPos.y, 20, 20);
  
  //second pin
  secPos.x = minPos.x + cos(s)*secondsRadius/6;
  secPos.y = minPos.y + sin(s)*secondsRadius/6;
  noFill();
  stroke(abs(510-c1), 200, c2);
  strokeWeight(2);
  ellipse(minPos.x, minPos.y, secondsRadius/3, secondsRadius/3);
  fill(abs(510-c1), 200, c2);
  strokeWeight(2);
  rectMode(CENTER);
  ellipse(secPos.x, secPos.y, 7, 7);
}


