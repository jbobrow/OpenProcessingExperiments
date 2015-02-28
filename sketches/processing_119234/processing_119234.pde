
float posX = 250; 
float posY = 250; 

void setup()
{
  size(500,500);
  background(255);
  colorMode(HSB);
}
void draw()
{

  background(255);
  noStroke();
  fill(random(255),250,255,100);
  ellipse(posX,posY,30,30);
}

void mousePressed()
{
 posX = random(0,500);
 posY = random(0,500);
  
}  

