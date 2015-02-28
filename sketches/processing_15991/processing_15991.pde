
//"Nervous" Ellipse Example
//M. Kontopoulos (11.2010)


float t = 0.0;
float v = 0.0;
float step = 0.05;
void setup()
{
  size(300,300);

  noStroke();
  fill(100);
  smooth();

}
void draw()
{
  background(200);
 
  float nx = noise(millis()/600.0 +10) * 30.0;
  float ny = noise(millis()/600.0 +8) * 30.0;

  ellipse(140+nx, 140-ny, 100,100);
}

