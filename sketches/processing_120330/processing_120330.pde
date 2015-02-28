
void setup()
{
size(500, 500);

}

void draw()
{
background(255);//ohne background zeichnet es
translate(width/2,height/2);
stroke(0);
fill(0);
ellipse(0,0,20,20);

float sec = map(second(), 0,60,0,360);
float min = map(minute(), 0,60,0,360);
float std = map(hour(), 0,12,0,360);
pushMatrix();
rotate(radians(-270));
rotate(radians(sec)); // Um i rotieren
translate(-150,0); // Um Radius verschieben
rectMode(LEFT);
fill(252,8,8);
stroke(252,8,8);
strokeWeight(2);
rect(0, 0, 200, 3);
popMatrix();

pushMatrix();
rotate(radians(-90));
rotate(radians(min));
rectMode(LEFT);
fill(0);
stroke(0);
strokeWeight(2);
rect(0,0,150,3);
popMatrix();

pushMatrix();
rotate(radians(-60));
rotate(radians(std));
rectMode(LEFT);
fill(0);
stroke(0);
strokeWeight(2);
rect(0,0,100,3);
popMatrix();

stroke(0);
noFill();
ellipse(0,0,415,415);

stroke(0);
fill(0);
ellipse(0,0,20,20);

}
