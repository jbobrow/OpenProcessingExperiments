
void setup ()
{

size (500,500);



}

void draw ()
{
background(250);
stroke(0);
strokeWeight(2);
fill(random(0,250),random(0,250),random(0,250));
rect(210,200,80,60,60);
smooth();
fill(random(0,250),random(0,250),random(0,250));
rect(220,215,60,30,30);
smooth();
rect(235,215,30,30,30);
fill(random(0,250),random(0,250),random(0,250));
smooth();


}
