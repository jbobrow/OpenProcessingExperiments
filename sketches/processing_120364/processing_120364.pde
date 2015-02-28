
void setup()
{
  size(500, 500);
  background(#f7b412);
}

void draw()
{
  background(0);
  fill(255);
  rect(250,250,250,250);
  rect(0,0,250,250);
  fill(#f7b412);
  rect(180, 180, 140, 140);
  fill(0);
  rect(230, 230, 40, 40);
  
  translate(width/2,height/2);
  for (int i=0; i<360; i+=30) {
  pushMatrix();
  rotate(radians(i));
  translate(0,200);
  stroke(0);
  fill(#f7b412);
  rect(0,0,20,20);
  popMatrix();
}

{
float min = map(minute(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(min));
stroke(0);
fill(#d8d8d8);
ellipse(0,-130,30,50);
popMatrix();

float sec = map(second(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(sec));
stroke(0);
fill(255);
ellipse(0,-165,30,50);
popMatrix();

float h = map(hour(),0,12,0,360);
pushMatrix();
rotate(radians(h));
stroke(0);
fill(140);
ellipse(0,-150,30,50);
popMatrix();
}
}
  
  
  
  
 




