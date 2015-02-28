
void setup()
{
  size (500, 500);
  background (220);
}

void draw()
{
  background (220);
  translate (width/2, height/2);
  
    for (int s=0; s<360; s+=6)
  {
    pushMatrix();
    rotate(radians(s));
    translate (0, -200);
    noFill();
    stroke (0);
    ellipse (0, 0, 10, 10);
    popMatrix();
  }
  
  for (int m=0; m<360; m+=6)
  {
    pushMatrix();
    rotate(radians(m));
    translate (0, -150);
    noFill();
    stroke(0);
    ellipse (0, 0, 20, 20);
    popMatrix();
  }
  
    for (int h=0; h<360; h+=6)
  {
    pushMatrix();
    rotate(radians(h));
    translate (0, -100);
    noFill();
    stroke(0);
    ellipse (0, 0, 30, 30);
    popMatrix();
  }
  
  float sek = map (second(), 0, 60, 0, 360);
  float min = map (minute(), 0, 60, 0, 360);
  float std = map (hour(), 0, 12, 0, 360);
  
  pushMatrix();
  noStroke();
  fill (50, 50, 200);
  rotate (radians(sek));
  translate (0, -200);
  ellipse (0, 0, 10, 10);
  popMatrix();
  //Sekunde
  
  pushMatrix();
  noStroke();
  fill (50, 50, 200);
  rotate (radians(min));
  translate (0, -150);
  ellipse (0, 0, 20, 20);
  popMatrix();
  //Minute
  
  pushMatrix();
  noStroke();
  fill (50, 50, 200);
  rotate (radians(std));
  translate (0, -100);
  ellipse (0, 0, 30, 30);
  popMatrix();
  resetMatrix();
  //Stunde
}
