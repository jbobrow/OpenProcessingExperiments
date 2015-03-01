
void setup ()
{
size(400, 400);
//ellipse (400, 400);
}
void draw()
{
background(139, 69, 19);
fill(255, 193, 193);
ellipse (200, 200, 400, 400);
fill(0);

ellipse (200, 200, 10, 10);
//fill (0);
fill (0);
rect (200, 0, 10, 50);
rect (400, 200, 50, 10);
rect (200, 400, 10, 50);
rect (0, 200, 50, 10);
//fill (0);

//ellipse rectMode(CENTER);
stroke (0);
//ellipse (200, 200);

float sekunde = map(second(),0,59,0,2*PI);

pushMatrix();
translate (width/2, height/2);
rotate(sekunde);
rectMode(CENTER);
line(0, 0, 100, 100); 
popMatrix();

float minute1=map( minute(), 0, 59, 0, 2*PI);

pushMatrix();
translate(width/2, height/2);
rotate (minute1);
rectMode(CENTER);
line (0, 0, 80, 80);
popMatrix();

float hour1=map(hour(), 0, 24, 0, 2*PI);
pushMatrix();
translate(width/2, height/2);
rotate (hour1);
rectMode(CENTER);
line (0, 0, 60, 60);
popMatrix();

}


