
void setup()
{
 
size(500, 500);
}

void draw()
{
background(183, 179, 179);
translate(width/2, height/2);
fill(255);

for (int i=0; i<360; i+=90) { // 360 Grad in 20° Schritten
pushMatrix();
rotate(radians(i)); // Um i rotieren
translate(0, 150); // Um Radius verschieben
strokeWeight(8);
rect(0, 0, 20, 20);
popMatrix();
}
pushMatrix();
 float sec = map(second(), 0, 60, 0, 360);
 rotate(radians(sec));
 fill(240, 60, 60);
 translate(0, -130);
 strokeWeight(1);
 rect(0, 0, 20, 15);
 popMatrix();

pushMatrix();
 float min = map(minute(), 0, 60, 0, 360);
 rotate(radians(min) );
 fill(240, 60, 60);
 translate(0, -90);
  strokeWeight (1);
 rect(0, 0, 15, 15);
 popMatrix();
 
 pushMatrix();
 float stunde = map(hour(), 0, 12, 0, 360);
 rotate(radians(stunde));
 fill(240, 60, 60);
 translate(0, -60);
  strokeWeight(1);
 ellipse(0, 0, 15, 15);
 popMatrix();
}
