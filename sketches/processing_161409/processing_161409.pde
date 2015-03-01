
PImage bg;
PImage star;
PFont myFont;

void setup(){
  size(1280,720);
  smooth();
  frameRate(10);
  bg=loadImage("aqbackground.png");
  star=loadImage("aqstar.png");
  myFont=loadFont("Dinreg-48.vlw");
}

void draw(){
  int myHour=hour();
  int myMinute=minute();
  int mySecond=second();
  float hourPrc=(float)myHour/24;
  float minutePrc=(float)myMinute/59;
  float secondPrc=(float)mySecond/59;
  
  float hourAngle=hourPrc*360-90;
  float minuteAngle=minutePrc*360-90;
  float secondAngle=secondPrc*360-90;
  
  float hourR=285;
  float minuteR=190;
  float secondR=100;

  float hourX= cos(radians(hourAngle))*hourR+width/2;
  float hourY= sin(radians(hourAngle))*hourR+height/2;
  float minuteX= cos(radians(minuteAngle))*minuteR+width/2;
  float minuteY= sin(radians(minuteAngle))*minuteR+height/2;
  float secondX= cos(radians(secondAngle))*secondR+width/2;
  float secondY= sin(radians(secondAngle))*secondR+height/2;
 
  pushMatrix();  
  translate(width/2,height/2);
  rotate(radians(frameCount)*-1);
  imageMode(CENTER);
  image(bg,0,0);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(frameCount));
  imageMode(CENTER);
  image(star,0,0);
  popMatrix();
 
  noFill();
  strokeWeight(2);
  stroke(255,66,0);
  ellipse(width/2,height/2,570,570);
  strokeWeight(1.5);
  stroke(255,180,0);
  ellipse(width/2,height/2,380,380);
  strokeWeight(1);
  stroke(222,255,0);
  ellipse(width/2,height/2,200,200);
  
  stroke(80);
  strokeWeight(1);
  line(hourX,hourY,minuteX,minuteY);
  line(minuteX,minuteY,secondX,secondY);
  line(secondX,secondY,width/2,height/2);

  noStroke();
  fill(255,66,0);
  ellipse(hourX,hourY,35,35);
  fill(255,180,0);
  ellipse(minuteX,minuteY,30,30);
  fill(222,255,0);
  ellipse(secondX,secondY,25,25);
  fill(80);
  ellipse(width/2,height/2,10,10);
  
  textFont(myFont);
  textAlign(CENTER,CENTER);
  fill(0);
  textSize(20);
  text(myHour,hourX,hourY-3);
  textSize(18);
  text(myMinute,minuteX,minuteY-3);
  textSize(16);
  text(mySecond,secondX,secondY-2);
  

  
  noStroke();
  textAlign(LEFT,CENTER);
  rectMode(CENTER);
  fill(255,66,0);
  rect(60,628,13,10);
  fill(255,180,0);
  rect(60,648,13,10);
  fill(222,255,0);
  rect(60,668,13,10);

  fill(80);
  text("Hour",80,625);
  text("Minute",80,645);
  text("Second",80,665);



}




