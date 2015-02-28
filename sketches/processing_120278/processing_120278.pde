
void setup()
{
smooth();
 size(500,500);
 background(255);
}
 
void draw()
{
  frameRate(1);
  translate(width/2,height/2);
  strokeWeight(10);
  stroke(0);
  ellipse(0,0,400,400);
  
  
   
 
float sec = map(second(),0,60,0,360);
float min = map(minute(),0,60,0,360);
float std = map(hour(),0,12,0,360);
 
 
 
for (int i=0; i<360; i+=30) 
{
  pushMatrix();
  rotate(radians(i));
  translate(0, 194);
  noStroke();
  fill(255);
  rect(0, 0,10,15);
  popMatrix();
}
 
 
 
pushMatrix();
  rotate(radians(sec));
  translate(0, -150);
  noStroke();
  fill(255,0,0);
  rect(0, 0,2, 150);
  rectMode(LEFT);
popMatrix();
 
 
 
pushMatrix();
  rotate(radians(min));
  translate(0, -150);
  noStroke();
  fill(0);
  rect(0, 0,5, 150);
  rectMode(LEFT);
popMatrix();
 
pushMatrix();
  rotate(radians(std));
  translate(0, -110);
  noStroke();
  fill(0);
  rect(0, 0,10, 110);
  rectMode(LEFT);
popMatrix();

 
noStroke();
fill(0);
ellipse(0,0,30,30);
fill(255);

}

