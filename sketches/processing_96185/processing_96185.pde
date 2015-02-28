
//Loris Uzan
//Clock

int s=second();



void setup(){
  size(600,600);
}

void draw(){
  background(0);
  fill(#FF0810,120);
  stroke(#FF0810,230);
  strokeWeight(3);
  triangle(30,30,120,30,75,map(second(),0,10,75,120));
  triangle(120,30,210,30,165,map(second(),0,20,75,120));
  triangle(210,30,300,30,255,map(second(),0,30,75,120));
  triangle(300,30,390,30,345,map(second(),0,40,75,120));
  triangle(390,30,480,30,435,map(second(),0,50,75,120));
  triangle(480,30,570,30,525,map(second(),0,60,75,120));
  fill(#0070FF,120);
  stroke(#0070FF,230);
  triangle(30,30,120,30,75,map(minute(),0,10,75,120));
  triangle(120,30,210,30,165,map(minute(),0,20,75,120));
  triangle(210,30,300,30,255,map(minute(),0,30,75,120));
  triangle(300,30,390,30,345,map(minute(),0,40,75,120));
  triangle(390,30,480,30,435,map(minute(),0,50,75,120));
  triangle(480,30,570,30,525,map(minute(),0,60,75,120));
  fill(#1CFF00,120);
  stroke(#1CFF00,230);
  triangle(30,30,210,30,120,map(hour(),0,4,75,120));
  triangle(210,30,390,30,300,map(hour(),0,8,75,120));
  triangle(390,30,570,30,480,map(hour(),0,12,75,120));
}


