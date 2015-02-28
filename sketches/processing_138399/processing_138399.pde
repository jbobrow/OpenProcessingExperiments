
int degree = 0;

void setup(){
  size(500, 500);
  
}

void draw(){
  int seconds = second();
  int minutes = minute();
  int hours = hour();
  int days = day();
  int months = month();
  int y = year();
  
  background(255);
  noStroke();
 
 //months
  pushMatrix();
  float purpleVal = map(months, 0, 11, 0, 255);
  color monthCol = color(purpleVal, 0, purpleVal);
  fill(monthCol);
  translate(width/2, height/2);
  rotate(radians(-90));
  float monthRot = map(months, 0, 11, 0, 360);
  arc(0, 0, 500, 500, 0, radians(monthRot));
  popMatrix();
   
 //days
  pushMatrix();
  float blueVal = map(days, 0, 30, 0, 255);
  color dayCol = color(0, 0, blueVal);
  fill(dayCol);
  translate(width/2, height/2);
  rotate(radians(-90));
  float daysRot = map(days, 0, 30, 0, 360);
  arc(0, 0, 400, 400, 0, radians(daysRot));
  popMatrix();
  
 //hours
  pushMatrix();
  float tealVal = map(hours, 0, 23, 0, 255);
  color hourCol = color(0, tealVal, tealVal);
  fill(hourCol);
  translate(width/2, height/2);
  float hoursRot = map(hours, 0, 23, 0, 360*2);
  rotate(radians(-90));
  arc(0, 0, 300, 300, 0, radians(hoursRot));
  popMatrix();
  
 //minutes 
  pushMatrix();
  float greenVal = map(minutes, 0, 59, 0, 255);
  color minutesCol = color(0, greenVal,0);
  fill(minutesCol);
  translate(width/2, height/2);
  float minutesRot = map(minutes, 0, 59, 0, 360);
  rotate(radians(-90));
  arc(0, 0, 200, 200, 0, radians(minutesRot));
  popMatrix();
  
 //seconds
  pushMatrix();
  float redVal = map(seconds, 0, 59, 0, 255);
  color secondCol = color(redVal, 36, 47);
  fill(secondCol);
  translate(width/2, height/2);
  rotate(radians(-90));
  float secondsRot = map(seconds, 0, 59, 0, 360);
  arc(0, 0, 100, 100, 0, radians(secondsRot));
  popMatrix();
  
 //years
  pushMatrix();
  textSize(25);
  text("Date:" + months + "/" + days + "/" + y, 165, 475);
  popMatrix();
 //time
  pushMatrix();
  textSize(15);
  text("Time:" + hours + ":" + minutes + ":" + seconds, 210, 450);
  popMatrix();
  
  
 degree++;
 if (degree > 360){
  degree = 0;
 } 
}


