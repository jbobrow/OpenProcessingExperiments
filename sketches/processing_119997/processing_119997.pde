
void setup()
{
  size(500, 500);
  background(255);
}


void draw() 
{
  background(137);

  translate(width/2, height/2);


  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float std = map(hour(), 0, 12, 0, 360);


  //Sekunde
  pushMatrix();
  stroke(0);
  fill(0);
  strokeWeight(0.5);
  rotate(radians(sec));
  translate(0, -115);
  rect(0, 0, 1, 115);
  popMatrix();


  //Minute
  pushMatrix();
  stroke(255);
  strokeWeight(3);
  rotate(radians(min));
  translate(0, -113);
  rect(0, 0, 1, 113);
  popMatrix();


  //Stunde
  pushMatrix();
  strokeWeight(5);
  rotate(radians(std));
  translate(0, -70);
  rect(0, 0, 2, 70);
  popMatrix();
  resetMatrix();

translate(width/2, height/2);
strokeWeight(0.5);

for (int i=0; i<360; i+=30)
{
  pushMatrix();
  rotate(radians(i));
  translate(0, 150); 
  fill(255);
  ellipse(0, 0, 10, 10);
  popMatrix();
}

for (int i=0; i<360; i+=6)
{
  stroke(255);
  pushMatrix();
  rotate(radians(i));
  translate(0, 150); 
  fill(255);
  ellipse(0, 0, 3, 3);
  popMatrix();
  
  strokeWeight(0);
  stroke(178, 245, 104);
  fill(178, 245, 104);
  ellipse(0, 0, 15, 15);
}
}

