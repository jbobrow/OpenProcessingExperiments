
void setup()
{
  size (500, 500);
  background(255);
}

void draw()

{
  pushMatrix();
  translate(130,250);
  fill(0);
  ellipse(0,0,10,10);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  fill(204);
  ellipse(0, 0, 300, 300);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  noStroke();
fill(128,128,128);
  ellipse(0, 0, 240, 240);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  noStroke();
fill(77,77,77);
  ellipse(0, 0, 210, 210);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  fill(51);
  ellipse(0,0, 30,30);
  popMatrix();
  
   pushMatrix();
  translate(115,250);
  fill(255);
  ellipse(0,0,20,20);
  popMatrix();
  
     pushMatrix();
  translate(385,250);
  fill(255);
  ellipse(0,0,20,20);
  popMatrix();
  
      pushMatrix();
  translate(250,115);
  fill(255);
  ellipse(0,0,20,20);
  popMatrix();
  
      pushMatrix();
  translate(250,385);
  fill(255);
  ellipse(0,0,20,20);
  popMatrix();

  float current_sekunde = map(second(), 0, 60, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  rotate(current_sekunde);
stroke(255);
  line(0, 0, 5, -100);
  popMatrix();

  float current_minute = map(minute(), 0, 60, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  rotate(current_minute);
  stroke(255);
  line(0, 0, 100, -100);
  popMatrix();

  float current_stunde = map(hour(), 0, 24, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  rotate(current_stunde);
  stroke(255);
  line(0, 0, 50, -100);
  popMatrix();
  
  

}
