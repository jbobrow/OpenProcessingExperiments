
void setup()
{
size(640,480);
background(0);
stroke(255,0,0);
strokeWeight(5);

}

void draw()

{
  strokeWeight(random(10));
  stroke (random(255), random(255), random(255));
point ( random(width), random(height));

fill(random(255), random(255), random(255));
rect(random(width), random(height), random(50), random(50));
ellipse (random (width), random(height), random(20), random(20));
}


