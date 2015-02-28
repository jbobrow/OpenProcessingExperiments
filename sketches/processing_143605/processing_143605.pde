
void setup() {
size(500,500);
background(255);
noStroke();
rectMode(CENTER);
}

void draw(){
float Sekunden = map(second(), 0, 60, 0, 360);
float Minuten = map(minute(), 0, 60, 0, 360);
float Stunden = map(hour(), 0, 12, 0, 360);
background(255);
fill(0);
ellipse(250,250,490,490);
fill(255);
ellipse(250,250,470,470);
fill(0);
translate(width/2, height/2);
// Sekunden
pushMatrix();
rotate(radians(180+Sekunden));
translate(0, 90);
fill(255,0,0);
rect(0, 0, 2, 180);
popMatrix();
// Minuten
pushMatrix();
rotate(radians(180+Minuten));
translate(0, 90);
fill(0);
rect(0, 0, 3, 180);
popMatrix();
//Stunde
pushMatrix();
rotate(radians(180+Stunden));
translate(0, 55);
fill(0);
rect(0, 0, 3, 110);
popMatrix();
// Kleine
for (int i=0; i<360; i+=6)
{
pushMatrix();
rotate(radians(i));
translate(0, 223);
fill(255,0,0);
rect(0, 0, 1, 25);
popMatrix();
}
// Große
for (int i=0; i<360; i+=30)
{
pushMatrix();
rotate(radians(i));
translate(0, 220);
fill(0);
rect(0, 0, 5, 50);
popMatrix();
}

// Mittelpunkt
ellipse(0,0,15,15);
}

