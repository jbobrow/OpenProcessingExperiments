
void setup()
{
  size(500,500);
  background(255);
}


void draw()
{
  background(255);
  smooth();
 
  

float Sekunden = map(second(), 0, 60, 0, 300);
float Minuten = map(minute(), 0, 60, 0, 300);
float Stunden = map(hour(), 0, 24, 0, 300);

translate(height/2, width/2);


fill(211,240,56,100);
ellipse(0,0, Sekunden, Sekunden);
//noFill();
stroke(255,150,100);
ellipse(0,0, Minuten, Minuten);
stroke(165,2,2,100);
ellipse(0,0, Stunden, Stunden);


}


