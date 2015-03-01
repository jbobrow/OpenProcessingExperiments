
void setup ()
{
size(400, 400);
//ellipse (400, 400);
}
void draw()
{
background(139, 69, 19);


translate(width/2, height/2);
fill(255, 193, 193);
noStroke();
smooth();
ellipse (0,0, 400, 400);

fill (0);
noStroke();
rect (0, 200, 10, 50);
rect (-200,0, 50, 10);
rect (0, -200, 10, 50);
rect (200, 0, 50, 10);
fill(0);
ellipse (0, 0, 10, 10);
stroke (0);
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
popMatrix();

float hour1=map(hour(), 0, 12, 0, 2*PI);
pushMatrix();
rotate (hour1);
rectMode(CENTER);
line (0, 0, 0, -70);
popMatrix();

}


