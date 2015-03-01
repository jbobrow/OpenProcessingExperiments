
void setup()
{
  size(500,500);
}

void draw()
{
  background(#73d6e5);
  fill(255);
  noStroke();
  ellipse(250,250,300,200);
  ellipse(200,150,100,100);
  //rotate(radians(5));
  ellipse(300,150,100,100);
  ellipse(390,198,102,100);
  ellipse(380,295,96,100);
  ellipse(297,330,100,100);
  ellipse(204,330,100,100);
  ellipse(130,290,100,100);
  ellipse(125,205,94,100);
  
  
  fill(71,74,188);
  ellipse(250,150,5,10);
  ellipse(250,350,5,10);
  ellipse(100,250,10,5);
  ellipse(400,250,10,5);
  
  //translate(width/2,height/2);
  
  float my_second = map(second(), 0, 59, 0, 2*PI);
  float my_minute = map(minute(), 0, 59, 0, 2*PI);
  float my_hour = map(hour(), 0, 12, 0, 2*PI);
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(my_second);
  fill(255,0,144);
  //fill(millis(),100.0);
  ellipse(0,200, 10,10);
  popMatrix();
  
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(my_minute);
  fill(255,216,0);
  rectMode(CENTER);
  rect(0,-50,5,100);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(my_hour);
  fill(255,162,0);
  rectMode(CENTER);
  rect(0,-25,10,50);
  popMatrix();
  
}


