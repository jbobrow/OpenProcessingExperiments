
void setup ()
{
size(400, 400);

}
void draw()
{
pushMatrix();
colorMode(RGB);
background(0, 255, 127);
popMatrix();


translate(width/2, height/2);
colorMode(HSB, 360, 100, 100);
float farbe=map(second(), 0, 60, 180, 230);
fill ( farbe, 180, 320);

noStroke();
smooth();
ellipse (0,0, 400, 400);
colorMode (RGB);
fill (0, 255, 127);
noStroke();
rect (0, 200, 10, 50);
rect (-200,0, 50, 10);
rect (0, -200, 10, 50);
rect (200, 0, 50, 10);

fill(0, 255, 127);
ellipse (0, 0, 10, 10);
stroke (0, 255, 127);
strokeWeight(8);




float sekunde = map(second(),0,60,0,2*PI);
pushMatrix();
rotate(sekunde);
rectMode(CENTER);
line(0, 0, 0, -130);
println(degrees(sekunde));
popMatrix();

float minute1=map(minute(), 0, 59, 0, 2*PI);
pushMatrix();
rotate (minute1);
rectMode(CENTER);
line (0, 0, 0, -90);
println (degrees (minute1));
popMatrix();

float hour1=map(hour(), 0, 12, 0, 2*PI);
pushMatrix();
rotate (hour1);
rectMode(CENTER);
line (0, 0, 0, -70);
println (degrees (hour1));
popMatrix();

}


