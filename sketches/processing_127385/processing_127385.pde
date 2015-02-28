
int counter = 0;
void setup()
{
  size(400,400);
  background(255,0,0);
 
 strokeWeight(10);
  stroke(135,325,255);
  line(0,0,400,400);
  
  strokeWeight(3);
  stroke(23,109,390);
  line(0,0,400,30);
  
  strokeWeight(6);
  stroke(352,72,129);
  line(400,0,0,400);
  
  noStroke();
  fill(23,89,21);
  rect(50,50,40,80);
  
  ellipse(200,200,100,100);
  
  noFill();
  stroke(44,60,166);
  triangle(50,75,0,75,100,50);
  
  noStroke();
  stroke(0,0,0);
  point(107,250);
  
  arc(300,300,100,100,radians(0),radians(270));
}




