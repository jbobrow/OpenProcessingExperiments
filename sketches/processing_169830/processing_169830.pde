
void setup()
{
  size(500,500);
  background(255);
   
}

void draw()
{

  float my_sekunde = map(second(), 0,59,0,2*PI);
  
  pushMatrix();
  background(255);
  translate(width/2,height/2);
  rotate(my_sekunde);
  strokeWeight(1);
  line(0,0,0,110);
  popMatrix();
  
  float my_minute = map(minute(), 0,59,0,2*PI);
  
  pushMatrix();
  noFill();
  stroke(0);
  strokeWeight(3);
  translate(width/2,height/2);
  rotate(my_minute);
  rectMode(CENTER);
 line(0,0,0,100);
  popMatrix();
  
  float my_hour = map(hour(), 0,59,0,2*PI);
  
  pushMatrix();
  noFill();
  stroke(0);
  strokeWeight(3);
  translate(width/2,height/2);
  rotate(my_hour);
 line(0,0,0,70);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  strokeWeight(4);
  ellipse(0,0,250,250);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  strokeWeight(1);
  ellipse(0,0,270,270);
  popMatrix();
  
  pushMatrix();
  translate(250,125);
  strokeWeight(1);
  line(0,0,0,20);
  popMatrix();
  
  pushMatrix();
  translate(125,250);
  strokeWeight(1);
  line(0,0,20,0);
  popMatrix();
  
  pushMatrix();
  translate(375,250);
  strokeWeight(1);
  line(-20,0,0,0);
  popMatrix();
  
  pushMatrix();
  translate(250,375);
  strokeWeight(1);
  line(0,-20,0,0);
  popMatrix();
  
}
