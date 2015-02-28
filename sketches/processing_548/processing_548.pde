
/* Lemniscate curve */
/* processing vers.0135(Beta)*/

float x, y, z, oldX, oldY, oldZ;
float t, s;

float a = 1.0;
float b = a/1.3;

float c = 0.0;
float cc;

float d = 0.0;
float dd;

float e = 0.0;
float ee;

void setup()
{
  size(800, 600);
  smooth();
}

void draw()
{
  noStroke();
  fill(255, 0);
  rect(0, 0, width, height);

  t++;
  if (t > 360){
    t = 0;
    cc = c;
    c = random(-0.1, 0.1);

    dd = d;
    d = random(-0.1, 0.1);
  }

  x = a * sin(radians(t)) + (t * c + (360 - t) * cc) / 360;
  y = b * sin(radians(t)) * cos(radians(t)) + (t * d + (360 - t) * dd) / 360;

  translate(width/2, height/2);
  strokeWeight(1);
  stroke(1);
 
  line(x * 300, y * 300, oldX * 300, oldY * 300);
  oldX = x;
  oldY = y;
  println(x + " " + y);
}

