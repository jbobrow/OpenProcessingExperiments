
void setup(){
  size(300,300);
}

float x_birthday = 12; // my birthday is October 12th
void draw(){
  smooth();
  strokeWeight(1);
  stroke(0);
  fill(255,0,0);
  ellipse(150,150,3*x_birthday,3*x_birthday);
  fill(255,220,0);
  ellipse(250,150,60,60);
 fill(0,255,0);
 rectMode(CENTER);
 rect(300/x_birthday,150,80,80);
 strokeWeight(2);
 stroke(255,75,0);
 line(200,114,200,186);
 strokeWeight(1);
 stroke(0);
 fill(0,0,255);
 triangle(100,150-2*x_birthday,100+2*x_birthday,150+2*x_birthday,100-2*x_birthday,150+2*x_birthday);
 
  
}

