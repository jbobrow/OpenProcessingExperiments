
void setup ()
{
  size(500,500);
  background(0);
  smooth();
}

void draw()
{
  //background(0);
  
  pushMatrix();
  float sec = map(second(),0,60,0,360);
  println(sec);
  translate(width/2, height/2);
  rotate(radians(sec));
  rect(0,0,70,70);
  fill((255), random(255),random(255));
  popMatrix();
  
  pushMatrix();
  float min = map(minute(),0,60,0,360);
  println(min);
  translate(400,400);
  rotate(radians(min));
  rect(0,0,70,70);
  fill(random(255), random(255), (255));
  popMatrix();
  
  pushMatrix();
  float mil = map(millis(),0,1000,0,360);
  println(mil);
  translate(100,100);
  rotate(radians(mil));
  rect(0,0,70,70);
  fill(random(255),(255),random(255));
  popMatrix();
  
}
