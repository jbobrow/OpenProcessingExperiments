
float randomRed;
float randomGreen;
float randomBlue;

void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);

} 
void draw() 
{
  randomRed = random(255);
  randomGreen = random(255);
  randomBlue = random(255);

  strokeWeight(3);
  
  fill(randomRed, randomGreen, randomBlue);
  stroke(randomRed, randomGreen, randomBlue);

  ellipse(mouseX, mouseY, 40, 40);  
  line(0, 0, mouseX, mouseY);
}
