
void setup()
{

size(500, 500);
}

void draw()
{
background(255);
translate(width/2, height/2); // In die Mitte springen

fill(143, 234, 69);


for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
pushMatrix();
rotate(radians(i)); // Um i rotieren
translate(0, 150); // Um Radius verschieben
rect(0, 0, 20, 20);
popMatrix();
}
pushMatrix();
 float sec = map(second(), 0, 60, 0, 360);
 rotate(radians(sec) );
 strokeWeight(8);
 line(0,0,100,0);
 popMatrix();

pushMatrix();
 float min = map(minute(), 0, 60, 0, 360);
 rotate(radians(min) );
  strokeWeight (8);
 line(0, 0, 100, 100);
 popMatrix();
 
pushMatrix();
 float stunde = map(hour(), 0, 12, 0, 360);
 rotate(radians(stunde));
  strokeWeight(8);
 line(0,0,90,0);
 popMatrix();

}



