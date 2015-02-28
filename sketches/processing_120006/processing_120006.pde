
void setup()
{
  size(500, 500);
}

void draw()
{ 
  background (67,87,101);

  translate(100, 250);

  ellipse(0, 0, 5, 5);

  float sec= map(second(), 0, 60, 0, 360);

  pushMatrix();
  rotate(radians(sec)); // Um i rotieren
  translate(0, -50); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
  rect(0, 0, 1, 50);
  noStroke();
  popMatrix();


  translate(150, 0);

  ellipse(0, 0, 10, 10);


  float min= map(minute(), 0, 60, 0, 360);

  pushMatrix();
  rotate(radians(min)); // Um i rotieren
  translate(0, -50); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
  rect(0, 0, 3, 50);
  popMatrix();


  translate(150, 0);

  ellipse(0, 0, 15, 15);


  float std= map(hour(), 0, 12, 0, 360);

  pushMatrix();
  rotate(radians(std)); // Um i rotieren
  translate(0, -50); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
  rect(0, 0, 5, 50);
  popMatrix();
}
