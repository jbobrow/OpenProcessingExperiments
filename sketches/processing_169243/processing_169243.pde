
void setup ()
{
size(400, 400);
background (0);
}
void draw()
{
fill (255);
background (0);

pushMatrix();
//background (0)
float winkel=map (mouseX, 0, 400, 0, 2*PI);
//println(winkel)
translate (100, 100);
rotate(winkel);
rectMode (CENTER);
rect (0, 0, 100, 100);
popMatrix();

pushMatrix();
//background (0)
float winkel1=map (mouseX, 0, 400, 0, 2*PI);
//println(winkel)
translate (200, 200);
rotate(winkel1);
rectMode (CENTER);
rect (0, 0, 100, 100);
popMatrix();

pushMatrix();
//background (0)
float winkel2=map (mouseX, 0, 400, 0, 2*PI);
//println(winkel)
translate (300, 300);
rotate(winkel2);
rectMode (CENTER);
rect (0, 0, 100, 100);
popMatrix();

pushMatrix();
//background (0)
float winkel3=map (mouseX, 0, 400, 0, 2*PI);
//println(winkel)
translate (300, 100);
rotate(winkel3);
rectMode (CENTER);
rect (0, 0, 100, 100);
popMatrix();

pushMatrix();
//background (0)
float winkel4=map (mouseX, 0, 400, 0, 2*PI);
//println(winkel)
translate (100, 300);
rotate(winkel4);
rectMode (CENTER);
rect (0, 0, 100, 100);
popMatrix();
}


