
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  noStroke();

  textAlign(CENTER);
  frameRate(5);
}

void draw()
{
  fill(0, 0, 0, 75);
  rect(0, 0, width, height); 
  //fill(255,255,255);
  //textSize(40);
  //text("O Holy Night", random(width),random(height));
  //ellipse(random(width),random(height), 10, 10);
  stroke(255, 255, 255);
  strokeWeight(3);

  for (int i = 0; i < 10; i = i+1)
  {
    for (int j=0; j<10; j=j+1)
    {
      point(random(i*40, (i+1)*40), random(height));
    }
  }

  fill(255, 255, 255);
  rect(0, (550-frameCount/5), width, (50+frameCount/5));

  noStroke();
}







