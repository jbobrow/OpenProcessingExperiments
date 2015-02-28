

long zeit1, zeit2;


void setup()
{
  size(500, 500);
  frameRate(30);
  smooth();
}


void draw()
{
  
  zeit1 = millis();
  if(zeit1 - zeit2 > 200)
  {
    stroke(random(200));
    background(255);
    zeit2 = zeit1;
    
    float punkt1 = random(width);
    float punkt2 = random(height);
    fill(255);
    bezier(punkt1, punkt2, random(width), random(height), random(width), random(height), width/2, height);
    line(punkt1, punkt2, random(width), random(height));
    line(punkt1, punkt2, random(width), random(height));
    line(punkt1, punkt2, random(width), random(height));
    fill(random(255), random(255), random(255));
    ellipse(punkt1, punkt2, random(50), random(50));
  }
}

