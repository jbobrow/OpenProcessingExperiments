
void setup()
{
  size(300,300);
}

void draw()
{
 background(100);
float t = norm(millis(),0,700);
float f = norm(t,0,3);
f = constrain(f,0,1);
float X = lerp(5,295,f);
float Y = lerp(5,295,f);
if (millis() < 1000)
Y = 295-Y;
fill (lerpColor(color(50), color(255),f));
ellipse(X,Y,5,5);
line(5,10,300,10);
}



