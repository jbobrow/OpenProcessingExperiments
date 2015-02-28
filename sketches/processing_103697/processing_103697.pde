
void setup()
{
  size(1920, 1080);
  
  for(int loopCount=0; loopCount<=40; loopCount++)
 
 {
    
   
    int r = (int) random(100, 255);
    int g = (int) random(100, 255);
    int b = (int) random(100, 255);
    
    float randomX = random(0, 1920);
    float randomY = random(0, 800);
    float randomSize = random(1, 100);
    float randomR = random(0, 255);
    float randomG = random(0, 255);
    float randomB = random(0, 255);
    drawCircle(randomX, randomY, randomSize, color(r, g, b));
    
   
  } 
}

void drawCircle(float randomX, float randomY, float randomSize, color randomColor)
{
  fill(randomColor);
  ellipse(randomX, randomY, randomSize, randomSize);
}

void draw()
{
  frameRate(900000); 
  for(int loopCount=0; loopCount<=40; loopCount++)
    

{
    int r = (int) random(100, 255);
    int g = (int) random(100, 255);
    int b = (int) random(100, 255);
    
    float randomX = random(0, 1920);
    float randomY = random(0, 1080);
    float randomSize = random(1, 100);
    float randomR = random(0, 255);
    float randomG = random(0, 255);
    float randomB = random(0, 255);
    drawCircle(randomX, randomY, randomSize, color(r, g, b));



}
    

    
  
  
  
}
