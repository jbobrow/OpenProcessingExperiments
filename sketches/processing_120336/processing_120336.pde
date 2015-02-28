
void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  
  stroke(0);
  fill(255);
  ellipse(width/2, height/2, 450, 450);
  fill(255);
  noStroke();
  fill(150, 150, 150);
  ellipse(width/2, height/2, 350, 350);
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  stroke(0);
  fill(255);
  
  translate(width/2, height/2);
  
  float sec = map(second(), 0, 60, 0, 360);
  pushMatrix();
  rotate(radians(sec)); // Um i rotieren
  translate(0, -150); // Um Radius zu verschieben
  fill(0);
  noStroke();
  rect(-1, 0, 2, 135);
  popMatrix();

  float minute = map(minute(), 0, 60, 0, 360);
  pushMatrix();
  rotate(radians(minute)); // Um i rotiere
  translate(0, -135); // Um Radius zu verschieben
  fill(0);
  noStroke();
  rect(-4, 0, 8, 120);
  popMatrix();
  
  float hour = map(hour(), 0, 12, 0, 360);
  pushMatrix();
  rotate(radians(hour)); // Um i rotieren
  translate(0, -115); // Um Radius zu verschieben
  fill(0);
  noStroke();
  rect(-5, 0, 10, 100);
  popMatrix();
    
  //translate(0, 0); // In die Mitte springen
  for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
  pushMatrix();
  rotate(radians(i)); // Um i rotieren
  translate(0, -200); // Um Radius verschieben
  fill(200, 50, 100);
  ellipse(0, 0, 30, 30);
  popMatrix();
  }
  
}

