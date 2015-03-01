
void setup()
{
  size(500,500);
  background(0);
  noFill();
  stroke(255);
  smooth();
  translate(width/2,height/2);
  ellipse(0,0,450,450);
}

void draw()
{
  //background(255);
  translate(width/2,height/2);
  
  fill(255);
  stroke(0);
  rotate(radians(millis())*10);
  rect(0,150,150,15);
  rotate(radians(millis())*10);
  rect(0,90,150,12);
  rotate(radians(millis())*10);
  rect(0,50,100,9);
  rotate(radians(millis())*10);
  rect(0,20,50,6);
  rotate(radians(millis())*10);
  rect(0,5,20,3);
}

