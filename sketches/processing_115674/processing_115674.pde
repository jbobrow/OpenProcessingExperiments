
int seconds,minutes,hours;
int days,months,years;

void setup(){
 size(500,500);
  
  }
void draw(){
  background(255,255,255);
  seconds=second();
  minutes=minute();
  hours=hour();
  days=day();
  months=month();
  years=year();
  //float s=map(second(),0,60,0,360);
  //float m=map(minute()+
   float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  println(hours+":"+minutes+":"+seconds);
 
  //minute
   pushMatrix();
  translate(width/2,height/2);
  rotate(m);
  stroke(5,61,255);
  strokeWeight(5);
  line(0,0,150,0);
  popMatrix();
  
  //hour
   pushMatrix();
  translate(width/2,height/2);
  rotate(h);
  stroke(0,0,0);
  strokeWeight(10);
  line(0,0,100,0);
  fill(255,255,255);
  ellipse(0,0,50,50);
  popMatrix();
  
  //rectangle and text
  pushMatrix();
   translate(width/2,height/2);
   rotate(-PI/2+PI/6);
  for(int i=1;i<13;i++){
  rotate(PI/6);
rectMode(CENTER);
fill(0,0,0);
rect(250,0,30,30);
//textSize(32);
//text(i,180,0);
  }
  popMatrix();
  
 pushMatrix();
 translate(width/2,height/2);
  
 for(int i=1;i<13;i++){
 textSize(40);
text(i,cos(PI/6*i-PI/2)*180-15,sin(PI/6*i-PI/2)*180);
 }
  popMatrix();
  
  //second
   pushMatrix();
  translate(width/2,height/2);
  rotate(s);
  fill(255,0,0);
  stroke(255,255,255);
  strokeWeight(1);
  ellipse(220,0,20,20);
  popMatrix();
}
