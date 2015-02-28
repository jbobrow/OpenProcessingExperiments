
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  background(255);
  
  translate(width/2, height/2); // In die Mitte springen
  for (int i=0; i<360; i+=30) { // 360 Grad in 30Â° Schritten
  pushMatrix();
  rotate(radians(i)); // Um i rotieren
  translate(0, 200); // wird von der Mitte aus um den Radius nach auÃ�en verschoben
  noStroke();
  fill(150);
  rect(0, 0, 20, 20);
  popMatrix();
  
}

//rotate(-180);

float sec = map(second(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(sec)); // Um i rotieren
translate(0, 160); // Um Radius verschieben
noStroke();
fill(#A66EE8);
ellipse(0, 0, 20, 20);
popMatrix();

pushMatrix();
float min = map(minute(), 0, 60, 0, 360);
rotate(radians(min)); // Um i rotieren
translate(0, -150); // Um Radius verschieben
noStroke();
fill(100);
rect(0, 0, 5, 150);
popMatrix();

pushMatrix();
float h = map(hour(), 0, 12, 0, 360);
rotate(radians(h)); // Um i rotieren
translate(0, -100); // Um Radius verschieben
noStroke();
fill(200);
rect(0, 0, 5, 100);
popMatrix();

fill(100);
ellipse(0,0,20,20);





}
