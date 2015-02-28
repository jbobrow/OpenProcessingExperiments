
void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  background(0);
  
  fill(#f7b412);
  ellipse(250,250,410,410);
  fill(255);
  ellipse(250, 250, 80, 80);
  fill(0);
  ellipse(250, 250, 40, 40);
  
  translate(width/2,height/2);
  for (int i=0; i<360; i+=30) {
  pushMatrix();
  rotate(radians(i));
  translate(0,200);
  noStroke();
  fill(255);
  rect(0,0,10,10);
  popMatrix();
}

{
float min = map(minute(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(min));
stroke(0);
fill(140);
rect(0,-190,4,190);
popMatrix();

float sec = map(second(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(sec));
stroke(0);
fill(255);
rect(0,-100,4,100);
popMatrix();

float h = map(hour(),0,12,0,360);
pushMatrix();
rotate(radians(h));
stroke(0);
fill(140);
rect(0,-150,4,150);
popMatrix();
}
}
  
  
  
  
 




