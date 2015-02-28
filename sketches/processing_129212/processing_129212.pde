
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
  noStroke();
  background(0);
translate(width/2, height/2);
fill(255,232,0);
ellipse(0,0,400,400);

for (int i=0; i<360; i+=30) 
{ 
pushMatrix();
rotate(radians(i)); 
translate(100, 100);
rect(0,0,73,73);
popMatrix();
}
fill(255);
for (int i=15; i<360; i+=30) 
{
pushMatrix();
rotate(radians(i));
translate(173, 173);
ellipse(0,0,73,73);
popMatrix();
}
for (int i=0; i<360; i+=30) 
{ 
pushMatrix();
rotate(radians(i)); 
translate(200, 200);
ellipse(0,0,73,73);
popMatrix();
}


float sek = map (second(), 0,60,0,360);
pushMatrix();
rotate (radians(sek));
stroke(0);
strokeWeight(1);
fill(255);
translate(0,-120);
line(0,0,0,120);
popMatrix();

float min = map (minute(), 0,60,0,360);
pushMatrix();
rotate (radians(min));
stroke(0);
strokeWeight(3);
translate(0,-100);
fill(255);
line(0,0,0,100);
popMatrix();

float std = map (hour(), 0,12,0,360);
pushMatrix();
rotate (radians(std));
stroke(0);
strokeWeight(5);
fill(255);
translate(0,-50);
line(0,0,0,50);
popMatrix();




}
