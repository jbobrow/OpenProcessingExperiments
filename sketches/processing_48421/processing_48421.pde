
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  //background(0, 0, 0);
  smooth();
  textAlign(CENTER);
  frameRate(random(40));
}

void draw()
{ 
  fill(255,255,255,75);
  //fill(0, 0, 0, 75);
  rect(0, 0, width, height);



  textSize(random(8, 38));
  fill(random(255), random(255), random(255));
  text("Merry Christmas!", random(width), random(height));

}

void keyPressed ()
  {
    stop();
  }


