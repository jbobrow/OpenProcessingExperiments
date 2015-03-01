
void setup()
{
  size (500, 500);
  background(255);
  smooth();
}

void draw()

{

  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  fill(204, 204, 204);
  ellipse(0, 0, 300, 300);
  popMatrix();



  float current_second = map(second(), 0, 60, 0, 300);

  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  fill(255);
  ellipse(0, 0, current_second, current_second); 
  popMatrix();



  float current_minute = map(minute(), 0, 60, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  rotate(current_minute);
  noStroke();
  fill(153, 153, 153);
  ellipse(0, 180, 20, 20);
  popMatrix();



  float current_stunde = map(hour(), 0, 24, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  rotate(current_stunde);
  noStroke();
  fill(128, 128, 128);
  ellipse(0, 220, 30, 30);
  popMatrix();



  float current_millis = map(millis(), 0, 60, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(current_millis/10));
  noStroke();
  fill(current_millis/15);
  ellipse(0, 245, 5, 5); 
  popMatrix();
}
