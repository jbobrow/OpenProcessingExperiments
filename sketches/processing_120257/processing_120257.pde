
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  background(255);
  
  translate(width/2, height/2); // In die Mitte springen
  for (int i=0; i<360; i+=30) { // 360 Grad in 30Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â° Schritten
  
}

float sec = map(second(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(sec)); // Um i rotieren
translate(0, 200); // Um Radius verschieben
noStroke();
fill(#A66EE8);
ellipse(0, 0, 20, 20);
popMatrix();

float min = map(minute(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(min)); // Um i rotieren
translate(0, -100); // Um Radius verschieben
noStroke();
fill(100);
ellipse(0, 0, 40, 40);
popMatrix();

float h = map(hour(), 0, 12, 0, 360);
pushMatrix();
rotate(radians(h)); // Um i rotieren
translate(0, -150); // Um Radius verschieben
noStroke();
fill(200);
ellipse(0, 0, 60, 60);
popMatrix();

fill(#A66EE8);
ellipse(0,0,20,20);

/*fill(10);
rect(0, -240, 2, 20);

fill(10);
rect(0, 220, 2, 20);

fill(10);
rect(220, 0, 20, 2);

fill(10);
rect(-240, 0, 20, 2);*/


}



