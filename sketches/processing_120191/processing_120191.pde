
void setup()
{
  size (500, 500);
  background (220);
}
  
void draw()
{
  background (220); 
  translate (width/2, height/2);
 
  float sek = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float std = map(hour(), 0, 12, 0, 360);
 
  pushMatrix();
  stroke (0);
  strokeWeight (1);
  rotate (radians(sek));
  translate (0, -130);
  rect (0, 0, 1, 130);
  popMatrix();
  //Sekunde
 
  pushMatrix();
  stroke (0);
  strokeWeight (3);
  rotate (radians(min));
  translate (0, -120);
  rect (0, 0, 1, 120);
  popMatrix();
  //Minute 
 
  pushMatrix();
  strokeWeight (5);
  rotate (radians(std));
  translate (0, -90);
  rect (0, 0, 1, 90);
  popMatrix();
  resetMatrix();
  //Stunde  
 
translate (width/2, height/2);
strokeWeight (2);
 
for (int h=0; h<360; h+=30)
{
  pushMatrix();
  rotate (radians(h));
  translate (0, 150);
  fill (0);
  rect (0, 0, 5, 30);
  popMatrix();
}
 
for (int m=0; m<360; m+=6)
{
  noStroke();
  pushMatrix();
  rotate (radians(m));
  translate (0, 150);
  fill (0);
  rect (0, 0, 3, 15);
  popMatrix();  
}
  
  noStroke();
  fill (50, 50, 200);
  ellipse (0, 0, 15, 15);
  
  noFill();
  stroke (50, 50, 200);
  strokeWeight (30);
  ellipse (0, 0, 400, 400);
}
