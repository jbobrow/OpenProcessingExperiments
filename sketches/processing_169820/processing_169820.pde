
void setup ()
{
  size(200,200);
  background(255);
  
}
void draw()
{
translate(width/2,height/2);
rectMode(CENTER);
stroke(0);
background(255);
rect(0,0,100,100);
line(0,50,0,45);
line(0,-50,0,-45);
strokeWeight(1);
float sekunde=map(second(),0,59,0,2*PI);
float minute1=map(minute(),0,59,0,2*PI);
float stunde1=map(hour(),0,24,0,2*PI);pushMatrix();
rotate(sekunde);
line(0,0,0,-50);
popMatrix();pushMatrix();
rotate(minute1);
line(0,0,0,-40);
popMatrix();pushMatrix();
rotate(stunde1);
line(0,0,0,-30);
popMatrix();
}
