
void setup()
{
  size(500, 500);
}
void draw()
{
  background(255);
  
  fill(180, 219, 118);
  noStroke();
  ellipse(width/2, height/2, 450, 450);
  
  fill(0);
  noStroke();
  ellipse(width/2, height/2, 30, 30);
    
  translate(width/2, height/2);
  
  float sec = map(second(), 0, 60, 0, 360);
  println(sec);
  
  pushMatrix();
  rotate(radians(sec)); // Um i rotieren
  translate(0, -190); // Um Radius verschieben
  fill(0);
  noStroke();
  rect(-1.5, 0, 3, 160);
  popMatrix();
  
  float min = map(minute(), 0, 60, 0, 360);
  println(min);
  
  pushMatrix();
  rotate(radians(min)); // Um i rotieren
  translate(0, -180); // Um Radius verschieben
  fill(0);
  noStroke();
  rect(-3.5, 0, 7, 150);
  popMatrix();
  
  float h = map(hour(), 0, 12, 0, 360);

  
  pushMatrix();
  rotate(radians(h)); // Um i rotieren
  translate(0, -130); // Um Radius verschieben
  fill(0);
  noStroke();
  rect(-3.5, 0, 7, 100);
  popMatrix();
  
  translate(0, 0); // In die Mitte springen
  for (int i=0; i<360; i+=30) { // 360 Grad in 30° Schritten
  pushMatrix();
  rotate(radians(i)); // Um i rotieren
  translate(0, -200); // Um Radius verschieben
  ellipse(0, 0, 10, 10);
  popMatrix();
  }

  
 
}
